package com.ays

enum FeeStructureType {

	HOURLY("HOURLY"),
	DAILY("DAILY"),
	OTHER("OTHER")

	final String value

	FeeStructureType(String value) {
		this.value = value
	}

	String toString() {
		value
	}

}