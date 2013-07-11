package com.ays

enum CompanyAge {
	
	ONE_YEAR_OR_LESS("1 year or less"),
	TWO_YEARS("2 years"),
	LESS_THAN_FIVE("3-5 years"),
	LESS_THAN_TEN("6-9 years"),
	LESS_THAN_TWENTY("10-19 years"),
	LESS_THAN_FIFTY("20-49 years"),
	MORE_THAN_FIFTY("50+ years")
	
	final String value
	
	private CompanyAge(String value) {
		this.value = value
	}
	
	String toString() { value }

}
