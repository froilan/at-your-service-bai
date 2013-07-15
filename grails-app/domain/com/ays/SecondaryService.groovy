package com.ays

class SecondaryService extends Service {
	
	static mapping = {
		discriminator value: ServiceOfferingType.SECONDARY
	}

	int hashCode() {
		serviceName?.hashCode() + serviceDescription?.hashCode()
	}
	
	boolean equals(o) {
		if (this.is(o)) return true
		if (!(o instanceof SecondaryService)) return false
		return serviceName.equals(o.serviceName) && serviceDescription.equals(o.serviceDescription)
	}
	
}
