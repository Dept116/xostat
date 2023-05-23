use std::env;
use std::env::{var, VarError};
use lambda_runtime::{service_fn, Error, LambdaEvent};
use serde::{Deserialize, Serialize};
use sqlx::{Connection, Postgres, query};

/// This is also a made-up example. Requests come into the runtime as unicode
/// strings in json format, which can map to any structure that implements `serde::Deserialize`
/// The runtime pays no attention to the contents of the request payload.
#[derive(Deserialize)]
struct Request {
}

/// This is a made-up example of what a response structure may look like.
/// There is no restriction on what it can be. The runtime requires responses
/// to be serialized into json. The runtime pays no attention
/// to the contents of the response payload.
#[derive(Serialize)]
struct Response {
	req_id: String,
	msg: String,
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
	let mut db = sqlx::PgConnection::connect(&get_db_url().unwrap()).await.unwrap();
	let row = query!("SELECT count(id) FROM matches")
		.fetch_one(&mut db)
		.await.unwrap();


	// prepare the response
	let resp = Response {
		req_id: event.context.request_id,
		msg: format!("There are {} matches in the DB", row.count.unwrap()),
	};

	Ok(resp)
}

fn get_db_url() -> Result<String, VarError> {
	let host = var("DB_HOST")?;
	let port = var("DB_PORT")?;
	let name = var("DB_NAME")?;
	let user = var("DB_USER")?;
	let pass = var("DB_PASSWORD")?;
	Ok(format!("postgresql://{user}:{pass}@{host}:{port}/{name}"))
}