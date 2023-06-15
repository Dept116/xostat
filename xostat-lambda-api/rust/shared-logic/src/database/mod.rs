use std::ops::DerefMut;
use std::sync::{Arc};
use crate::get_db_url;

use sqlx::{Connection, PgConnection, query};
use lambda_runtime::{Error};
use tokio::sync::Mutex;
use tracing::info;
use crate::coins::Coins;


/// Either query the DB directly through the `get_connection` function, or through provided methods
#[derive(Debug)]
pub struct Database {
	#[allow(dead_code)] // Not sure when this might be useful, but we can keep it around
	db_url: String,
	connection: Arc<Mutex<PgConnection>>,
}

impl Database {
	#[tracing::instrument(level = "info")]
	pub async fn connect_from_env() -> Result<Self, Error> {
		let db_url = get_db_url()?;

		info!("Fetching DB connection");
		let connection = PgConnection::connect(&db_url).await?;
		info!("Connected to DB");
		Ok(
			Self {
				connection: Arc::new(Mutex::new(connection)),
				db_url,
			}
		)
	}
	pub fn get_connection(&self) -> Arc<Mutex<PgConnection>> {
		return self.connection.clone();
	}

	#[tracing::instrument(level = "info")]						// id
	pub async fn query_latest_resource_prices(&self) -> Result<Vec<(usize, Coins)>, Error> {
		let db_connection = self.get_connection();

		let q = query!( // language=postgresql
			"SELECT resource_id, price
			 FROM xodat.public.resource_prices
        	 NATURAL JOIN
     			(SELECT MAX(id) AS id
     			 FROM xodat.public.resource_prices
      			 GROUP BY resource_id) AS _
			")
			.fetch_all(
				db_connection.lock().await.deref_mut() // Temporarily lock and execute on database, releases right after insertion
			).await?;

		// Maps the collection of rows to the expected struct
		Ok(q.iter().map(|row| (row.resource_id as usize, Coins::from_real(row.price))).collect())
	}
}