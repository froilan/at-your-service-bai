package com.ays

class Category {
	
	String name
	Date dateCreated
	Date lastUpdated

    static constraints = {
		name(unique: true)
    }
}
