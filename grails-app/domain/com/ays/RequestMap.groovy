package com.ays

import java.util.Date;

class RequestMap {

	String url
	String configAttribute
	Date dateCreated
	Date lastUpdated

	static mapping = {
		cache true
	}

	static constraints = {
		url blank: false, unique: true
		configAttribute blank: false
	}
}
