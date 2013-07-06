package com.ays

class License {

	String licenseNumber
	String licenseArea
	String licenseAuthority
	Date licenseExpirationDate
	String licenseDescription
	Date dateCreated
	Date lastUpdated

	static constraints = {
		licenseExpirationDate(nullable: true)
    }

    static belongsTo = [ Profile ]

    static searchable = {
    	root false
    	except = [ 'version', 'dateCreated', 'lastUpdated', 'licenseExpirationDate' ]
    }
}