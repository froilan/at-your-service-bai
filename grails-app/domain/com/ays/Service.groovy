package com.ays

class Service {

	ServiceOfferingType type
	String name
	String description
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ Profile ]

	static constraints = {
	}

	static searchable = {
		root false
		type index: 'no'
		except = [ 'version', 'dateCreated', 'lastUpdated' ]
	}
}