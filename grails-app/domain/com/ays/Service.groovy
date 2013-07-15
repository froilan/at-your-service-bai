package com.ays

import java.io.Serializable;

abstract class Service implements Serializable {

	String serviceName
	String serviceDescription
	Date dateCreated
	Date lastUpdated
	boolean deleted
	
	static transients = [ 'deleted' ]
	
	static mapping = {
		discriminator column: "service_type"
	}

	static belongsTo = [ Profile ]

	static constraints = {
	}

	static searchable = {
		root false
		except = [ 'version', 'dateCreated', 'lastUpdated' ]
	}
	
	String toString() {
		"${this.properties}"
	}
}