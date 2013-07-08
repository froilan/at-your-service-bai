package com.ays

class Category implements Serializable{

	String name
	Date dateCreated
	Date lastUpdated

    static constraints = {
		name(unique: true)
    }

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }

    String toString() { name }
}
