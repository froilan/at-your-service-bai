package com.ays

class Category {

	String categoryName
	Date dateCreated
	Date lastUpdated

    static constraints = {
		categoryName(unique: true)
    }

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }

    String toString() { categoryName }
}
