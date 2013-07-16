package com.ays

class FacebookContactInfo extends ContactInfo {
	
	static belongsTo = [ Profile ]
	
	static mapping = {
		discriminator value: ContactInfoType.FACEBOOK
	}
	
	int hashCode() {
		contactAlias?.hashCode() + contactValue?.hashCode()
	}
	
	boolean equals(o) {
		if (this.is(o)) return true
		if (!(o instanceof FacebookContactInfo)) return false
		return contactAlias.equals(o.contactAlias) && contactValue.equals(o.contactValue)
	}

}
