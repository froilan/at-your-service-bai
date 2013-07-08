package com.ays

import java.util.Date;

class Profile implements Serializable{

	String firstName
	String lastName
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

	static transients = [ 'averageRating', 'businessName' ]

	static searchable = {
		except = [ 'version', 'dateCreated', 'lastUpdated' ]
		firstName boost: 2.0
		lastName boost: 2.0
		category component: true
		subCategory component: true
		companyProfile component: true
		license component: true
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

    BigDecimal getAverageRating() {
		BigDecimal total = BigDecimal.ZERO;
		reviews.each { review ->
			total = total.plus(review.rating)
		}
		
		BigDecimal average = null;
		if (!BigDecimal.ZERO.equals(total)) {
			average = total.divide(reviews.size())
		}
		
		return average
    }
	
	String getBusinessName() {
		if (companyProfile?.companyName) {
			return companyProfile.companyName
		}
		return "${lastName}, ${firstName}"
	}
}
