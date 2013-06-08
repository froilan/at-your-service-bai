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
	
	static hasMany = [clients : Client]
    static constraints = {
		name nullable: false, blank: false
		contactNumber nullable: false, blank:false
		location nullable: false, blank:false 
		highRate nullable: true, blank:true
		lowRate nullable: true, blank:true
		category nullable:true, blank: true, inList:["CatA", "CatB", "CatC"]
		subCategory nullable:true, blank: true, inList:["SubCatA", "SubCatB", "SubCatC"]
		companyProfile nullable: true, blank:true
		rating nullable:true, blank:true
		photo nullable:true, blank:true
		imageType nullable:true, blank:true
    }

	public String toString(){
		return name
	} 
}
