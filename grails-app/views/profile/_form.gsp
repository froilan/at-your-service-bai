<%@ page import="com.ays.Profile" %>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="profile.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.ays.Category.list()}" optionKey="id" required="" value="${profileInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'subCategory', 'error')} ">
	<label for="subCategory">
		<g:message code="profile.subCategory.label" default="Sub Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subCategory" name="subCategory.id" from="${com.ays.SubCategory.list()}" optionKey="id" value="${profileInstance?.subCategory?.id}" class="many-to-one" noSelection="['': '- select a category -']"/>
</div>
<%--
<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'displayPicture', 'error')} ">
	<label for="displayPicture">
		<g:message code="profile.displayPicture.label" default="Display Picture" />

	</label>
	<input type="file" id="displayPicture" name="displayPicture" />
</div>
--%>
<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'differentiation', 'error')} ">
	<label for="differentiation">
		<g:message code="profile.differentiation.label" default="Differentiation" />

	</label>
	<g:textField name="differentiation" value="${profileInstance?.differentiation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'feeStructure', 'error')} ">
	<label for="feeStructure">
		<g:message code="profile.feeStructure.label" default="Fee Structure" />

	</label>
	<g:select name="feeStructure" from="${com.ays.FeeStructure?.values()}" keys="${com.ays.FeeStructure.values()*.name()}" value="${profileInstance?.feeStructure?.name()}" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: affiliationInstance, field: 'name', 'error')} ">
	<label for="affiliation">
		<g:message code="profile.affiliation.label" default="Affiliation" />
	</label>
	<g:textField name="affiliation.name" value="${affiliationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: affiliationInstance, field: 'role', 'error')} ">
	<label for="affiliation.role">
		<g:message code="profile.affiliation.role.label" default="Affiliation Role" />
	</label>
	<g:textField name="affiliation.role" value="${affiliationInstance?.role}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'askingFee', 'error')} required">
	<label for="askingFee">
		<g:message code="profile.askingFee.label" default="Asking Fee" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="askingFee" value="${fieldValue(bean: profileInstance, field: 'askingFee')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'name', 'error')} ">
	<label for="award">
		<g:message code="profile.award.label" default="Award" />
	</label>
	<g:textField name="award.name" value="${awardInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'year', 'error')} ">
	<label for="award.year">
		<g:message code="profile.award.year.label" default="Award Year" />
	</label>
	<g:textField name="award.year" value="${awardInstance?.year}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'description', 'error')} ">
	<label for="award.description">
		<g:message code="profile.award.description.label" default="Award Description" />
	</label>
	<g:textField name="award.description" value="${awardInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInfoInstance, field: 'name', 'error')} ">
	<label for="contactInfo.type">
		<g:message code="profile.contactInfo.type.label" default="Contact Info Type" />
	</label>
	<g:select name="contactInfo.type" from="${com.ays.ContactInfoType?.values()}" keys="${com.ays.ContactInfoType.values()*.name()}" value="${contactInfoInstance?.type?.name()}" noSelection="['': '- select a type -']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInfoInstance, field: 'value', 'error')} ">
	<label for="contactInfo.value">
		<g:message code="profile.contactInfo.value.label" default="Contact Info Value" />
	</label>
	<g:textField name="contactInfo.value" value="${contactInfoInstance?.value}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: primaryServiceInstance, field: 'name', 'error')} ">
	<label for="primaryService.name">
		<g:message code="profile.primaryService.name.label" default="Primary Service Offering" />
	</label>
	<g:textField name="primaryService.name" value="${primaryServiceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: primaryServiceInstance, field: 'description', 'error')} ">
	<label for="primaryService.description">
		<g:message code="profile.primaryService.description.label" default="Primary Service Description" />
	</label>
	<g:textField name="primaryService.description" value="${primaryServiceInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secondaryServiceInstance, field: 'name', 'error')} ">
	<label for="secondaryService.name">
		<g:message code="profile.secondaryService.name.label" default="Secondary Service Offering" />
	</label>
	<g:textField name="secondaryService.name" value="${secondaryServiceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secondaryServiceInstance, field: 'description', 'error')} ">
	<label for="secondaryService.description">
		<g:message code="profile.secondaryService.description.label" default="Secondary Service Description" />
	</label>
	<g:textField name="secondaryService.description" value="${secondaryServiceInstance?.description}"/>
</div>