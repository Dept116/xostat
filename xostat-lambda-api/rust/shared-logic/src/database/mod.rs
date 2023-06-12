use std::sync::{Arc, Mutex};
use crate::get_db_url;

use sqlx::{Connection, PgConnection};
use lambda_runtime::{Error};


/// Either query the DB directly through the `get_connection` function, or through provided methods
#[derive(Debug)]
pub struct Database {
	db_url: String,
	connection: Arc<Mutex<PgConnection>>,
}

impl Database {
	pub async fn connect_from_env() -> Result<Self, Error> {
		let db_url = get_db_url()?;
		Ok(
			Self {
				connection: Arc::new(Mutex::new( PgConnection::connect(&db_url).await?)),
				db_url,
			}
		)
	}
	pub fn get_connection(&self) -> Arc<Mutex<PgConnection>> {
		return self.connection.clone();
	}
}