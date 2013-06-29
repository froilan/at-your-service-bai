package com.ays

class Service {

	String type
	String name
	String description

	static belongsTo = [ Profile ]

	static constraints = {
	}
}