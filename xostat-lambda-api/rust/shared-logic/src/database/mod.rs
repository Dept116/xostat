use std::sync::{Arc};
use crate::get_db_url;

use sqlx::{Connection, PgConnection};
use lambda_runtime::{Error};
use tokio::sync::Mutex;
use tracing::info;


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

	pub async fn query_latest_resource_prices(&self) {

	}
}