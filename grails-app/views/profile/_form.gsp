<%@ page import="com.ays.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'subCategory', 'error')} ">
	<label for="subCategory">
		<g:message code="profile.subCategory.label" default="Sub Category" />
		
	</label>
	<g:select id="subCategory" name="subCategory.id" from="${com.ays.SubCategory.list()}" optionKey="id" value="${profileInstance?.subCategory?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'displayPicture', 'error')} ">
	<label for="displayPicture">
		<g:message code="profile.displayPicture.label" default="Display Picture" />
		
	</label>
	<input type="file" id="displayPicture" name="displayPicture" />
</div>

<%--<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'companyProfile', 'error')} ">
	<label for="companyProfile">
		<g:message code="profile.companyProfile.label" default="Company Profile" />
		
	</label>
	<g:select id="companyProfile" name="companyProfile.id" from="${com.ays.CompanyProfile.list()}" optionKey="id" value="${profileInstance?.companyProfile?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

--%><%--<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'license', 'error')} ">
	<label for="license">
		<g:message code="profile.license.label" default="License" />
		
	</label>
	<g:select id="license" name="license.id" from="${com.ays.License.list()}" optionKey="id" value="${profileInstance?.license?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

--%><div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'differentiation', 'error')} ">
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

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="profile.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.ays.Category.list()}" optionKey="id" required="" value="${profileInstance?.category?.id}" class="many-to-one"/>
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

