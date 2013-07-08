package com.ays

import java.io.Serializable;
import java.util.Date;

class SubCategory implements Serializable{

	String name
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ category: Category ]

    static constraints = {
		name(unique: 'category')
    }

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }

    String toString() { name }
}
