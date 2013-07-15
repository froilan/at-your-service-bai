package com.ays

class PlaceOfBusinessPhoto implements Serializable{

	byte[] photo
	Date dateCreated
	Date lastUpdated

	static belongsTo = [ CompanyProfile ]

	static constraints = {
    }
}