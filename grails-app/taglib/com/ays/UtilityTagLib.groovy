package com.ays

import org.apache.commons.lang.StringUtils

class UtilityTagLib {
	
	def springSecurityService
	
	def welcome = { attrs, body ->
		if (springSecurityService.isLoggedIn()) {
			def currentUser = springSecurityService.currentUser
			def firstName = currentUser.firstName
			def lastName = currentUser.lastName
			// TODO if really needed, find way to display companyName
//			def companyName = currentUser.profile?.companyProfile?.companyName
			out << """<p class="bold">Welcome, <span class="first-last-name">${firstName} ${lastName}</span></p>"""
//			if (StringUtils.isNotBlank(companyName)) {
//				out << """<p class="header-company">${companyName}</p>"""
//			}
		}
	}

}
