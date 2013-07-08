package com.ays

import java.io.Serializable;

class License implements Serializable{

	String licenseNumber
	String licenseArea
	String licenseAuthority
	Date licenseExpirationDate
	String licenseDescription
	Date dateCreated
	Date lastUpdated

	static constraints = {
		licenseExpirationDate(nullable: true)
    }

    static belongsTo = [ Profile ]

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated', 'licenseExpirationDate' ]
    }
}