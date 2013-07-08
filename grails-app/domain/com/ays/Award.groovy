package com.ays

import java.io.Serializable;

class Award implements Serializable{

	String awardName
	Integer awardYear
	String awardDescription
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ Profile ]

	static constraints = {
		awardDescription(nullable: true, blank: true)
    }

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }
}