package com.aysb

class Client {

	String name
	String contactNumber
	byte[] photo
	static belongsTo = [employee : Employee]
	static constraints = {
		photo nullable:true, maxSize: 10000000
	}
	
}
