package com.ays

import java.io.Serializable;

import org.apache.commons.lang.StringUtils;

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
	
	boolean isEmpty() {
		StringUtils.isBlank(serviceName) && StringUtils.isBlank(serviceDescription)
	}
	
	boolean isIncomplete() {
		(StringUtils.isBlank(serviceName) && StringUtils.isNotBlank(serviceDescription) ||
			StringUtils.isNotBlank(serviceName) && StringUtils.isBlank(serviceDescription))
	}
}