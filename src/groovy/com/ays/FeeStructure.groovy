package com.ays

enum FeeStructure {

	HOURLY("HOURLY"),
	DAILY("DAILY"),
	OTHER("OTHER")

	final String value

	FeeStructure(String value) {
		this.value = value
	}

	String toString() {
		value
	}

}