package com.ays.controller

import org.springframework.dao.DataIntegrityViolationException

import com.ays.CompanyProfile
import com.ays.FeeStructure
import com.ays.License
import com.ays.Profile;

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
        [profileInstance: new Profile(params), licenseInstance: new License(), companyProfileInstance: new CompanyProfile()]
    }

    def save() {
		def siteUserInstance = springSecurityService.currentUser
        def profileInstance = new Profile(params)
		def licenseInstance = new License(params)
		def companyProfileInstance = new CompanyProfile(params) 
			
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
		
		if (!profileInstance.save(flush: true)) {
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
