package com.ays

import org.apache.commons.lang.StringUtils;

class Affiliation implements Serializable {

	String affiliationName
	String affiliationRole
	Date dateCreated
	Date lastUpdated
	boolean deleted
	
	static transients = [ 'deleted' ]

	static belongsTo = [ Profile ]

	static constraints = {
    }

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }
	
	String toString() {
		"${this.properties}"
	}
	
	boolean isEmpty() {
		StringUtils.isBlank(affiliationName) && StringUtils.isBlank(affiliationRole)
	}
}