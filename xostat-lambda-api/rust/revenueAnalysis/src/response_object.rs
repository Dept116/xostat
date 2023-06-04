use serde::Serialize;


#[derive(Serialize, Debug)]
pub struct Response {
	pub req_id: String,
	pub success: bool,
	pub rows: Vec<ResultRow>,
}

#[derive(Serialize, Debug)]
pub struct ResultRow {
	game_mode: String,
	game_result: Option<GameResult>, // None if Request::group_by_match_result is false
	games: u64,
	queue_time: u64, // Microseconds - UTC
	match_time: u64, // Microseconds - UTC
	match_rewards: MatchReward,
}


#[derive(Serialize, Debug)]
pub enum GameResult {
	Win,
	Loss,
	Draw,
}

#[derive(Serialize, Debug)]
pub enum MatchReward {
	ConvertedCoins(), // TODO: Coin struct from shared-logic
	Resources(), // TODO: Vec of resource-structs from shared-logic
}