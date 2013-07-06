package com.ays

import java.util.Date;

class CompanyProfile {

	String companyName
	String description
	byte[] logo
	Integer inBusinessSince
	String address
	String directionsToAddress
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ Profile ]

	static hasMany = [ contactInformation: ContactInfo,
						photos: PlaceOfBusinessPhoto ]

    static constraints = {
		logo(nullable: true)
		inBusinessSince(blank: true, nullable: true)
		address(blank: true, nullable: true)
		directionsToAddress(blank: true, nullable: true)
    }

    static searchable = {
    	root false
    	companyName boost: 2.0
    	logo index: 'no'
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }
}
