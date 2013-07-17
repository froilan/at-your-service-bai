package com.ays

import java.util.Date;

import org.apache.commons.lang.StringUtils;

abstract class ContactInfo implements Serializable {

	String contactValue
	String contactAlias = ""
	Date dateCreated
	Date lastUpdated
	boolean deleted
	
	static transients = [ 'deleted' ]
	
	static mapping = {
		discriminator column: "contact_type"
	}

    static constraints = {
    	contactAlias(nullable: true, blank: true)
    }
	
	String toString() {
		"${this.properties}"
	}
	
	boolean isEmpty() {
		StringUtils.isBlank(contactValue) && StringUtils.isBlank(contactAlias)
	}
}
