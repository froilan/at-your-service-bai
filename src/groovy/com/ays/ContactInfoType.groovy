package com.ays

enum ContactInfoType {

	PHONE_NUMBER('Phone Number'),
	EMAIL('E-mail'),
	WEBSITE('Website'),
	FACEBOOK('Facebook'),
	TWITTER('Twitter'),
	LINKEDIN('LinkedIn'),
	OTHER('Other')

	final String type

	private ContactInfoType(String type) {
		this.type = type
	}

	String toString() { type }
}