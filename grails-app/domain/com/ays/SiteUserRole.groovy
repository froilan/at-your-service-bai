package com.ays

import java.util.Date;

import org.apache.commons.lang.builder.HashCodeBuilder

class SiteUserRole implements Serializable {

	SiteUser siteUser
	Role role
	Date dateCreated

	boolean equals(other) {
		if (!(other instanceof SiteUserRole)) {
			return false
		}

		other.siteUser?.id == siteUser?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (siteUser) builder.append(siteUser.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static SiteUserRole get(long siteUserId, long roleId) {
		find 'from SiteUserRole where siteUser.id=:siteUserId and role.id=:roleId',
			[siteUserId: siteUserId, roleId: roleId]
	}

	static SiteUserRole create(SiteUser siteUser, Role role, boolean flush = false) {
		new SiteUserRole(siteUser: siteUser, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(SiteUser siteUser, Role role, boolean flush = false) {
		SiteUserRole instance = SiteUserRole.findBySiteUserAndRole(siteUser, role)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(SiteUser siteUser) {
		executeUpdate 'DELETE FROM SiteUserRole WHERE siteUser=:siteUser', [siteUser: siteUser]
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM SiteUserRole WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'siteUser']
		version false
	}
}
