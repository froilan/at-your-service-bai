<%@ page import="com.ays.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'subCategory', 'error')} ">
	<label for="subCategory">
		<g:message code="profile.subCategory.label" default="Sub Category" />
		
	</label>
	<g:textField name="subCategory" value="${profileInstance?.subCategory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'displayPicture', 'error')} ">
	<label for="displayPicture">
		<g:message code="profile.displayPicture.label" default="Display Picture" />
		
	</label>
	<input type="file" id="displayPicture" name="displayPicture" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'companyProfile', 'error')} ">
	<label for="companyProfile">
		<g:message code="profile.companyProfile.label" default="Company Profile" />
		
	</label>
	<g:select id="companyProfile" name="companyProfile.id" from="${com.ays.CompanyProfile.list()}" optionKey="id" value="${profileInstance?.companyProfile?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>
<fieldset class="embedded"><legend><g:message code="profile.license.label" default="License" /></legend>
<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'license.area', 'error')} ">
	<label for="license.area">
		<g:message code="profile.license.area.label" default="Area" />
		
	</label>
	<g:textField name="area" value="${licenseInstance?.area}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'license.authority', 'error')} ">
	<label for="license.authority">
		<g:message code="profile.license.authority.label" default="Authority" />
		
	</label>
	<g:textField name="authority" value="${licenseInstance?.authority}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'license.description', 'error')} ">
	<label for="license.description">
		<g:message code="profile.license.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${licenseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'license.expirationDate', 'error')} required">
	<label for="license.expirationDate">
		<g:message code="profile.license.expirationDate.label" default="Expiration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="expirationDate" precision="day"  value="${licenseInstance?.expirationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'license.id', 'error')} required">
	<label for="license.id">
		<g:message code="profile.license.id.label" default="Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="id" type="number" value="${licenseInstance.id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'license.number', 'error')} ">
	<label for="license.number">
		<g:message code="profile.license.number.label" default="Number" />
		
	</label>
	<g:textField name="number" value="${licenseInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'license.version', 'error')} required">
	<label for="license.version">
		<g:message code="profile.license.version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="version" type="number" value="${licenseInstance.version}" required=""/>
</div>
</fieldset>
<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'differentiation', 'error')} ">
	<label for="differentiation">
		<g:message code="profile.differentiation.label" default="Differentiation" />
		
	</label>
	<g:textField name="differentiation" value="${profileInstance?.differentiation}"/>
</div>
<fieldset class="embedded"><legend><g:message code="profile.feeStructure.label" default="Fee Structure" /></legend>
<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'feeStructure.feeType', 'error')} required">
	<label for="feeStructure.feeType">
		<g:message code="profile.feeStructure.feeType.label" default="Fee Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="feeType" from="${com.ays.FeeStructureType?.values()}" keys="${com.ays.FeeStructureType.values()*.name()}" required="" value="${feeStructureInstance?.feeType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'feeStructure.id', 'error')} required">
	<label for="feeStructure.id">
		<g:message code="profile.feeStructure.id.label" default="Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="id" type="number" value="${feeStructureInstance.id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'feeStructure.rate', 'error')} required">
	<label for="feeStructure.rate">
		<g:message code="profile.feeStructure.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rate" value="${fieldValue(bean: feeStructureInstance, field: 'rate')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'feeStructure.version', 'error')} required">
	<label for="feeStructure.version">
		<g:message code="profile.feeStructure.version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="version" type="number" value="${feeStructureInstance.version}" required=""/>
</div>
</fieldset>
<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'affiliations', 'error')} ">
	<label for="affiliations">
		<g:message code="profile.affiliations.label" default="Affiliations" />
		
	</label>
	<g:select name="affiliations" from="${com.ays.Affiliation.list()}" multiple="multiple" optionKey="id" size="5" value="${profileInstance?.affiliations*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'askingFee', 'error')} required">
	<label for="askingFee">
		<g:message code="profile.askingFee.label" default="Asking Fee" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="askingFee" value="${fieldValue(bean: profileInstance, field: 'askingFee')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'awards', 'error')} ">
	<label for="awards">
		<g:message code="profile.awards.label" default="Awards" />
		
	</label>
	<g:select name="awards" from="${com.ays.Award.list()}" multiple="multiple" optionKey="id" size="5" value="${profileInstance?.awards*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="profile.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${profileInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'contactInformation', 'error')} ">
	<label for="contactInformation">
		<g:message code="profile.contactInformation.label" default="Contact Information" />
		
	</label>
	<g:select name="contactInformation" from="${com.ays.ContactInfo.list()}" multiple="multiple" optionKey="id" size="5" value="${profileInstance?.contactInformation*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="profile.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${profileInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'reviews', 'error')} ">
	<label for="reviews">
		<g:message code="profile.reviews.label" default="Reviews" />
		
	</label>
	<g:select name="reviews" from="${com.ays.Review.list()}" multiple="multiple" optionKey="id" size="5" value="${profileInstance?.reviews*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'services', 'error')} ">
	<label for="services">
		<g:message code="profile.services.label" default="Services" />
		
	</label>
	<g:select name="services" from="${com.ays.Service.list()}" multiple="multiple" optionKey="id" size="5" value="${profileInstance?.services*.id}" class="many-to-many"/>
</div>

