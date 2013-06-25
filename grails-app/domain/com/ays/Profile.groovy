package com.ays

import java.util.Date;

class Profile {
	
	String name
	Category category
	SubCategory subCategory
	byte[] displayPicture
	BigDecimal lowRate
	BigDecimal highRate
	boolean negotiableRate
	CompanyProfile companyProfile
	String additionalSkills
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [ contactInformation: ContactInfo, reviews: Review ]

    static constraints = {
		subCategory(nullable: true)
		displayPicture(nullable: true)
		companyProfile(nullable: true)
		additionalSkills(blank: true, nullable: true)
    }
}
