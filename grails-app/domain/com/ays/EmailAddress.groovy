package com.ays

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class EmailAddress extends ContactInfo {
	
	static mapping = {
		discriminator value: ContactInfoType.EMAIL
	}
	
	int hashCode() {
		new HashCodeBuilder(17, 37).append(contactValue).append(contactAlias).toHashCode()
	}
	
	boolean equals(Object o) {
		if (o == null) return false
		if (!(o instanceof EmailAddress)) return false
		new EqualsBuilder(17, 37).append(contactValue).append(contactAlias).isEquals()
	}

}
