package com.ays

import java.util.Date;

class SubCategory {
	
	String name
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [ category: Category ]

    static constraints = {
		name(unique: 'category')
    }
}
