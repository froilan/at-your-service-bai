package com.ays

import java.util.Date;

class ContactInfo implements Serializable {

	ContactInfoType contactType
	String contactValue
	String contactAlias
	Date dateCreated
	Date lastUpdated

    static constraints = {
    	contactAlias(nullable: true, blank: true)
    }
	
	String toString() {
		"${this.properties}"
	}
}
