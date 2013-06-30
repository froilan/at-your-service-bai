package com.ays.controller

import org.springframework.dao.DataIntegrityViolationException

import com.ays.SiteUser;

class SiteUserController {

	def simpleCaptchaService
	def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [siteUserInstanceList: SiteUser.list(params), siteUserInstanceTotal: SiteUser.count()]
    }

    def create() {
        [siteUserInstance: new SiteUser(params)]
    }

    def save() {
        def siteUserInstance = new SiteUser(params)
		boolean captchaValid = simpleCaptchaService.validateCaptcha(params.captcha)
        if(!captchaValid) {
			flash.message = message(code: 'invalid.captcha.message', default: "invalid captcha")
			render(view: "create", model: [siteUserInstance: siteUserInstance])
			return
		}
		if (!siteUserInstance.save(flush: true)) {
            render(view: "create", model: [siteUserInstance: siteUserInstance])
            return
        }
		
		if (!springSecurityService.loggedIn) {
			springSecurityService.reauthenticate siteUserInstance.username
		}
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'siteUser.label', default: 'SiteUser'), siteUserInstance.id])
        redirect(action: "postCreate", id: siteUserInstance.id)
    }

    def show(Long id) {
        def siteUserInstance = SiteUser.get(id)
        if (!siteUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteUser.label', default: 'SiteUser'), id])
            redirect(action: "list")
            return
        }

        [siteUserInstance: siteUserInstance]
    }

    def edit(Long id) {
        def siteUserInstance = SiteUser.get(id)
        if (!siteUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteUser.label', default: 'SiteUser'), id])
            redirect(action: "list")
            return
        }

        [siteUserInstance: siteUserInstance]
    }

    def update(Long id, Long version) {
        def siteUserInstance = SiteUser.get(id)
        if (!siteUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteUser.label', default: 'SiteUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (siteUserInstance.version > version) {
                siteUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'siteUser.label', default: 'SiteUser')] as Object[],
                          "Another user has updated this SiteUser while you were editing")
                render(view: "edit", model: [siteUserInstance: siteUserInstance])
                return
            }
        }

        siteUserInstance.properties = params

        if (!siteUserInstance.save(flush: true)) {
            render(view: "edit", model: [siteUserInstance: siteUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'siteUser.label', default: 'SiteUser'), siteUserInstance.id])
        redirect(action: "show", id: siteUserInstance.id)
    }

    def delete(Long id) {
        def siteUserInstance = SiteUser.get(id)
        if (!siteUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteUser.label', default: 'SiteUser'), id])
            redirect(action: "list")
            return
        }

        try {
            siteUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'siteUser.label', default: 'SiteUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'siteUser.label', default: 'SiteUser'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def postCreate() {
		
	}
	
}
