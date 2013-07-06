package com.ays

import java.util.Date;

class UserFeature {
	
	Feature feature
	Date endDate
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [ Profile ]
	
	static constraints = {
		endDate(nullable: true)
	}

}
