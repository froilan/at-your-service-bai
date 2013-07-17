package com.ays.controller

import org.springframework.dao.DataIntegrityViolationException

import com.ays.*;

class ProfileController {

	def springSecurityService

	def contentManagerFlow = {
		initialize {
			action {
				if (!flow.profileInstance) {	// if restarting because of error, skip this part
					def currentUser = springSecurityService.currentUser
					if (currentUser?.hasProfile()) {
						println "retrieving profile info..."
						def profile = currentUser.profile
						[ profileInstance: profile,
							companyProfileInstance: profile.companyProfile,
							addressInstance: profile.companyProfile.address,
							licenseInstance: profile.license ]
					} else {
						println ">> no profile yet!"
						def profile = new Profile()
						profile.firstName = currentUser.firstName
						profile.lastName = currentUser.lastName
						[ profileInstance: profile ]
					}
				}
			}
			on("success").to "categoryAndOffering"
		}
		categoryAndOffering {
			on("next") {
				def profile = flow.profileInstance
				if (!profile) {
					profile = new Profile()
				}
				def companyProfile = flow.companyProfileInstance
				if (!companyProfile) {
					companyProfile = new CompanyProfile()
				}
				def tempProfileInstance = new Profile(params)
				profile.subCategory = tempProfileInstance.subCategory
				profile.clearPrimaryServices()
				profile.addPrimaryServices(tempProfileInstance.primaryServices)
				profile.clearSecondaryServices()
				profile.addSecondaryServices(tempProfileInstance.secondaryServices)
				companyProfile.companyName = params['name']
				companyProfile.description = params['description']
				
				println "params >> ${params}"
				def _toBeRemoved = profile.primaryServices.findAll { it.isEmpty() || it.deleted }
				profile.primaryServices.removeAll(_toBeRemoved)
				println "toBeRemoved >> ${_toBeRemoved}"
				_toBeRemoved = profile.secondaryServices.findAll { it.isEmpty()  || it.deleted }
				profile.secondaryServices.removeAll(_toBeRemoved)
				println "toBeRemoved >> ${_toBeRemoved}"
				
				println "primaryServices >> ${profile.primaryServices}"
				println "secondaryServices >> ${profile.secondaryServices}"
				[ profileInstance: profile,
					companyProfileInstance: companyProfile ]
			}.to "companyInfoAndRates"
		}
		companyInfoAndRates {
			on("next") {
				def profile = flow.profileInstance
				def companyProfile = flow.companyProfileInstance

				def tempProfileInstance = new Profile(params)
				def tempCompanyProfileInstance = new CompanyProfile(params)

				profile.feeStructure = tempProfileInstance.feeStructure
				profile.askingFee = tempProfileInstance.askingFee
				profile.rateNegotiable = (params['rateNegotiable'] == 'Y')
				def logo = request.getFile('logo')
				if (logo) {
					companyProfile.logo = logo.getBytes()
					println companyProfile.logo
				}
				def displayPicture = request.getFile('displayPicture')
				if (displayPicture) {
					profile.displayPicture = displayPicture.getBytes()
					println profile.displayPicture
				}
				println companyProfile.id 
				companyProfile.companySize = tempCompanyProfileInstance.companySize
				companyProfile.companyAge = tempCompanyProfileInstance.companyAge
				[ profileInstance: profile,
					companyProfileInstance: companyProfile]
			}.to "locationAndDirections"
		}
		locationAndDirections {
			on("next") {
				def companyProfile = flow.companyProfileInstance
				def address = flow.addressInstance
				if (!address) {
					address = new Address()
				}
				def tempAddressInstance = new Address(params)
				address.properties = tempAddressInstance.properties
				println params.directionsToAddress
				companyProfile.directionsToAddress = params.directionsToAddress 
				
				def photo = request.getFile('user_upload')
				if (photo) {
					def placeOfBusinessPhoto = new PlaceOfBusinessPhoto()
					placeOfBusinessPhoto.photo = photo.getBytes()
					companyProfile.addToPhotos(placeOfBusinessPhoto)
				}

				[ companyProfileInstance: companyProfile,
					addressInstance: address ]
			}.to "profesionalAndLicensing"
		}
		profesionalAndLicensing {
			on("next") {
				def profile = flow.profileInstance
				def license = flow.licenseInstance
				if (!license) {
					license = new License()
				}

				def tempProfileInstance = new Profile(params)
				def tempLicenseInstance = new License(params)

				profile.clearDifferentiations()
				profile.addDifferentiations(tempProfileInstance.differentiations)
				profile.clearAffiliations()
				profile.addAffiliations(tempProfileInstance.affiliations)
				profile.clearAwards()
				profile.addAwards(tempProfileInstance.awards)
				license.licenseNumber = tempLicenseInstance.licenseNumber
				license.licenseArea = tempLicenseInstance.licenseArea
				license.licenseAuthority = tempLicenseInstance.licenseAuthority
				license.licenseExpirationDate = tempLicenseInstance.licenseExpirationDate
				license.licenseDescription = tempLicenseInstance.licenseDescription
				
				def _toBeRemoved = profile.differentiations.findAll { it.isEmpty()  || it.deleted }
				profile.differentiations.removeAll(_toBeRemoved)
				println "toBeRemoved >> ${_toBeRemoved}"
				_toBeRemoved = profile.affiliations.findAll { it.isEmpty()  || it.deleted }
				profile.affiliations.removeAll(_toBeRemoved)
				println "toBeRemoved >> ${_toBeRemoved}"
				_toBeRemoved = profile.awards.findAll { it.isEmpty()  || it.deleted }
				profile.awards.removeAll(_toBeRemoved)
				println "toBeRemoved >> ${_toBeRemoved}"
				
				println "profile.differentiations >> ${profile.differentiations}"
				println "profile.affilitiations >> ${profile.affiliations}"
				println "profile.awards >> ${profile.awards}"
				[ profileInstance: profile,
					licenseInstance: license ]
			}.to "contactDetails"
		}
		contactDetails {
			on("next") {
				println "params >> ${params}"
				def profile = flow.profileInstance
				def tempProfileInstance = new Profile(params)
				profile.clearPhoneNumbers()
				profile.addPhoneNumbers(tempProfileInstance.phoneNumbers)
				profile.clearEmailAddresses()
				profile.addEmailAddresses(tempProfileInstance.emailAddresses)
				profile.clearWebsites()
				profile.addWebsites(tempProfileInstance.websites)
				profile.clearOtherContacts()
				profile.addOtherContacts(tempProfileInstance.otherContacts)
				profile.facebookContactInfo = tempProfileInstance.facebookContactInfo
				profile.twitterContactInfo = tempProfileInstance.twitterContactInfo
				profile.linkedInContactInfo = tempProfileInstance.linkedInContactInfo

				def _toBeRemoved = profile.phoneNumbers.findAll { it.isEmpty()  || it.deleted }
				profile.phoneNumbers.removeAll(_toBeRemoved)
				println "toBeRemoved >> ${_toBeRemoved}"
				_toBeRemoved = profile.emailAddresses.findAll { it.isEmpty()  || it.deleted }
				profile.emailAddresses.removeAll(_toBeRemoved)
				println "toBeRemoved >> ${_toBeRemoved}"
				_toBeRemoved = profile.websites.findAll { it.isEmpty()  || it.deleted }
				profile.websites.removeAll(_toBeRemoved)
				println "toBeRemoved >> ${_toBeRemoved}"
				_toBeRemoved = profile.otherContacts.findAll { it.isEmpty()  || it.deleted }
				profile.otherContacts.removeAll(_toBeRemoved)
				println "toBeRemoved >> ${_toBeRemoved}"
				
				println "profile.phoneNumbers >> ${profile.phoneNumbers}"
				println "profile.emailAddresses >> ${profile.emailAddresses}"
				println "profile.websites >> ${profile.websites}"
				println "profile.otherContacts >> ${profile.otherContacts}"
				println "profile.facebook >> ${profile.facebookContactInfo}"
				println "profile.twitter >> ${profile.twitterContactInfo}"
				println "profile.linkedIn >> ${profile.linkedInContactInfo}"
				[ profileInstance: profile ]
			}.to "saveProfile"
		}
		saveProfile {
			action {
				println ">> saving profile.."
				def profile = flow.profileInstance
				profile.companyProfile = flow.companyProfileInstance
				profile.companyProfile.address = flow.addressInstance
				profile.license = flow.licenseInstance
				println "PROFILE >> ${profile}"
				profile.save(flush: true, failOnError: true)

				def currentUser = springSecurityService.currentUser
				currentUser.profile = profile
				currentUser.save(flush: true, failOnError: true)
			}
			on("success").to "profileSaved"
			on("error").to "errorHandler"
			on(Exception).to "errorHandler"
		}
		errorHandler {
			on("restart").to "initialize"
		}
		profileSaved { redirect(action: "show") }
	}

	def logo = {
		println ">>>>>>>>>>>>>>>>>>>>>>>>"
		def companyProfile = CompanyProfile.get(params.id)
		println companyProfile.logo
		//response.setContentType('image/jpeg')
		response.setContentLength(companyProfile.logo.size())
		OutputStream out = response.getOutputStream();
		out.write(companyProfile.logo);
		out.close();
	}

	def displayPicture = {
		println ">>>>>>>>>>>>>>>>>>>>>>>>"
		def profile = Profile.get(params.id)
		println profile.displayPicture
		//response.setContentType('image/jpeg')
		response.setContentLength(profile.displayPicture.size())
		OutputStream out = response.getOutputStream();
		out.write(profile.displayPicture);
		out.close();
	}
	
	def photo = {
		println ">>>>>>>>>>>>>>>>>>>>>>>>"
		def placeOfBusinessPhoto = PlaceOfBusinessPhoto.get(params.id)
		println placeOfBusinessPhoto.photo
		//response.setContentType('image/jpeg')
		response.setContentLength(placeOfBusinessPhoto.photo.size())
		OutputStream out = response.getOutputStream();
		out.write(placeOfBusinessPhoto.photo);
		out.close();
	}
	
	def show(Long id) {
		def currentUser = springSecurityService.currentUser
		def profileInstance = currentUser.profile
		if (!profileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'profile.label', default: 'Profile'),
				id
			])
			redirect(action: "list")
			return
		}

		[profileInstance: profileInstance]
	}

}
