use std::fmt::{Display, Formatter};
use serde::{Serialize, Serializer};

pub const TAX_PERCENT: f64 = 0.1; // 10%
pub const INV_TAX_PERCENT: f64 = 1.0 - TAX_PERCENT;


#[derive(Debug, Copy, Clone, Ord, PartialOrd, Eq, PartialEq)]
pub struct Coins {
	cents: u64, // Stored in multiple of 100
}


impl Coins {
	pub fn from_cents(cents: u64) -> Self {
		Self {
			cents,
		}
	}

	pub fn to_cents(&self) -> u64 {
		self.cents
	}

	/// Takes decimal coin value
	pub fn from_real(real: f64) -> Self {
		Self {
			cents: ((real / 100.0).round() as _),
		}
	}

	/// Returns decimal coin value
	pub fn to_real(&self) -> f64 {
		self.cents as f64 / 100.0
	}

	/// Applies the 10% tax rate
	pub fn tax(&mut self) {
		// Items sold for equal or less than 1.1 coins have a fixed tax rate of 0.01
		if self.to_real() * TAX_PERCENT < 0.01 {
			self.cents -= 1
		} else {
			self.cents = (self.to_real() * INV_TAX_PERCENT * 100.0).floor() as _;
		}
	}
}


impl Display for Coins {
	fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
		write!(f, "{}", (self.cents as f64) / 100.0)
	}
}

impl Serialize for Coins {
	fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error> where S: Serializer {
		serializer.serialize_f64(self.to_real())
	}
}