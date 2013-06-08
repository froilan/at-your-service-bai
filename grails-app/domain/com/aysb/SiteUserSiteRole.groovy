package com.aysb

import org.apache.commons.lang.builder.HashCodeBuilder

class SiteUserSiteRole implements Serializable {

	SiteUser siteUser
	SiteRole siteRole

	boolean equals(other) {
		if (!(other instanceof SiteUserSiteRole)) {
			return false
		}

		other.siteUser?.id == siteUser?.id &&
			other.siteRole?.id == siteRole?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (siteUser) builder.append(siteUser.id)
		if (siteRole) builder.append(siteRole.id)
		builder.toHashCode()
	}

	static SiteUserSiteRole get(long siteUserId, long siteRoleId) {
		find 'from SiteUserSiteRole where siteUser.id=:siteUserId and siteRole.id=:siteRoleId',
			[siteUserId: siteUserId, siteRoleId: siteRoleId]
	}

	static SiteUserSiteRole create(SiteUser siteUser, SiteRole siteRole, boolean flush = false) {
		new SiteUserSiteRole(siteUser: siteUser, siteRole: siteRole).save(flush: flush, insert: true)
	}

	static boolean remove(SiteUser siteUser, SiteRole siteRole, boolean flush = false) {
		SiteUserSiteRole instance = SiteUserSiteRole.findBySiteUserAndSiteRole(siteUser, siteRole)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(SiteUser siteUser) {
		executeUpdate 'DELETE FROM SiteUserSiteRole WHERE siteUser=:siteUser', [siteUser: siteUser]
	}

	static void removeAll(SiteRole siteRole) {
		executeUpdate 'DELETE FROM SiteUserSiteRole WHERE siteRole=:siteRole', [siteRole: siteRole]
	}

	static mapping = {
		id composite: ['siteRole', 'siteUser']
		version false
	}
}
