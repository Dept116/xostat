//  Constant generated resource ID mapping
include!(concat!(env!("OUT_DIR"), "/const_gen.rs"));

#[cfg(test)]
mod test {
	use crate::resource_map::{PRICE_MAP, PriceMap};

	#[test]
	fn test() {
		assert_eq!(Some(
			&PriceMap {
				id: 1,
				amount: 100,
				name: "Scrap Metal x100",
			}
		), PRICE_MAP.get(&53))
	}
}