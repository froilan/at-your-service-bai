package com.aysb

import org.junit.internal.runners.statements.FailOnTimeout;
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest

class SiteUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [siteUserInstanceList: SiteUser.list(params), siteUserInstanceTotal: SiteUser.count()]
    }

    def preCreate(){
		
	}
	
	def create() {
        [siteUserInstance: new SiteUser(params), employeeInstance: new Employee(params), employerInstance: new Employer(params), isEmployee: params.isEmployee]
    }

    def save() {
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request
        def siteUserInstance = new SiteUser(params)
		def employerInstance
		def employeeInstance
		siteUserInstance.enabled = true
		siteUserInstance.accountExpired = false
		siteUserInstance.accountLocked = false
		siteUserInstance.passwordExpired = false

		if(params.isEmployee){
			employeeInstance = new Employee(params)
			def photo = mRequest.getFile('avatar')
			def okcontents = ['image/png', 'image/jpeg', 'image/gif']
			if (! okcontents.contains(photo.getContentType())) {
			  flash.message = "unnacceptable image type"
			  render(view: "create", model: [siteUserInstance: new SiteUser(params), employeeInstance: new Employee(params), employerInstance: new Employer(params), isEmployee: params.isEmployee])
			  return;
			}
			employeeInstance.photo = photo.getBytes()
			siteUserInstance.employee = employeeInstance
		} else {
			employerInstance = new Employer(params)
			siteUserInstance.employer = employerInstance
		}
		
		if (params.isEmployee && !employeeInstance.save(flush: true)) {
			flash.message = "something went wrong in saving employee instance"
			render(view: "create", model: [siteUserInstance: new SiteUser(params), employeeInstance: new Employee(params), employerInstance: new Employer(params), isEmployee: params.isEmployee])
			return
		}
		if(!params.isEmployee && !employerInstance.save(flush: true)) {
			flash.message = "something went wrong in saving employer instance"
			render(view: "create", model: [siteUserInstance: new SiteUser(params), employeeInstance: new Employee(params), employerInstance: new Employer(params), isEmployee: params.isEmployee])
			return
		}
		if (!siteUserInstance.save(flush: true, failOnError: true)) {
			flash.message = "something went wrong in saving site user instance"
            render(view: "create", model: [siteUserInstance: new SiteUser(params), employeeInstance: new Employee(params), employerInstance: new Employer(params), isEmployee: params.isEmployee])
            return
        }
		

        flash.message = message(code: 'default.created.message', args: [message(code: 'siteUser.label', default: 'SiteUser'), siteUserInstance.id])
        redirect(action: "show", id: siteUserInstance.id)
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
}
