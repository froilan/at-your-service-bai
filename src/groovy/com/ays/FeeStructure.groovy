package com.ays

enum FeeStructure {

	HOURLY("hourly"),
	DAILY("daily"),
	OTHER("other")

	final String value

	private FeeStructure(String value) {
		this.value = value
	}

	String toString() { value }
	
	String getDisplayValue() {
		if (this == HOURLY) {
			return "/ hour"
		} else if (this == DAILY) {
			return "/ day"
		} else {
			return ""
		}
	}

}