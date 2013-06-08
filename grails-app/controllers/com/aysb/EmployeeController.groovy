package com.aysb

import grails.plugins.springsecurity.Secured;

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest

class EmployeeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [employeeInstanceList: Employee.list(params), employeeInstanceTotal: Employee.count()]
    }

    def create() {
        [employeeInstance: new Employee(params)]
    }

    def save() {
        def employeeInstance = new Employee(params)
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request
		def photo = mRequest.getFile('avatar')
		
		  // List of OK mime-types
		  def okcontents = ['image/png', 'image/jpeg', 'image/gif']
		  if (! okcontents.contains(photo.getContentType())) {
			flash.message = "unnacceptable image type"
			render(view: "create", model: [employeeInstance: employeeInstance])
			return;
		  }
		
		// Save the image and mime type
		employeeInstance.photo = photo.getBytes()
		employeeInstance.imageType = photo.getContentType()
		if (!employeeInstance.save(flush: true)) {
            render(view: "create", model: [employeeInstance: employeeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance])
        redirect(action: "show", id: employeeInstance.id)
    }

    def show(Long id) {
        def employeeInstance = Employee.get(id)
        if (!employeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), id])
            redirect(action: "list")
            return
        }

        [employeeInstance: employeeInstance]
    }

	@Secured("ROLE_EMPLOYEE")
    def edit(Long id) {
        def employeeInstance = Employee.get(id)
        if (!employeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), id])
            redirect(action: "list")
            return
        }

        [employeeInstance: employeeInstance]
    }

	@Secured("ROLE_EMPLOYEE")
    def update(Long id, Long version) {
        def employeeInstance = Employee.get(id)
        if (!employeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (employeeInstance.version > version) {
                employeeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'employee.label', default: 'Employee')] as Object[],
                          "Another user has updated this Employee while you were editing")
                render(view: "edit", model: [employeeInstance: employeeInstance])
                return
            }
        }

        employeeInstance.properties = params
		
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request
		def photo = mRequest.getFile('avatar')
		
		  // List of OK mime-types
		  def okcontents = ['image/png', 'image/jpeg', 'image/gif']
		  if (! okcontents.contains(photo.getContentType())) {
			flash.message = "unnacceptable image type"
			render(view: "create", model: [employeeInstance: employeeInstance])
			return;
		  }
		
		// Save the image and mime type
		employeeInstance.photo = photo.getBytes()
		employeeInstance.imageType = photo.getContentType()
		
        if (!employeeInstance.save(flush: true)) {
            render(view: "edit", model: [employeeInstance: employeeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance])
        redirect(action: "show", id: employeeInstance.id)
    }

    def delete(Long id) {
        def employeeInstance = Employee.get(id)
        if (!employeeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), id])
            redirect(action: "list")
            return
        }

        try {
            employeeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def avatar_image = {
		def employee = Employee.get(params.id)
		if (!employee || !employee.photo ) {
		  response.sendError(404)
		  return;
		}
		response.setContentType(employee.imageType)
		response.setContentLength(employee.photo.size())
		OutputStream out = response.getOutputStream();
		out.write(employee.photo);
		out.close();
	}
}
