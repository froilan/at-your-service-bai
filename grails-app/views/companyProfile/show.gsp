
<%@ page import="com.ays.CompanyProfile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'companyProfile.label', default: 'CompanyProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-companyProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-companyProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list companyProfile">
			
				<g:if test="${companyProfileInstance?.logo}">
				<li class="fieldcontain">
					<span id="logo-label" class="property-label"><g:message code="companyProfile.logo.label" default="Logo" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyProfileInstance?.inBusinessSince}">
				<li class="fieldcontain">
					<span id="inBusinessSince-label" class="property-label"><g:message code="companyProfile.inBusinessSince.label" default="In Business Since" /></span>
					
						<span class="property-value" aria-labelledby="inBusinessSince-label"><g:fieldValue bean="${companyProfileInstance}" field="inBusinessSince"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyProfileInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="companyProfile.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${companyProfileInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyProfileInstance?.directionsToAddress}">
				<li class="fieldcontain">
					<span id="directionsToAddress-label" class="property-label"><g:message code="companyProfile.directionsToAddress.label" default="Directions To Address" /></span>
					
						<span class="property-value" aria-labelledby="directionsToAddress-label"><g:fieldValue bean="${companyProfileInstance}" field="directionsToAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyProfileInstance?.contactInformation}">
				<li class="fieldcontain">
					<span id="contactInformation-label" class="property-label"><g:message code="companyProfile.contactInformation.label" default="Contact Information" /></span>
					
						<g:each in="${companyProfileInstance.contactInformation}" var="c">
						<span class="property-value" aria-labelledby="contactInformation-label"><g:link controller="contactInfo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${companyProfileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="companyProfile.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${companyProfileInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyProfileInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="companyProfile.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${companyProfileInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyProfileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="companyProfile.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${companyProfileInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyProfileInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="companyProfile.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${companyProfileInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyProfileInstance?.photos}">
				<li class="fieldcontain">
					<span id="photos-label" class="property-label"><g:message code="companyProfile.photos.label" default="Photos" /></span>
					
						<g:each in="${companyProfileInstance.photos}" var="p">
						<span class="property-value" aria-labelledby="photos-label"><g:link controller="placeOfBusinessPhoto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${companyProfileInstance?.id}" />
					<g:link class="edit" action="edit" id="${companyProfileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
