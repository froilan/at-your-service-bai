package com.ays

import java.util.Date;

class Differentiation implements Serializable {
	
	String differentiationKeywords
	String differentiationDescription
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
