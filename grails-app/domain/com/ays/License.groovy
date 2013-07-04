package com.ays

class License {

	String number
	String area
	String authority
	Date expirationDate
	String description
	Date dateCreated
	Date lastUpdated

	static constraints = {
    }

    static belongsTo = [ Profile ]

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }
}