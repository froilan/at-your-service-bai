package com.ays

import java.util.Date;

import org.apache.commons.lang.StringUtils;

class Differentiation implements Serializable {
	
	String differentiationKeywords
	String differentiationDescription
	Date dateCreated
	Date lastUpdated
	boolean deleted
	
	static transients = [ 'deleted' ]
	
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
	
	boolean isIncomplete() {
		(StringUtils.isBlank(differentiationKeywords) && StringUtils.isNotBlank(differentiationDescription) ||
			StringUtils.isNotBlank(differentiationKeywords) && StringUtils.isBlank(differentiationDescription))
	}
}
