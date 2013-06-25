package com.ays

import java.util.Date;

class CompanyProfile {
	
	String name
	String description
	byte[] logo
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [ Profile ]
	
	static hasMany = [ contactInformation: ContactInfo ]

    static constraints = {
		logo nullable: true
    }
}
