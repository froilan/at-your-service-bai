package com.ays

import java.util.Date;

abstract class ContactInfo implements Serializable {

	String contactValue
	String contactAlias = ""
	Date dateCreated
	Date lastUpdated
	
	static mapping = {
		discriminator column: "contact_type"
	}

    static constraints = {
    	contactAlias(nullable: true, blank: true)
    }
	
	String toString() {
		"${this.properties}"
	}
}
