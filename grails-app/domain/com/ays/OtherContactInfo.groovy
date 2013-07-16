package com.ays

class OtherContactInfo extends ContactInfo {
	
	static mapping = {
		discriminator value: ContactInfoType.OTHER
	}
	
	int hashCode() {
		contactAlias?.hashCode() + contactValue?.hashCode()
	}
	
	boolean equals(o) {
		if (this.is(o)) return true
		if (!(o instanceof OtherContactInfo)) return false
		return contactAlias.equals(o.contactAlias) && contactValue.equals(o.contactValue)
	}

}
