package com.ays

import java.util.Date;

class CompanyProfile {

	String name
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
}
