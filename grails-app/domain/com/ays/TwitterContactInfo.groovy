package com.ays

class TwitterContactInfo extends ContactInfo {
	
	static belongsTo = [ Profile ]
	
	static mapping = {
		discriminator value: ContactInfoType.TWITTER
	}
	
	int hashCode() {
		contactAlias?.hashCode() + contactValue?.hashCode()
	}
	
	boolean equals(o) {
		if (this.is(o)) return true
		if (!(o instanceof TwitterContactInfo)) return false
		return contactAlias.equals(o.contactAlias) && contactValue.equals(o.contactValue)
	}

}
