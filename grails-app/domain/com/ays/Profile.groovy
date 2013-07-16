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
	List primaryServices = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(PrimaryService.class))
	List secondaryServices = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(SecondaryService.class))
	List differentiations = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(Differentiation.class))
	List affiliations = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(Affiliation.class))
	List awards = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(Award.class))
	List reviews
	List phoneNumbers = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(PhoneNumber.class))
	List emailAddresses = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(EmailAddress.class))
	List websites = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(Website.class))
	FacebookContactInfo facebookContactInfo
	TwitterContactInfo twitterContactInfo
	LinkedInContactInfo linkedInContactInfo
	List otherContacts = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(OtherContactInfo.class))

	static hasMany = [ primaryServices: PrimaryService,
						secondaryServices: SecondaryService,
						differentiations: Differentiation,
						affiliations: Affiliation,
						awards: Award,
						reviews: Review,
						phoneNumbers: PhoneNumber,
						emailAddresses: EmailAddress,
						websites: Website,
						otherContacts: OtherContactInfo ]
	
	static mapping = {
		primaryServices cascade:"all-delete-orphan"
		secondaryServices cascade:"all-delete-orphan"
		differentiations cascade:"all-delete-orphan"
		affiliations cascade:"all-delete-orphan"
		awards cascade:"all-delete-orphan"
		phoneNumbers cascade:"all-delete-orphan"
		emailAddresses cascade:"all-delete-orphan"
		websites cascade:"all-delete-orphan"
		otherContacts cascade:"all-delete-orphan"
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
		facebookContactInfo(nullable: true)
		twitterContactInfo(nullable: true)
		linkedInContactInfo(nullable: true)
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
