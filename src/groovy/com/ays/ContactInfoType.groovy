package com.ays

enum ContactInfoType {

	HOME_NUMBER('Home Number'),
	OFFICE_NUMBER('Office Number'),
	FAX_NUMBER('Fax Number'),
	MOBILE_NUMBER('Mobile Number'),
	EMAIL('E-mail'),
	WEBSITE('Website')

	final String type

	private ContactInfoType(String type) {
		this.type = type
	}

	String toString() { type }
}