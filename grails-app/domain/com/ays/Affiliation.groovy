package com.ays

class Affiliation implements Serializable{

	String name
	String role
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