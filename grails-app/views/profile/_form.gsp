<%@ page import="com.ays.Profile" %>

<!-- PAGE 1 -->

<h2>Categories & Offerings</h2>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'companyName', 'error')} ">
	<label for="companyName">
		<g:message code="companyProfile.name.label" default="Business Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="companyName" value="${companyProfileInstance?.companyName}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="profile.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.ays.Category.list()}" optionKey="id" required="" value="${profileInstance?.category?.id}" class="many-to-one" noSelection="['': '- select a category -']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'subCategory', 'error')} ">
	<label for="subCategory">
		<g:message code="profile.subCategory.label" default="Sub Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subCategory" name="subCategory.id" from="${com.ays.SubCategory.list()}" optionKey="id" value="${profileInstance?.subCategory?.id}" class="many-to-one" noSelection="['': '- select a category -']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="companyProfile.description.label" default="Description" />

	</label>
	<g:textField name="description" value="${companyProfileInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: primaryServiceInstance, field: 'serviceName', 'error')} ">
	<label for="primaryService.serviceName">
		<g:message code="profile.primaryService.name.label" default="Primary Service Offering" />
	</label>
	<g:textField name="primaryService.serviceName" value="${primaryServiceInstance?.serviceName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: primaryServiceInstance, field: 'serviceDescription', 'error')} ">
	<label for="primaryService.serviceDescription">
		<g:message code="profile.primaryService.description.label" default="Primary Service Description" />
	</label>
	<g:textField name="primaryService.serviceDescription" value="${primaryServiceInstance?.serviceDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secondaryServiceInstance, field: 'serviceName', 'error')} ">
	<label for="secondaryService.serviceName">
		<g:message code="profile.secondaryService.name.label" default="Secondary Service Offering" />
	</label>
	<g:textField name="secondaryService.serviceName" value="${secondaryServiceInstance?.serviceName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secondaryServiceInstance, field: 'serviceDescription', 'error')} ">
	<label for="secondaryService.serviceDescription">
		<g:message code="profile.secondaryService.description.label" default="Secondary Service Description" />
	</label>
	<g:textField name="secondaryService.serviceDescription" value="${secondaryServiceInstance?.serviceDescription}"/>
</div>

<!-- PAGE 2 -->

<h2>Company Information & Rates</h2>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="companyProfile.logo.label" default="Logo" />

	</label>
	<input type="file" id="logo" name="logo" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'displayPicture', 'error')} ">
	<label for="displayPicture">
		<g:message code="profile.displayPicture.label" default="Display Picture" />

	</label>
	<input type="file" id="displayPicture" name="displayPicture" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'feeStructure', 'error')} ">
	<label for="feeStructure">
		<g:message code="profile.feeStructure.label" default="Fee Structure" />

	</label>
	<g:select name="feeStructure" from="${com.ays.FeeStructure?.values()}" keys="${com.ays.FeeStructure.values()*.name()}" value="${profileInstance?.feeStructure?.name()}" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'askingFee', 'error')} required">
	<label for="askingFee">
		<g:message code="profile.askingFee.label" default="Asking Fee" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="askingFee" value="${fieldValue(bean: profileInstance, field: 'askingFee')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'inBusinessSince', 'error')} ">
	<label for="inBusinessSince">
		<g:message code="companyProfile.inBusinessSince.label" default="In Business Since" />

	</label>
	<g:field name="inBusinessSince" type="number" value="${companyProfileInstance?.inBusinessSince}"/>
</div>

<!-- PAGE 3 -->

<h2>Location & Directions</h2>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="companyProfile.address.label" default="Address" />

	</label>
	<g:textField name="address" value="${companyProfileInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'directionsToAddress', 'error')} ">
	<label for="directionsToAddress">
		<g:message code="companyProfile.directionsToAddress.label" default="Directions To Address" />

	</label>
	<g:textField name="directionsToAddress" value="${companyProfileInstance?.directionsToAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="companyProfile.photos.label" default="Photos" />

	</label>
	<input type="file" id="companyProfile.photo" name="companyProfile.photo" />
</div>

<!-- PAGE 4 -->

<h2>Professional & Licensing</h2>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'differentiation', 'error')} ">
	<label for="differentiation">
		<g:message code="profile.differentiation.label" default="Differentiation" />

	</label>
	<g:textField name="differentiation" value="${profileInstance?.differentiation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'licenseNumber', 'error')} ">
	<label for="licenseNumber">
		<g:message code="license.number.label" default="Number" />

	</label>
	<g:textField name="licenseNumber" value="${licenseInstance?.licenseNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'licenseArea', 'error')} ">
	<label for="licenseArea">
		<g:message code="license.area.label" default="Area" />

	</label>
	<g:textField name="licenseArea" value="${licenseInstance?.licenseArea}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'licenseAuthority', 'error')} ">
	<label for="licenseAuthority">
		<g:message code="license.authority.label" default="Authority" />

	</label>
	<g:textField name="licenseAuthority" value="${licenseInstance?.licenseAuthority}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'licenseExpirationDate', 'error')} required">
	<label for="licenseExpirationDate">
		<g:message code="license.expirationDate.label" default="Expiration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="licenseExpirationDate" precision="day"  value="${licenseInstance?.licenseExpirationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'licenseDescription', 'error')} ">
	<label for="licenseDescription">
		<g:message code="license.description.label" default="Description" />

	</label>
	<g:textField name="licenseDescription" value="${licenseInstance?.licenseDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: affiliationInstance, field: 'affiliationName', 'error')} ">
	<label for="affiliationName">
		<g:message code="profile.affiliation.label" default="Affiliation" />
	</label>
	<g:textField name="affiliation.affiliationName" value="${affiliationInstance?.affiliationName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: affiliationInstance, field: 'affiliationRole', 'error')} ">
	<label for="affiliation.affiliationRole">
		<g:message code="profile.affiliation.role.label" default="Affiliation Role" />
	</label>
	<g:textField name="affiliation.affiliationRole" value="${affiliationInstance?.affiliationRole}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'awardName', 'error')} ">
	<label for="awardName">
		<g:message code="profile.award.label" default="Award" />
	</label>
	<g:textField name="award.awardName" value="${awardInstance?.awardName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'awardYear', 'error')} ">
	<label for="award.awardYear">
		<g:message code="profile.award.year.label" default="Award Year" />
	</label>
	<g:textField name="award.awardYear" value="${awardInstance?.awardYear}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'awardDescription', 'error')} ">
	<label for="award.awardDescription">
		<g:message code="profile.award.description.label" default="Award Description" />
	</label>
	<g:textField name="award.awardDescription" value="${awardInstance?.awardDescription}"/>
</div>

<!-- PAGE 5 -->

<h2>Contact Details</h2>

<div class="fieldcontain ${hasErrors(bean: phoneNumberInstance, field: 'contactAlias', 'error')} ">
	<label for="contactInfo.phoneNumber.contactAlias">
		<g:message code="profile.contactInfo.phoneNumber.name.label" default="Alias" />
	</label>
	<g:textField name="contactInfo.phoneNumber.contactAlias" value="${phoneNumberInstance?.contactAlias}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phoneNumberInstance, field: 'contactValue', 'error')} ">
	<label for="contactInfo.phoneNumber">
		<g:message code="profile.contactInfo.phoneNumber.label" default="Phone Number" />
	</label>
	<g:textField name="contactInfo.phoneNumber" value="${phoneNumberInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'contactAlias', 'error')} ">
	<label for="contactInfo.email.contactAlias">
		<g:message code="profile.contactInfo.email.name.label" default="Email Alias" />
	</label>
	<g:textField name="contactInfo.email.contactAlias" value="${emailInstance?.contactAlias}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'contactValue', 'error')} ">
	<label for="contactInfo.email">
		<g:message code="profile.contactInfo.email.label" default="Email" />
	</label>
	<g:textField name="contactInfo.email" value="${emailInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: websiteInstance, field: 'contactValue', 'error')} ">
	<label for="contactInfo.website">
		<g:message code="profile.contactInfo.website.label" default="Website" />
	</label>
	<g:textField name="contactInfo.website" value="${websiteInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facebookInstance, field: 'contactValue', 'error')} ">
	<label for="contactInfo.facebook">
		<g:message code="profile.contactInfo.facebook.label" default="Facebook" />
	</label>
	<g:textField name="contactInfo.facebook" value="${facebookInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: twitterInstance, field: 'contactValue', 'error')} ">
	<label for="contactInfo.twitter">
		<g:message code="profile.contactInfo.twitter.label" default="Twitter" />
	</label>
	<g:textField name="contactInfo.twitter" value="${twitterInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: linkedInInstance, field: 'contactValue', 'error')} ">
	<label for="contactInfo.linkedIn">
		<g:message code="profile.contactInfo.linkedIn.label" default="LinkedIn" />
	</label>
	<g:textField name="contactInfo.linkedIn" value="${linkedInInstance?.contactValue}"/>
</div>

