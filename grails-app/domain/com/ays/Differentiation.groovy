package com.ays

import java.util.Date;

import org.apache.commons.lang.StringUtils;

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
	
	boolean isEmpty() {
		StringUtils.isBlank(differentiationKeywords) && StringUtils.isBlank(differentiationDescription)
	}
}
