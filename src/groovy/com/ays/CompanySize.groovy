package com.ays

import com.sun.tools.jdi.JDWP.StackFrame.ThisObject;

enum CompanySize {
	
	SINGLE("Just myself"),
	LESS_THAN_TEN("2-9 employees"),
	LESS_THAN_TWENTY("10-19 employees"),
	LESS_THAN_FIFTY("20-49 employees"),
	LESS_THAN_A_HUNDRED("50-99 employees"),
	LESS_THAN_FIVE_HUNDRED("100-499 employees"),
	MORE_THAN_FIVE_HUNDRED("500+ employees")
	
	final String value
	
	private CompanySize(String value) {
		this.value = value
	}
	
	String toString() { value }

}
