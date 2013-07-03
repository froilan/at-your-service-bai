package com.ays.controller

import org.springframework.dao.DataIntegrityViolationException

import com.ays.*;

class ProfileController {

	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [profileInstanceList: Profile.list(params), profileInstanceTotal: Profile.count()]
    }

    def create() {
        [profileInstance: new Profile(params), licenseInstance: new License(), companyProfileInstance: new CompanyProfile(),
        affiliationInstance: new Affiliation(), awardInstance: new Award(), contactInfoInstance: new ContactInfo(),
        primaryServiceInstance: new Service(), secondaryServiceInstance: new Service()]
    }

    def save() {
		def siteUserInstance = springSecurityService.currentUser
        def profileInstance = new Profile(params)
		def licenseInstance = new License(params)
		def companyProfileInstance = new CompanyProfile(params)

		def affiliationInstance = new Affiliation()
		affiliationInstance.name = params['affiliation.name']
		affiliationInstance.role = params['affiliation.role']
		profileInstance.addToAffiliations(affiliationInstance)

		def awardInstance = new Award()
		awardInstance.name = params['award.name']
		awardInstance.year = params.int('award.year')
		awardInstance.description = params['award.description']
		profileInstance.addToAwards(awardInstance)

		def contactInfoInstance = new ContactInfo()
		contactInfoInstance.type = params['contactInfo.type']
		contactInfoInstance.value = params['contactInfo.value']
		profileInstance.addToContacts(contactInfoInstance)

        def primaryServiceInstance = new Service()
        primaryServiceInstance.type = ServiceOfferingType.PRIMARY
        primaryServiceInstance.name = params['primaryService.name']
        primaryServiceInstance.description = params['primaryService.description']
        profileInstance.addToServices(primaryServiceInstance)

        def secondaryServiceInstance = new Service()
        secondaryServiceInstance.type = ServiceOfferingType.SECONDARY
        secondaryServiceInstance.name = params['secondaryService.name']
        secondaryServiceInstance.description = params['secondaryService.description']
        profileInstance.addToServices(secondaryServiceInstance)

		if (!licenseInstance.save(flush:true)) {
			render(view: "create", model: [profileInstance: profileInstance, licenseInstance: licenseInstance, companyProfileInstance: companyProfileInstance])
            return
		}

		if (!companyProfileInstance.save(flush:true)) {
			render(view: "create", model: [profileInstance: profileInstance, licenseInstance: licenseInstance, companyProfileInstance: companyProfileInstance])
			return
		}


		profileInstance.companyProfile = companyProfileInstance
		profileInstance.license = licenseInstance

		if (!profileInstance.save(flush: true, failOnError: true)) {
			render(view: "create", model: [profileInstance: profileInstance, licenseInstance: licenseInstance, companyProfileInstance: companyProfileInstance])
			return
		}

		siteUserInstance.profile = profileInstance
		if (!siteUserInstance.save(flush: true)) {
			render(view: "create", model: [profileInstance: profileInstance])
			return
		}



        flash.message = message(code: 'default.created.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])
        redirect(action: "show", id: profileInstance.id)
    }

    def show(Long id) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "list")
            return
        }

        [profileInstance: profileInstance]
    }

    def edit(Long id) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "list")
            return
        }

        [profileInstance: profileInstance]
    }

    def update(Long id, Long version) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (profileInstance.version > version) {
                profileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'profile.label', default: 'Profile')] as Object[],
                          "Another user has updated this Profile while you were editing")
                render(view: "edit", model: [profileInstance: profileInstance])
                return
            }
        }

        profileInstance.properties = params

        if (!profileInstance.save(flush: true)) {
            render(view: "edit", model: [profileInstance: profileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])
        redirect(action: "show", id: profileInstance.id)
    }

    def delete(Long id) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "list")
            return
        }

        try {
            profileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "show", id: id)
        }
    }
}
