package com.ays

class Review {

	BigDecimal rating
	String remarks
	SiteUser ratedBy
	Date dateCreated

	static belongsTo = [ Profile ]

    static constraints = {
    }
}
