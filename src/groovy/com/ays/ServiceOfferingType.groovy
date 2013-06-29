package com.ays

enum ServiceOfferingType {

	PRIMARY("PRIMARY"),
	SECONDARY("SECONDARY")

	final String type

	private ServiceOfferingType(String type) {
		this.type = type
	}

	String toString() { type }

}