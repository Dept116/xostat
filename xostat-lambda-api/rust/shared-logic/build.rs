use std::collections::HashMap;
use std::fs::{read, read_to_string};
use std::str::FromStr;
use std::path::Path;
use const_gen::*;

#[derive(CompileConst)]
struct PriceMap {
	pub id: u32,
	pub amount: u32,
	pub name: String,
}

fn main() {
	let mapping = read_to_string("../../devops//static_assets/resources_xodb_id_mapping.csv").unwrap();
	let csv = mapping.lines()
		.skip(1)
		.map(|line| {
			let mut cols = line.split(",");
			(
				u32::from_str(cols.next().unwrap()).unwrap(), // xodat_id
				u32::from_str(cols.next().unwrap()).unwrap(), // xodb_id
				u32::from_str(cols.next().unwrap()).unwrap(), // amount
				cols.next().unwrap().replace("\"", ""), // name
			)
		}).collect::<Vec<_>>();

	let mut map = HashMap::new();

	for (xodat_id, xodb_id, amount, name) in csv {
		map.insert(xodb_id, PriceMap {
			id: xodat_id,
			amount,
			name: name,
		});
	}


	// Join individual definitions together
	let const_declarations = vec![
		const_definition!(#[derive(Debug, Eq, PartialEq, Clone)] pub PriceMap),
		const_declaration!(pub  PRICE_MAP = map),
	];


	let out_dir = std::env::var_os("OUT_DIR").unwrap();
	let dest_path = Path::new(&out_dir).join("const_gen.rs");
	std::fs::write(&dest_path, const_declarations.join("\n")).unwrap(); // write static source code definitions

	println!("cargo:rerun-if-changed=build.rs");
}