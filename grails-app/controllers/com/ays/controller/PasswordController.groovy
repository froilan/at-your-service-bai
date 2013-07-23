package com.ays.controller

import com.ays.SiteUser
import org.apache.commons.lang.RandomStringUtils

class PasswordController {

	def springSecurityService
	def passwordEncoder
	
    def change() { 
		render view:'change'
	}
	
	def reset() {
		render view:'reset'
	}
	
	def updatePassword() {
		def user = springSecurityService.currentUser
		String password = params.password
		String newPassword = params.newPassword
		String newPassword2 = params.newPassword2

		if(!passwordEncoder.isPasswordValid(user.password, password, null)) {
			flash.message = 'Current password is incorrect'
			render view :'change'
			return
		}
		if(passwordEncoder.isPasswordValid(user.password, newPassword, null)) {
			flash.message = 'Please choose a different password from your current one'
			render view :'change'
			return
		}
		user.password = newPassword
		user.save()
		redirect controller:'home',action:'index'
	}
	
	def resetPassword() {
		String username = params.username
		def user = SiteUser.findByUsername(username)
		if(!user) {
			flash.message = 'user does not exist'
		}else {
			flash.message = 'done resetting password'
			String charset = (('A'..'Z') + ('0'..'9')).join()
			Integer length = 9
			String randomString = RandomStringUtils.random(length, charset.toCharArray())
			user.password = randomString
			user.save()
			println randomString
			sendMail {
				to user
				subject "Your new password"
				body 'How are you? Eto password mo: ' + randomString
			  }
		}
		redirect action:'reset'
	}
}
