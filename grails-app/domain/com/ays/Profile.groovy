package com.ays

import java.util.Date;
import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;

class Profile implements Serializable {

	String firstName
	String lastName
	SubCategory subCategory
	byte[] displayPicture
	FeeStructure feeStructure
	BigDecimal askingFee
	Boolean rateNegotiable
	CompanyProfile companyProfile
	License license
	Date dateCreated
	Date lastUpdated
	List contacts
	//List services
	List primaryServices = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(PrimaryService.class))
	List secondaryServices = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(SecondaryService.class))
	List differentiations
	List affiliations
	List awards
	List reviews

	static hasMany = [ contacts: ContactInfo,
						services: Service,
						primaryServices: PrimaryService,
						secondaryServices: SecondaryService,
						differentiations: Differentiation,
						affiliations: Affiliation,
						awards: Award,
						reviews: Review ]
	
	static mapping = {
		primaryServices cascade:"all-delete-orphan"
	}

	static transients = [ 'averageRating', 'businessName' ]

	static searchable = {
		except = [ 'version', 'dateCreated', 'lastUpdated' ]
		firstName boost: 2.0
		lastName boost: 2.0
		subCategory component: true
		companyProfile component: true
		license component: true
		primaryServices component: true
		secondaryServices component: true
		affiliations component: true
		awards component: true
		displayPicture index: 'no'
		feeStructure index: 'no'
		askingFee index: 'no'
		rateNegotiable index: 'no'
	}

    static constraints = {
		subCategory(nullable: true)
		displayPicture(nullable: true)
		companyProfile(nullable: true)
		rateNegotiable(nullable: true)
		license(nullable: true)
		feeStructure(nullable: true)
    }
	
	String toString() {
		"${this.properties}"
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
