package com.ays

import java.util.Date;

class Profile {

	String name
	Category category
	SubCategory subCategory
	byte[] displayPicture
	BigDecimal askingFee
	FeeStructure feeStructure
	CompanyProfile companyProfile
	String differentiation	// format: title | description
	License license
	Date dateCreated
	Date lastUpdated

	static hasMany = [ contactInformation: ContactInfo,
						services: Service,
						affiliations: Affiliation,
						awards: Award,
						reviews: Review ]

	static embedded = [ 'feeStructure', 'license' ]

    static constraints = {
		subCategory(nullable: true)
		displayPicture(nullable: true)
		companyProfile(nullable: true)
		license(nullable: true)
		differentiation(blank: true, nullable: true)
    }
}
