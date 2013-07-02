package com.ays.controller

import org.springframework.dao.DataIntegrityViolationException

import com.ays.CompanyProfile;

class CompanyProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [companyProfileInstanceList: CompanyProfile.list(params), companyProfileInstanceTotal: CompanyProfile.count()]
    }

    def create() {
        [companyProfileInstance: new CompanyProfile(params)]
    }

    def save() {
        def companyProfileInstance = new CompanyProfile(params)
        if (!companyProfileInstance.save(flush: true)) {
            render(view: "create", model: [companyProfileInstance: companyProfileInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'companyProfile.label', default: 'CompanyProfile'), companyProfileInstance.id])
        redirect(action: "show", id: companyProfileInstance.id)
    }

    def show(Long id) {
        def companyProfileInstance = CompanyProfile.get(id)
        if (!companyProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companyProfile.label', default: 'CompanyProfile'), id])
            redirect(action: "list")
            return
        }

        [companyProfileInstance: companyProfileInstance]
    }

    def edit(Long id) {
        def companyProfileInstance = CompanyProfile.get(id)
        if (!companyProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companyProfile.label', default: 'CompanyProfile'), id])
            redirect(action: "list")
            return
        }

        [companyProfileInstance: companyProfileInstance]
    }

    def update(Long id, Long version) {
        def companyProfileInstance = CompanyProfile.get(id)
        if (!companyProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companyProfile.label', default: 'CompanyProfile'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (companyProfileInstance.version > version) {
                companyProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'companyProfile.label', default: 'CompanyProfile')] as Object[],
                          "Another user has updated this CompanyProfile while you were editing")
                render(view: "edit", model: [companyProfileInstance: companyProfileInstance])
                return
            }
        }

        companyProfileInstance.properties = params

        if (!companyProfileInstance.save(flush: true)) {
            render(view: "edit", model: [companyProfileInstance: companyProfileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'companyProfile.label', default: 'CompanyProfile'), companyProfileInstance.id])
        redirect(action: "show", id: companyProfileInstance.id)
    }

    def delete(Long id) {
        def companyProfileInstance = CompanyProfile.get(id)
        if (!companyProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companyProfile.label', default: 'CompanyProfile'), id])
            redirect(action: "list")
            return
        }

        try {
            companyProfileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'companyProfile.label', default: 'CompanyProfile'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'companyProfile.label', default: 'CompanyProfile'), id])
            redirect(action: "show", id: id)
        }
    }
}
