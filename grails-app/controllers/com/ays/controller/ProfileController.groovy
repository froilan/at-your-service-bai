package com.ays.controller

import org.springframework.dao.DataIntegrityViolationException

import com.ays.*;

class ProfileController {

	def springSecurityService

	def profileService

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

        flash.message = message(code: 'default.created.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])
        redirect(action: "show", id: profileInstance.id)
    }
	
	//TODO: refactor into a method and call unto every step of flow
	//		in case of direct access to middle of flow
	//TODO: image are not yet retained
	def profileDivisionFlow = {
		createCategoryAndOffering {
			on("next") {
				if(!flow.phoneNumberInstance) {
					def phoneNumberInstance = new ContactInfo()
					flow.phoneNumberInstance = phoneNumberInstance
					flow.phoneNumberInstance.type = ContactInfoType.PHONE_NUMBER
				}
				if(!flow.websiteInstance) {
					def websiteInstance = new ContactInfo()
					flow.websiteInstance = websiteInstance
					flow.websiteInstance.type = ContactInfoType.WEBSITE
				}
				if(!flow.emailInstance) {
					def emailInstance = new ContactInfo()
					flow.emailInstance = emailInstance
					flow.emailInstance.type = ContactInfoType.EMAIL
				}
				if(!flow.facebookInstance) {
					def facebookInstance = new ContactInfo()
					flow.facebookInstance = facebookInstance
					flow.facebookInstance.type = ContactInfoType.FACEBOOK
				}
				if(!flow.twitterInstance) {
					def twitterInstance = new ContactInfo()
					flow.twitterInstance = twitterInstance
					flow.twitterInstance.type = ContactInfoType.TWITTER
				}
				if(!flow.linkedInInstance) {
					def linkedInInstance = new ContactInfo()
					flow.linkedInInstance = linkedInInstance
					flow.linkedInInstance.type = ContactInfoType.LINKEDIN
				}
				if(!flow.awardInstance) {
					def awardInstance = new Award()
					flow.awardInstance = awardInstance
				}
				if(!flow.affiliationInstance) {
					def affiliationInstance = new Affiliation()
					flow.affiliationInstance = affiliationInstance
				}
				if(!flow.licenseInstance) {
					def licenseInstance = new License()
					flow.licenseInstance = licenseInstance
				}
				if(!flow.primaryServiceInstance) {
					def primaryServiceInstance = new Service()
					flow.primaryServiceInstance = primaryServiceInstance
					flow.primaryServiceInstance.type = ServiceOfferingType.PRIMARY
				}
				if(!flow.secondaryServiceInstance) {
					def secondaryServiceInstance = new Service()
					flow.secondaryServiceInstance = secondaryServiceInstance
					flow.secondaryServiceInstance.type = ServiceOfferingType.SECONDARY
				}
				if(!flow.companyProfileInstance) {
					def companyProfileInstance = new CompanyProfile()
					flow.companyProfileInstance = companyProfileInstance
				}
				if (!flow.profileInstance) {
					def profileInstance = new Profile()
					flow.profileInstance = profileInstance
					flow.profileInstance.companyProfile = flow.companyProfileInstance
					flow.profileInstance.addToServices(flow.primaryServiceInstance)
					flow.profileInstance.addToServices(flow.secondaryServiceInstance)
					flow.profileInstance.addToAwards(flow.awardInstance)
					flow.profileInstance.addToContacts(flow.phoneNumberInstance)
					flow.profileInstance.addToContacts(flow.websiteInstance)
					flow.profileInstance.addToContacts(flow.emailInstance)
					flow.profileInstance.addToContacts(flow.facebookInstance)
					flow.profileInstance.addToContacts(flow.twitterInstance)
					flow.profileInstance.addToContacts(flow.linkedInInstance)
				}
				def tempProfileInstance = new Profile(params)
				def tempCompanyProfileInstance = new CompanyProfile(params)
				flow.profileInstance.subCategory = tempProfileInstance.subCategory
				flow.profileInstance.category = tempProfileInstance.category
				flow.companyProfileInstance.description = tempCompanyProfileInstance.description
				flow.companyProfileInstance.name = tempCompanyProfileInstance.name
				flow.primaryServiceInstance.name = params['primaryService.name']
				flow.primaryServiceInstance.description = params['primaryService.description']
				flow.secondaryServiceInstance.name = params['secondaryService.name']
				flow.secondaryServiceInstance.description = params['secondaryService.description']
			}.to "createCompanyInfoAndRates"
		}
		createCompanyInfoAndRates {
			on("next") {
				def tempProfileInstance = new Profile(params)
				def tempCompanyProfileInstance = new CompanyProfile(params)
				flow.profileInstance.feeStructure = tempProfileInstance.feeStructure
				flow.profileInstance.askingFee = tempProfileInstance.askingFee
				flow.profileInstance.displayPicture = tempProfileInstance.displayPicture
				flow.companyProfileInstance.inBusinessSince = tempCompanyProfileInstance.inBusinessSince
				flow.companyProfileInstance.logo = tempCompanyProfileInstance.logo
			}.to "createLocationsAndDirections"
		}
		createLocationsAndDirections {
			on("next") {
				def tempCompanyProfileInstance = new CompanyProfile(params)
				flow.companyProfileInstance.address = tempCompanyProfileInstance.address
				flow.companyProfileInstance.directionsToAddress = tempCompanyProfileInstance.directionsToAddress
				//companyProfileInstance.photos = tempCompanyProfileInstance.photos
			}.to "createProffesionalAndLicensing"
		}
		createProffesionalAndLicensing {
			on("next") {
				def tempProfileInstance = new Profile(params)
				flow.profileInstance.differentiation = tempProfileInstance.differentiation
				def tempLicenseInstance = new License(params) 
				flow.licenseInstance = tempLicenseInstance
				flow.affiliationInstance.name = params['affiliation.name']
				flow.affiliationInstance.role = params['affiliation.role']
				flow.awardInstance.name = params['award.name']
				flow.awardInstance.year = params.int('award.year')
				flow.awardInstance.description = params['award.description']
			}.to "createContactDetails"
		}
		createContactDetails {
			on("next") {
				flow.phoneNumberInstance.value = params['contactInfo.phoneNumber']
				flow.phoneNumberInstance.name = params['contactInfo.phoneNumber.name']
				flow.emailInstance.value = params['contactInfo.email']
				flow.emailInstance.name = params['contactInfo.phoneNumber.name']
				flow.websiteInstance.value = params['contactInfo.website']
				flow.facebookInstance.value = params['contactInfo.facebook']
				flow.twitterInstance.value = params['contactInfo.twitter']
				flow.linkedInInstance.value = params['contactInfo.linkedIn']
			}.to "createCategoryAndOffering"
		}
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
