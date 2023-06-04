use serde::Deserialize;

#[derive(Deserialize, Debug)]
pub struct Request {
	#[serde(default = "default_avg")]
	aggregate: AggregateBy,

	#[serde(default = "default_true")]
	revenue_in_coin: bool,

	#[serde(default = "default_true")]
	revenue_per_hour: bool,

	/// Optionally including fuel as a resource to group by
	#[serde(default = "default_true")]
	include_fuel_as_reward: bool,

	/// Optionally subtracting the cost of fuel from the reward
	#[serde(default = "default_false")]
	include_pve_fuel_cost: bool,

	/// optionally grouping by win, lose, tie in addition to resource and
	#[serde(default = "default_false")]
	group_by_match_result: bool,

	gamemode: String,
}


#[derive(Deserialize, Debug)]
enum AggregateBy {
	Max,
	Avg,
	Total,
}

/// See `https://github.com/serde-rs/serde/issues/368`
/// as reasoning why these functions are a thing...

fn default_true() -> bool {
	true
}

fn default_false() -> bool {
	false
}

fn default_avg() -> AggregateBy {
	AggregateBy::Avg
}