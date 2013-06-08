package com.aysb

class Review {
	
	BigDecimal rating
	String remarks
	Employer postedBy
	
	static belongsTo = [ employee: Employee ]

    static constraints = {
    }
}
