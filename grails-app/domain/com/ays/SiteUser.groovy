package com.ays

import java.util.Date;

class SiteUser {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Profile profile
	Membership membership
	Date dateCreated
	Date lastUpdated

	static hasMany = [ otherFeatures: Feature, bookmarks: Bookmark ]
	
	static constraints = {
		username(blank: false, unique: true)
		password(blank: false)
		profile(nullable: true)
		membership(nullable: true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		SiteUserRole.findAllBySiteUser(this).collect { it.role } as Set
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
