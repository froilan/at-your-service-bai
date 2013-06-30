package com.ays

class Award {

	String name
	Integer year
	String description
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ Profile ]

	static constraints = {
    }

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }
}