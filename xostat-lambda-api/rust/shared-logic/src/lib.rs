use std::env::{var, VarError};

pub mod resource_map;

pub fn get_db_url() -> Result<String, VarError> {
	let host = var("DB_HOST")?;
	let port = var("DB_PORT")?;
	let name = var("DB_NAME")?;
	let user = var("DB_USER")?;
	let pass = var("DB_PASSWORD")?;
	Ok(format!("postgresql://{user}:{pass}@{host}:{port}/{name}"))
}