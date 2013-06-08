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
	byte[] photo
	CompanyProfile companyProfile
	
	static hasMany = [clients : Client]
    static constraints = {
		name nullable: false, blank: false
		contactNumber nullable: false, blank:false
		location nullable: false, blank:false 
		highRate nullable: true, blank:true
		lowRate nullable: true, blank:true
		companyProfile nullable: true, blank:true
    }
}
