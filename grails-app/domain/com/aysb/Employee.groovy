package com.aysb

class Employee {

	String name
	String contactNumber
	String email
	String location
	String category
	String subCategory
	String skills
	Boolean negotiableRate
	BigDecimal highRate
	BigDecimal lowRate
	BigDecimal rating
	byte[] photo
	String imageType
	CompanyProfile companyProfile
	
	static hasMany = [clients : Client, reviews: Review]
    static constraints = {
		name nullable: false, blank: false
		contactNumber nullable: false, blank:false
		location nullable: false, blank:false 
		highRate nullable: true, blank:true
		lowRate nullable: true, blank:true
		category nullable:true, blank: true, inList:["Accountant", "Doctors", "Legal Services", "Nurses", "Bookkeepers", "Caretakes", "Gardener", "Contractors", "Lawyers"]
		subCategory nullable:true, blank: true, inList:["SubCatA", "SubCatB", "SubCatC"]
		companyProfile nullable: true, blank:true
		rating nullable:true, blank:true
		photo nullable:true, blank:true
		imageType nullable:true, blank:true
    }
	
	BigDecimal getAverageRating() {
		BigDecimal total = BigDecimal.ZERO;
		reviews.each { review ->
			if (review.rating != null) {
				total = total.plus(review.rating)
			}
		}
		
		BigDecimal average = null;
		if (!BigDecimal.ZERO.equals(total)) {
			average = total.divide(reviews.size())
		}
		
		return average
	}
	
	public String toString(){
		return name
	} 
}
