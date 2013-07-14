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
		[:]
	}

	def save() {
		def siteUserInstance = springSecurityService.currentUser
		def profileInstance = new Profile(params)
		profileInstance.firstName = siteUserInstance.firstName
		profileInstance.lastName = siteUserInstance.lastName

		def licenseInstance = new License(params)
		profileInstance.license = licenseInstance

		def companyProfileInstance = new CompanyProfile(params)
		profileInstance.companyProfile = companyProfileInstance

		def affiliationInstance = new Affiliation()
		affiliationInstance.affiliationName = params['affiliation.affiliationName']
		affiliationInstance.affiliationRole = params['affiliation.affiliationRole']
		profileInstance.addToAffiliations(affiliationInstance)

		def awardInstance = new Award()
		awardInstance.awardName = params['award.awardName']
		awardInstance.awardYear = params.int('award.awardYear')
		awardInstance.awardDescription = params['award.awardDescription']
		profileInstance.addToAwards(awardInstance)

		def primaryServiceInstance = new Service()
		primaryServiceInstance.serviceType = ServiceOfferingType.PRIMARY
		primaryServiceInstance.serviceName = params['primaryService.serviceName']
		primaryServiceInstance.serviceDescription = params['primaryService.serviceDescription']
		profileInstance.addToServices(primaryServiceInstance)

		def secondaryServiceInstance = new Service()
		secondaryServiceInstance.serviceType = ServiceOfferingType.SECONDARY
		secondaryServiceInstance.serviceName = params['secondaryService.serviceName']
		secondaryServiceInstance.serviceDescription = params['secondaryService.serviceDescription']
		profileInstance.addToServices(secondaryServiceInstance)

		def phoneNumberInstance = new ContactInfo()
		phoneNumberInstance.contactType = ContactInfoType.PHONE_NUMBER
		phoneNumberInstance.contactValue = params['contactInfo.phoneNumber']
		phoneNumberInstance.contactAlias = params['contactInfo.phoneNumber.contactAlias']
		profileInstance.addToContacts(phoneNumberInstance)

		def emailInstance = new ContactInfo()
		emailInstance.contactType = ContactInfoType.EMAIL
		emailInstance.contactValue = params['contactInfo.email']
		emailInstance.contactAlias = params['contactInfo.phoneNumber.contactAlias']
		profileInstance.addToContacts(emailInstance)

		def websiteInstance = new ContactInfo()
		websiteInstance.contactType = ContactInfoType.WEBSITE
		websiteInstance.contactValue = params['contactInfo.website']
		profileInstance.addToContacts(websiteInstance)

		def facebookInstance = new ContactInfo()
		facebookInstance.contactType = ContactInfoType.FACEBOOK
		facebookInstance.contactValue = params['contactInfo.facebook']
		profileInstance.addToContacts(facebookInstance)

		def twitterInstance = new ContactInfo()
		twitterInstance.contactType = ContactInfoType.TWITTER
		twitterInstance.contactValue = params['contactInfo.twitter']
		profileInstance.addToContacts(twitterInstance)

		def linkedInInstance = new ContactInfo()
		linkedInInstance.contactType = ContactInfoType.LINKEDIN
		linkedInInstance.contactValue = params['contactInfo.linkedIn']
		profileInstance.addToContacts(linkedInInstance)

		profileInstance.companyProfile = companyProfileInstance
		profileInstance.license = licenseInstance

		if (!profileInstance.save(flush: true, failOnError: true)) {
			chain(action: "create", model: [profileInstance: profileInstance, licenseInstance: licenseInstance,
				companyProfileInstance: companyProfileInstance, affiliationInstance: affiliationInstance,
				awardInstance: awardInstance, primaryServiceInstance: primaryServiceInstance,
				secondaryServiceInstance: secondaryServiceInstance, phoneNumberInstance: phoneNumberInstance,
				emailInstance: emailInstance, websiteInstance: websiteInstance,
				facebookInstance: facebookInstance, twitterInstance: twitterInstance,
				linkedInInstance: linkedInInstance])
			return
		}

		siteUserInstance.profile = profileInstance
		siteUserInstance.save(flush: true)

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'profile.label', default: 'Profile'),
			profileInstance.id
		])
		redirect(action: "show", id: profileInstance.id)
	}

	//TODO: refactor into a method and call unto every step of flow
	//		in case of direct access to middle of flow
	//TODO: image are not yet retained
	//	def profileDivisionFlow = {
	//		createCategoryAndOffering {
	//			on("next") {
	//				if (!flow.phoneNumberInstance) {
	//					def phoneNumberInstance = new ContactInfo()
	//					flow.phoneNumberInstance = phoneNumberInstance
	//					flow.phoneNumberInstance.contactType = ContactInfoType.PHONE_NUMBER
	//				}
	//				if (!flow.websiteInstance) {
	//					def websiteInstance = new ContactInfo()
	//					flow.websiteInstance = websiteInstance
	//					flow.websiteInstance.contactType = ContactInfoType.WEBSITE
	//				}
	//				if (!flow.emailInstance) {
	//					def emailInstance = new ContactInfo()
	//					flow.emailInstance = emailInstance
	//					flow.emailInstance.contactType = ContactInfoType.EMAIL
	//				}
	//				if (!flow.facebookInstance) {
	//					def facebookInstance = new ContactInfo()
	//					flow.facebookInstance = facebookInstance
	//					flow.facebookInstance.contactType = ContactInfoType.FACEBOOK
	//				}
	//				if (!flow.twitterInstance) {
	//					def twitterInstance = new ContactInfo()
	//					flow.twitterInstance = twitterInstance
	//					flow.twitterInstance.contactType = ContactInfoType.TWITTER
	//				}
	//				if (!flow.linkedInInstance) {
	//					def linkedInInstance = new ContactInfo()
	//					flow.linkedInInstance = linkedInInstance
	//					flow.linkedInInstance.contactType = ContactInfoType.LINKEDIN
	//				}
	//				if (!flow.awardInstance) {
	//					def awardInstance = new Award()
	//					flow.awardInstance = awardInstance
	//				}
	//				if (!flow.affiliationInstance) {
	//					def affiliationInstance = new Affiliation()
	//					flow.affiliationInstance = affiliationInstance
	//				}
	//				if (!flow.licenseInstance) {
	//					def licenseInstance = new License()
	//					flow.licenseInstance = licenseInstance
	//				}
	//				if (!flow.primaryServiceInstance) {
	//					def primaryServiceInstance = new Service()
	//					flow.primaryServiceInstance = primaryServiceInstance
	//					flow.primaryServiceInstance.serviceType = ServiceOfferingType.PRIMARY
	//				}
	//				if (!flow.secondaryServiceInstance) {
	//					def secondaryServiceInstance = new Service()
	//					flow.secondaryServiceInstance = secondaryServiceInstance
	//					flow.secondaryServiceInstance.serviceType = ServiceOfferingType.SECONDARY
	//				}
	//				if (!flow.companyProfileInstance) {
	//					def companyProfileInstance = new CompanyProfile()
	//					flow.companyProfileInstance = companyProfileInstance
	//				}
	//				if (!flow.differentiationInstance) {
	//					def differentiationInstance = new Differentiation()
	//					flow.differentiationInstance = differentiationInstance
	//				}
	//				if (!flow.profileInstance) {
	//					def profileInstance = new Profile()
	//					flow.profileInstance = profileInstance
	//					flow.profileInstance.companyProfile = flow.companyProfileInstance
	//					flow.profileInstance.addToServices(flow.primaryServiceInstance)
	//					flow.profileInstance.addToServices(flow.secondaryServiceInstance)
	//					flow.profileInstance.addToAwards(flow.awardInstance)
	//					flow.profileInstance.addToContacts(flow.phoneNumberInstance)
	//					flow.profileInstance.addToContacts(flow.websiteInstance)
	//					flow.profileInstance.addToContacts(flow.emailInstance)
	//					flow.profileInstance.addToContacts(flow.facebookInstance)
	//					flow.profileInstance.addToContacts(flow.twitterInstance)
	//					flow.profileInstance.addToContacts(flow.linkedInInstance)
	//				}
	//				def tempProfileInstance = new Profile(params)
	//				def tempCompanyProfileInstance = new CompanyProfile(params)
	//				flow.profileInstance.subCategory = tempProfileInstance.subCategory
	//				flow.companyProfileInstance.description = tempCompanyProfileInstance.description
	//				flow.companyProfileInstance.companyName = tempCompanyProfileInstance.companyName
	//				flow.primaryServiceInstance.serviceName = params['primaryService.serviceName']
	//				flow.primaryServiceInstance.serviceDescription = params['primaryService.serviceDescription']
	//				flow.secondaryServiceInstance.serviceName = params['secondaryService.serviceName']
	//				flow.secondaryServiceInstance.serviceDescription = params['secondaryService.serviceDescription']
	//			}.to "createCompanyInfoAndRates"
	//		}
	//		createCompanyInfoAndRates {
	//			on("next") {
	//				def tempProfileInstance = new Profile(params)
	//				def tempCompanyProfileInstance = new CompanyProfile(params)
	//				flow.profileInstance.feeStructure = tempProfileInstance.feeStructure
	//				flow.profileInstance.askingFee = tempProfileInstance.askingFee
	//				flow.profileInstance.displayPicture = tempProfileInstance.displayPicture
	//				flow.companyProfileInstance.companySize = tempCompanyProfileInstance.companySize
	//				flow.companyProfileInstance.companyAge = tempCompanyProfileInstance.companyAge
	//				flow.companyProfileInstance.logo = tempCompanyProfileInstance.logo
	//			}.to "createLocationsAndDirections"
	//		}
	//		createLocationsAndDirections {
	//			on("next") {
	//				def tempCompanyProfileInstance = new CompanyProfile(params)
	//				flow.companyProfileInstance.address = tempCompanyProfileInstance.address
	//				flow.companyProfileInstance.directionsToAddress = tempCompanyProfileInstance.directionsToAddress
	//				//companyProfileInstance.photos = tempCompanyProfileInstance.photos
	//			}.to "createProfesionalAndLicensing"
	//		}
	//		createProfesionalAndLicensing {
	//			on("next") {
	//				flow.differentiationInstance.differentiationKeywords = params['differentiation.differentiationKeywords']
	//				flow.differentiationInstance.differentiationDescription = params['differentiation.differentiationDescription']
	//				def tempLicenseInstance = new License(params)
	//				flow.licenseInstance = tempLicenseInstance
	//				flow.affiliationInstance.affiliationName = params['affiliation.affiliationName']
	//				flow.affiliationInstance.affiliationRole = params['affiliation.affiliationRole']
	//				flow.awardInstance.awardName = params['award.awardName']
	//				flow.awardInstance.awardYear = params.int('award.awardYear')
	//				flow.awardInstance.awardDescription = params['award.awardDescription']
	//			}.to "createContactDetails"
	//		}
	//		createContactDetails {
	//			on("next") {
	//				flow.phoneNumberInstance.contactValue = params['contactInfo.phoneNumber']
	//				flow.phoneNumberInstance.contactAlias = params['contactInfo.phoneNumber.contactAlias']
	//				flow.emailInstance.contactValue = params['contactInfo.email']
	//				flow.emailInstance.name = params['contactInfo.phoneNumber.contactAlias']
	//				flow.websiteInstance.contactValue = params['contactInfo.website']
	//				flow.facebookInstance.contactValue = params['contactInfo.facebook']
	//				flow.twitterInstance.contactValue = params['contactInfo.twitter']
	//				flow.linkedInInstance.contactValue = params['contactInfo.linkedIn']
	//			}.to "createCategoryAndOffering"
	//		}
	//	}

	def contentManagerFlow = {
		initialize {
			action {
				def currentUser = springSecurityService.currentUser
				if (currentUser?.hasProfile()) {
					println "retrieving profile info..."
					def profile = currentUser.profile
					def primaryService = profile.services.find { it.serviceType == ServiceOfferingType.PRIMARY }
					def secondaryService = profile.services.find { it.serviceType == ServiceOfferingType.PRIMARY }
					def phoneNumber = profile.contacts.find { it.contactType == ContactInfoType.PHONE_NUMBER }
					def email = profile.contacts.find { it.contactType == ContactInfoType.EMAIL }
					def website = profile.contacts.find { it.contactType == ContactInfoType.WEBSITE }
					def facebook = profile.contacts.find { it.contactType == ContactInfoType.FACEBOOK }
					def twitter = profile.contacts.find { it.contactType == ContactInfoType.TWITTER }
					def linkedIn = profile.contacts.find { it.contactType == ContactInfoType.LINKEDIN }
					[ profileInstance: profile,
						companyProfileInstance: profile.companyProfile,
						addressInstance: profile.companyProfile.address,
						primaryServiceInstance: primaryService,
						secondaryServiceInstance: secondaryService,
						differentiationInstance: profile.differentiations[0],
						licenseInstance: profile.license,
						affiliationInstance: profile.affiliations[0],
						awardInstance: profile.awards[0],
						phoneNumberInstance: phoneNumber,
						emailInstance: email,
						websiteInstance: website,
						facebookInstance: facebook,
						twitterInstance: twitter,
						linkedInInstance: linkedIn ]
				} else {
					println ">> no profile yet!"
					def profile = new Profile()
					profile.firstName = currentUser.firstName
					profile.lastName = currentUser.lastName
					[ profileInstance: profile ]
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
				def primaryService = flow.primaryServiceInstance
				if (!primaryService) {
					primaryService = new Service()
					primaryService.serviceType = ServiceOfferingType.PRIMARY
				}
				def secondaryService = flow.secondaryServiceInstance
				if (!secondaryService) {
					secondaryService = new Service()
					secondaryService.serviceType = ServiceOfferingType.SECONDARY
				}
				def tempProfileInstance = new Profile(params)
				profile.subCategory = tempProfileInstance.subCategory
				companyProfile.companyName = params['name']
				companyProfile.description = params['description']
				primaryService.serviceName = params['primaryService.serviceName']
				primaryService.serviceDescription = params['primaryService.serviceDescription']
				secondaryService.serviceName = params['secondaryService.serviceName']
				secondaryService.serviceDescription = params['secondaryService.serviceDescription']
				[ profileInstance: profile,
					companyProfileInstance: companyProfile,
					primaryServiceInstance: primaryService,
					secondaryServiceInstance: secondaryService ]
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
				if(logo) {
					companyProfile.logo = logo.getBytes()
					println companyProfile.logo
				}
				def displayPicture = request.getFile('displayPicture')
				if(displayPicture) {
					profile.displayPicture = displayPicture.getBytes()
					println profile.displayPicture
				}
				println companyProfile.id 
				//				profile.displayPicture = tempProfileInstance.displayPicture
				companyProfile.companySize = tempCompanyProfileInstance.companySize
				companyProfile.companyAge = tempCompanyProfileInstance.companyAge
				//				companyProfile.logo = tempCompanyProfileInstance.logo
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
				
				def placeOfBusinessPhoto = flow.placeOfBusinessPhotoInstance
				if(!placeOfBusinessPhoto){
					placeOfBusinessPhoto = new PlaceOfBusinessPhoto()
				}
				def photo = request.getFile('user_upload')
				if(photo) {
					placeOfBusinessPhoto.photo = photo.getBytes() 
				}
				//companyProfileInstance.photos = tempCompanyProfileInstance.photos
				[ companyProfileInstance: companyProfile,
					addressInstance: address,
					 placeOfBusinessInstance: placeOfBusinessPhoto]
			}.to "profesionalAndLicensing"
		}
		profesionalAndLicensing {
			on("next") {
				def differentiation = flow.differentiationInstance
				if (!differentiation) {
					differentiation = new Differentiation()
				}
				def license = flow.licenseInstance
				if (!license) {
					license = new License()
				}
				def affiliation = flow.affiliationInstance
				if (!affiliation) {
					affiliation = new Affiliation()
				}
				def award = flow.awardInstance
				if (!award) {
					award = new Award()
				}

				def tempDifferentiationInstance = new Differentiation(params)
				def tempLicenseInstance = new License(params)
				def tempAffiliationInstance = new Affiliation(params)
				def tempAwardInstance = new Award(params)

				differentiation.differentiationKeywords = tempDifferentiationInstance.differentiationKeywords
				differentiation.differentiationDescription = tempDifferentiationInstance.differentiationDescription
				license.properties = tempLicenseInstance.properties
				affiliation.affiliationName = tempAffiliationInstance.affiliationName
				affiliation.affiliationRole = tempAffiliationInstance.affiliationRole
				award.awardName = tempAwardInstance.awardName
				award.awardYear = tempAwardInstance.awardYear
				award.awardDescription = tempAwardInstance.awardDescription
				[ differentiationInstance: differentiation,
					licenseInstance: license,
					affiliationInstance: affiliation,
					awardInstance: award ]
			}.to "contactDetails"
		}
		contactDetails {
			on("next") {
				def phoneNumber = flow.phoneNumberInstance
				if (!phoneNumber) {
					phoneNumber = new ContactInfo()
					phoneNumber.contactType = ContactInfoType.PHONE_NUMBER
				}
				def email = flow.emailInstance
				if (!email) {
					email = new ContactInfo()
					email.contactType = ContactInfoType.EMAIL
				}
				def website = flow.websiteInstance
				if (!website) {
					website = new ContactInfo()
					website.contactType = ContactInfoType.WEBSITE
				}
				def facebook = flow.facebookInstance
				if (!facebook) {
					facebook = new ContactInfo()
					facebook.contactType = ContactInfoType.FACEBOOK
				}
				def twitter = flow.twitterInstance
				if (!twitter) {
					twitter = new ContactInfo()
					twitter.contactType = ContactInfoType.TWITTER
				}
				def linkedIn = flow.linkedInInstance
				if (!linkedIn) {
					linkedIn = new ContactInfo()
					linkedIn.contactType = ContactInfoType.LINKEDIN
				}

				phoneNumber.contactValue = params['contactInfo.phoneNumber']
				phoneNumber.contactAlias = params['contactInfo.phoneNumber.contactAlias']
				email.contactValue = params['contactInfo.email']
				email.contactAlias = params['contactInfo.email.contactAlias']
				website.contactValue = params['contactInfo.website']
				facebook.contactValue = params['contactInfo.facebook']
				twitter.contactValue = params['contactInfo.twitter']
				linkedIn.contactValue = params['contactInfo.linkedIn']
				[ phoneNumberInstance: phoneNumber,
					emailInstance: email,
					websiteInstance: website,
					facebookInstance: facebook,
					twitterInstance: twitter,
					linkedInInstance: linkedIn ]
			}.to "saveProfile"
		}
		saveProfile {
			action {
				println ">> saving profile.."
				def profile = flow.profileInstance
				profile.companyProfile = flow.companyProfileInstance
				profile.companyProfile.address = flow.addressInstance
				profile.companyProfile.addToPhotos(flow.placeOfBusinessInstance)
				profile.license = flow.licenseInstance
				profile.addToServices(flow.primaryServiceInstance)
				profile.addToServices(flow.secondaryServiceInstance)
				profile.addToDifferentiations(flow.differentiationInstance)
				profile.addToAffiliations(flow.affiliationInstance)
				profile.addToAwards(flow.awardInstance)
				profile.addToContacts(flow.phoneNumberInstance)
				profile.addToContacts(flow.websiteInstance)
				profile.addToContacts(flow.emailInstance)
				profile.addToContacts(flow.facebookInstance)
				profile.addToContacts(flow.twitterInstance)
				profile.addToContacts(flow.linkedInInstance)
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
		//def profileInstance = Profile.get(id)
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

	def edit(Long id) {
		def profileInstance = Profile.get(id)
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

	def update(Long id, Long version) {
		def profileInstance = Profile.get(id)
		if (!profileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'profile.label', default: 'Profile'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (profileInstance.version > version) {
				profileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'profile.label', default: 'Profile')] as Object[],
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

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'profile.label', default: 'Profile'),
			profileInstance.id
		])
		redirect(action: "show", id: profileInstance.id)
	}

	def delete(Long id) {
		def profileInstance = Profile.get(id)
		if (!profileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'profile.label', default: 'Profile'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			profileInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'profile.label', default: 'Profile'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'profile.label', default: 'Profile'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
