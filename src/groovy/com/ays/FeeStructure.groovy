package com.ays

enum FeeStructure {

	HOURLY("Hourly Rate"),
	DAILY("Daily Rate"),
	WEEKLY("Weekly Rate"),
	MONTHLY("Monthly Rate"),
	ANNUAL("Annual Rate"),
	BID("Bid / Proposals only")

	final String value

	private FeeStructure(String value) {
		this.value = value
	}

	String toString() { value }
	
	String getUnit() {
		if (this == HOURLY) {
			return "hour"
		} else if (this == DAILY) {
			return "day"
		} else if (this == WEEKLY) {
			return "week"
		} else if (this == MONTHLY) {
			return "month"
		} else if (this == ANNUAL) {
			return "year"
		} else {
			return "bid"
		}
	}

}