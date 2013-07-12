package com.ays

class Affiliation implements Serializable {

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
	
	String toString() {
		"${this.properties}"
	}
}