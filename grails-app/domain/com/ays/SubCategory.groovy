package com.ays

import java.io.Serializable;
import java.util.Date;

class SubCategory implements Serializable{

	String subCategoryName
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ category: Category ]

    static constraints = {
		subCategoryName(unique: 'category')
    }

    static searchable = {
    	root false
		category component: true
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }

    String toString() { subCategoryName }
}
