package com.ays

import java.util.Date;

class CompanyProfile implements Serializable {

	String companyName
	String description
	byte[] logo
	CompanySize companySize
	CompanyAge companyAge
	Address address
	String directionsToAddress
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ Profile ]
	
	static embedded = [ 'address' ]

	static hasMany = [ contactInformation: ContactInfo,
						photos: PlaceOfBusinessPhoto ]

    static constraints = {
		logo(nullable: true)
		address(blank: true, nullable: true)
		directionsToAddress(blank: true, nullable: true)
    }

    static searchable = {
    	root false
    	companyName boost: 2.0
    	logo index: 'no'
		address component: true
		companySize index: 'no'
		companyAge index: 'no'
    	except = [ 'version', 'dateCreated', 'lastUpdated' ]
    }
	
	String toString() {
		"${this.properties}"
	}
	
}
