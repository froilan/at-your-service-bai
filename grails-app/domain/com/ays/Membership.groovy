package com.ays

import java.util.Date;

class Membership {
	
	String name
	String description
	BigDecimal initialCost
	BigDecimal recurringCost
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [ features: Feature ]

    static constraints = {
    }
}
