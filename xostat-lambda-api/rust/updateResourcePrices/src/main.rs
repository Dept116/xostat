use std::collections::HashMap;
use std::ops::DerefMut;
use std::time::Duration;

use lambda_runtime::{Error, LambdaEvent, service_fn};
use serde::{Deserialize, Serialize};
use serde_json::from_str;
use sqlx::{Connection, query};
use sqlx::postgres::PgQueryResult;
use tokio::sync::MutexGuard;
use tracing::info;
use shared_logic::database::Database;

use shared_logic::get_db_url;

#[derive(Deserialize, Debug)]
struct Prices {
	/// ID as stored in this projects DB in the `resources` table
	id: u32,
	#[serde(rename = "sellPrice")]
	/// Price stored as 100x multiple of coin to avoid Real numbers
	sell_price: f64,
}

#[derive(Deserialize)]
struct Request {}


#[derive(Serialize)]
struct Response {
	req_id: String,
	success: bool,
}

#[tokio::main]
async fn main() -> Result<(), Error> {
	// required to enable CloudWatch error logging by the runtime
	tracing_subscriber::fmt()
		.with_max_level(tracing::Level::INFO)
		// disable printing the name of the module in every log line.
		.with_target(false)
		// this needs to be set to false, otherwise ANSI color codes will
		// show up in a confusing manner in CloudWatch logs.
		.with_ansi(false)
		// disabling time is handy because CloudWatch will add the ingestion time.
		.without_time()
		.init();

	let func = service_fn(handler);
	lambda_runtime::run(func).await?;
	Ok(())
}

pub(crate) async fn handler(event: LambdaEvent<Request>) -> Result<Response, Error> {
	info!("Requesting prices from crossoutdb");
	let request = reqwest::ClientBuilder::new()
		.timeout(Duration::from_secs(5))
		.build()?;
	let xodb_prices = request.get("https://crossoutdb.com/api/v1/items?category=Resources")
		.send()
		.await?;
	let response_body: Vec<Prices> = from_str(&xodb_prices.text().await?)?;
	info!("Decoded prices from crossoutdb");

	// K = DB-id of resource
	// V= best price/unit
	let mut map: HashMap<u32, f64> = HashMap::new();

	// Only keep highest possible sell price per resource
	// Only indexed resources from `xostat-lambda-api/devops/static_assets/resources_xodb_id_mapping.csv` will be updated
	for price in response_body {
		if let Some(mapped) = shared_logic::resource_map::PRICE_MAP.get(&price.id) {
			let price_per_unit = price.sell_price / 100.0 / mapped.amount as f64; // Price stored as multiple of 100
			if let Some(prev_price) = map.get(&mapped.id) {
				if *prev_price < price_per_unit {
					map.insert(mapped.id, price_per_unit);
				}
			} else {
				map.insert(mapped.id, price_per_unit);
			}
		}
	}
	info!("Calculated best sell-prices currently available");

	let db = Database::connect_from_env().await?;
	let db_connection = db.get_connection(); // Copy connection out of pool

	for (id, price) in map.iter() {
		let q: PgQueryResult = query!("
					INSERT INTO xodat.public.resource_prices (id, resource_id, price)
					VALUES (NOW(), $1, $2)
					", *id as i32, price)
			.execute(
				db_connection.lock().await.deref_mut() // Temporarily lock and execute on database, releases right after insertion
			)
			.await?;
		info!("Inserted price {price} for resource-id {id}\t {} rows affected", q.rows_affected());
	}

	// prepare the response
	let resp = Response {
		req_id: event.context.request_id,
		success: true,
	};

	Ok(resp)
}