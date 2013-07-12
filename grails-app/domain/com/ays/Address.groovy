package com.ays

import java.io.Serializable;

class Address implements Serializable {
	
	String streetBuildingAddress
	String barangay
	String cityTown
	String province
	String zipCode
	
	static contraints = {
		streetBuildingAddress(blank: true, nullable: true)
		province(blank: true, nullable: true)
	}
	
	static searchable = {
		root false
	}
	
	String toString() {
		"${this.properties}"
	}

}
