package com.ays

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class FacebookContactInfo extends ContactInfo {
	
	static belongsTo = [ Profile ]
	
	static mapping = {
		discriminator value: ContactInfoType.FACEBOOK
	}
	
	int hashCode() {
		new HashCodeBuilder(17, 37).append(contactValue).append(contactAlias).toHashCode()
	}
	
	boolean equals(Object o) {
		if (o == null) return false
		if (!(o instanceof FacebookContactInfo)) return false
		new EqualsBuilder(17, 37).append(contactValue).append(contactAlias).isEquals()
	}

}
