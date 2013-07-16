package com.ays

class PhoneNumber extends ContactInfo {
	
	static mapping = {
		discriminator value: ContactInfoType.PHONE_NUMBER
	}
	
	int hashCode() {
		contactAlias?.hashCode() + contactValue?.hashCode()
	}
	
	boolean equals(o) {
		if (this.is(o)) return true
		if (!(o instanceof PhoneNumber)) return false
		return contactAlias.equals(o.contactAlias) && contactValue.equals(o.contactValue)
	}

}
