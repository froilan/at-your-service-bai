package com.aysb

import org.springframework.dao.DataIntegrityViolationException

class ReviewController {
	
	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reviewInstanceList: Review.list(params), reviewInstanceTotal: Review.count()]
    }

    def postReview() {
        [reviewInstance: new Review(params), employeeId: params.employeeId]
    }

    def submit() {
        def reviewInstance = new Review(params)
		def employee = Employee.get(employeeId)
		reviewInstance.employee = employee
		def employer = springSecurityService.currentUser.employer
		reviewInstance.postedBy = employer
        if (!reviewInstance.save(flush: true)) {
            render(view: "postReview", model: [reviewInstance: reviewInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'review.label', default: 'Review'), reviewInstance.id])
        redirect(action: "show", id: reviewInstance.id)
    }

    def show(Long id) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
            return
        }

        [reviewInstance: reviewInstance]
    }

}
