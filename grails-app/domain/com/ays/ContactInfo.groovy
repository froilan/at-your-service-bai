package com.ays

import java.util.Date;

class ContactInfo implements Serializable{

	ContactInfoType type
	String value
	String name
	Date dateCreated
	Date lastUpdated

    static constraints = {
    	name(nullable: true, blank: true)
    }

    static searchable = {
    	root false
    	type index: 'no'
    	name index: 'no'
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }
}
