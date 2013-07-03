package com.ays

import java.util.Date;

class Profile {

	String name
	Category category
	SubCategory subCategory
	byte[] displayPicture
	FeeStructure feeStructure
	BigDecimal askingFee
	CompanyProfile companyProfile
	String differentiation	// format: title | description
	License license
	Date dateCreated
	Date lastUpdated

	static hasMany = [ contacts: ContactInfo,
						services: Service,
						affiliations: Affiliation,
						awards: Award,
						reviews: Review ]

	static transients = [ 'rating' ]

	static searchable = {
		except = [ 'version', 'dateCreated', 'lastUpdated' ]
		name boost: 2.0
		category component: true
		subCategory component: true
		companyProfile component: true
		license component: true
		contacts component: true
		services component: true
		affiliations component: true
		awards component: true
		displayPicture index: 'no'
	}

    static constraints = {
		subCategory(nullable: true)
		displayPicture(nullable: true)
		companyProfile(nullable: true)
		license(nullable: true)
		differentiation(blank: true, nullable: true)
		feeStructure(nullable: true)
    }

    BigDecimal getRating() {
    	// TODO
    	BigDecimal.ZERO
    }
}
