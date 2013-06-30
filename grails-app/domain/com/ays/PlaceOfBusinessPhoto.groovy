package com.ays

class PlaceOfBusinessPhoto {

	byte[] photo
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ CompanyProfile ]

	static constraints = {
    }
}