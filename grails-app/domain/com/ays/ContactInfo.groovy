package com.ays

import java.util.Date;

class ContactInfo {

	String type
	String value
	boolean defaultContact
	Date dateCreated
	Date lastUpdated

    static constraints = {
    }

    static searchable = {
    	root false
    	type index: 'no'
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }
}
