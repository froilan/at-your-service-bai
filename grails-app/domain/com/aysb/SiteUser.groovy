package com.aysb

class SiteUser {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Employee employee
	Employer employer

	static constraints = {
		username blank: false, unique: true
		password blank: false
		employee nullable: true
		employer nullable: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<SiteRole> getAuthorities() {
		SiteUserSiteRole.findAllBySiteUser(this).collect { it.siteRole } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
