package com.ays

class Service {

	ServiceOfferingType serviceType
	String serviceName
	String serviceDescription
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ Profile ]

	static constraints = {
	}

	static searchable = {
		root false
		serviceType index: 'no'
		except = [ 'version', 'dateCreated', 'lastUpdated' ]
	}
}