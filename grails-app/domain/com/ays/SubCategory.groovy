package com.ays

import java.util.Date;

class SubCategory {

	String subCategoryName
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ category: Category ]

    static constraints = {
		subCategoryName(unique: 'category')
    }

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }

    String toString() { subCategoryName }
}
