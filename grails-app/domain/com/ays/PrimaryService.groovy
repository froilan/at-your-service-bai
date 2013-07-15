package com.ays

class PrimaryService extends Service {
	
	static mapping = {
		discriminator value: ServiceOfferingType.PRIMARY
	}
	
	int hashCode() {
		serviceName?.hashCode() + serviceDescription?.hashCode()
	}
	
	boolean equals(o) {
		if (this.is(o)) return true
		if (!(o instanceof PrimaryService)) return false
		return serviceName.equals(o.serviceName) && serviceDescription.equals(o.serviceDescription)
	}

}
