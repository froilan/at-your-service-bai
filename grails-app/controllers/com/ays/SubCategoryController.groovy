package com.ays

import org.springframework.dao.DataIntegrityViolationException

class SubCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subCategoryInstanceList: SubCategory.list(params), subCategoryInstanceTotal: SubCategory.count()]
    }

    def create() {
        [subCategoryInstance: new SubCategory(params)]
    }

    def save() {
        def subCategoryInstance = new SubCategory(params)
        if (!subCategoryInstance.save(flush: true)) {
            render(view: "create", model: [subCategoryInstance: subCategoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subCategory.label', default: 'SubCategory'), subCategoryInstance.id])
        redirect(action: "show", id: subCategoryInstance.id)
    }

    def show(Long id) {
        def subCategoryInstance = SubCategory.get(id)
        if (!subCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategory.label', default: 'SubCategory'), id])
            redirect(action: "list")
            return
        }

        [subCategoryInstance: subCategoryInstance]
    }

    def edit(Long id) {
        def subCategoryInstance = SubCategory.get(id)
        if (!subCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategory.label', default: 'SubCategory'), id])
            redirect(action: "list")
            return
        }

        [subCategoryInstance: subCategoryInstance]
    }

    def update(Long id, Long version) {
        def subCategoryInstance = SubCategory.get(id)
        if (!subCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategory.label', default: 'SubCategory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subCategoryInstance.version > version) {
                subCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subCategory.label', default: 'SubCategory')] as Object[],
                          "Another user has updated this SubCategory while you were editing")
                render(view: "edit", model: [subCategoryInstance: subCategoryInstance])
                return
            }
        }

        subCategoryInstance.properties = params

        if (!subCategoryInstance.save(flush: true)) {
            render(view: "edit", model: [subCategoryInstance: subCategoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subCategory.label', default: 'SubCategory'), subCategoryInstance.id])
        redirect(action: "show", id: subCategoryInstance.id)
    }

    def delete(Long id) {
        def subCategoryInstance = SubCategory.get(id)
        if (!subCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategory.label', default: 'SubCategory'), id])
            redirect(action: "list")
            return
        }

        try {
            subCategoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subCategory.label', default: 'SubCategory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subCategory.label', default: 'SubCategory'), id])
            redirect(action: "show", id: id)
        }
    }
}
