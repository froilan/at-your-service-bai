package com.ays

class EmailAddress extends ContactInfo {
	
	static mapping = {
		discriminator value: ContactInfoType.EMAIL
	}
	
	int hashCode() {
		contactAlias?.hashCode() + contactValue?.hashCode()
	}
	
	boolean equals(o) {
		if (this.is(o)) return true
		if (!(o instanceof EmailAddress)) return false
		return contactAlias.equals(o.contactAlias) && contactValue.equals(o.contactValue)
	}

}
