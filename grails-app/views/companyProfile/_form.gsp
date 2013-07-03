<%@ page import="com.ays.CompanyProfile" %>


<%--
<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="companyProfile.logo.label" default="Logo" />

	</label>
	<input type="file" id="logo" name="logo" />
</div>
--%>
<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'inBusinessSince', 'error')} ">
	<label for="inBusinessSince">
		<g:message code="companyProfile.inBusinessSince.label" default="In Business Since" />

	</label>
	<g:field name="inBusinessSince" type="number" value="${companyProfileInstance.inBusinessSince}"/>
</div>

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
<%--
<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'contactInformation', 'error')} ">
	<label for="contactInformation">
		<g:message code="companyProfile.contactInformation.label" default="Contact Information" />

	</label>
	<g:select name="contactInformation" from="${com.ays.ContactInfo.list()}" multiple="multiple" optionKey="id" size="5" value="${companyProfileInstance?.contactInformation*.id}" class="many-to-many"/>
</div>
--%>
<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="companyProfile.description.label" default="Description" />

	</label>
	<g:textField name="description" value="${companyProfileInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="companyProfile.name.label" default="Name" />

	</label>
	<g:textField name="name" value="${companyProfileInstance?.name}"/>
</div>
<%--
<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="companyProfile.photos.label" default="Photos" />

	</label>
	<g:select name="photos" from="${com.ays.PlaceOfBusinessPhoto.list()}" multiple="multiple" optionKey="id" size="5" value="${companyProfileInstance?.photos*.id}" class="many-to-many"/>
</div>
--%>
