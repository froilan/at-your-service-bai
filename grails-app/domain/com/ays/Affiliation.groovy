package com.ays

class Affiliation {

	String name
	String role

	static belongsTo = [ Profile ]

	static constraints = {
    }
}