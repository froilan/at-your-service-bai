package com.ays

import java.io.Serializable;

class License implements Serializable{

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