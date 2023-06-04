use std::collections::HashMap;
use std::env;
use std::env::{var, VarError};

use lambda_runtime::{Error, LambdaEvent, service_fn};
use serde::{Deserialize, Serialize};
use serde_json::from_str;
use sqlx::{Connection, Postgres, query};
use sqlx::postgres::PgQueryResult;
use tracing::{event, info, info_span};

use shared_logic::get_db_url;

use crate::request_object::Request as RequestObject;

mod request_object;

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

pub(crate) async fn handler(event: LambdaEvent<RequestObject>) -> Result<Response, Error> {

	// prepare the response
	let resp = Response {
		req_id: event.context.request_id,
		success: true,
	};

	Ok(resp)
}