package com.ays

class Affiliation {

	String affiliationName
	String affiliationRole
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