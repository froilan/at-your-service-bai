package com.ays

class Award {

	String name
	Integer year
	String description

	static belongsTo = [ Profile ]

	static constraints = {
    }
}