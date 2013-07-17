package com.ays

import java.io.Serializable;

import org.apache.commons.lang.StringUtils;

class Award implements Serializable {

	String awardName
	Integer awardYear
	String awardDescription
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ Profile ]

	static constraints = {
		awardDescription(nullable: true, blank: true)
    }

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }
	
	String toString() {
		"${this.properties}"
	}
	
	boolean isEmpty() {
		StringUtils.isBlank(awardName) && StringUtils.isBlank(awardDescription) && awardYear == null
	}
}