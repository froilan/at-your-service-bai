package com.ays

import java.util.Date;

class UserMembership {
	
	Membership membership
	Date endDate
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [ Profile ]
	
	static constraints = {
		endDate(nullable: true)
	}

}
