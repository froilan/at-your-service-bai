
<%@ page import="com.ays.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profile">

				<g:if test="${profileInstance?.subCategory}">
				<li class="fieldcontain">
					<span id="subCategory-label" class="property-label"><g:message code="profile.subCategory.label" default="Sub Category" /></span>

						<span class="property-value" aria-labelledby="subCategory-label"><g:link controller="subCategory" action="show" id="${profileInstance?.subCategory?.id}">${profileInstance?.subCategory?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${profileInstance?.displayPicture}">
				<li class="fieldcontain">
					<span id="displayPicture-label" class="property-label"><g:message code="profile.displayPicture.label" default="Display Picture" /></span>

				</li>
				</g:if>

				<g:if test="${profileInstance?.companyProfile}">
				<li class="fieldcontain">
					<span id="companyProfile-label" class="property-label"><g:message code="profile.companyProfile.label" default="Company Profile" /></span>

						<span class="property-value" aria-labelledby="companyProfile-label"><g:link controller="companyProfile" action="show" id="${profileInstance?.companyProfile?.id}">${profileInstance?.companyProfile?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${profileInstance?.license}">
				<li class="fieldcontain">
					<span id="license-label" class="property-label"><g:message code="profile.license.label" default="License" /></span>

						<span class="property-value" aria-labelledby="license-label"><g:link controller="license" action="show" id="${profileInstance?.license?.id}">${profileInstance?.license?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>
<%--
				<g:if test="${profileInstance?.differentiation}">
				<li class="fieldcontain">
					<span id="differentiation-label" class="property-label"><g:message code="profile.differentiation.label" default="Differentiation" /></span>

						<span class="property-value" aria-labelledby="differentiation-label"><g:fieldValue bean="${profileInstance}" field="differentiation"/></span>

				</li>
				</g:if>
 --%>
				<g:if test="${profileInstance?.feeStructure}">
				<li class="fieldcontain">
					<span id="feeStructure-label" class="property-label"><g:message code="profile.feeStructure.label" default="Fee Structure" /></span>

						<span class="property-value" aria-labelledby="feeStructure-label"><g:fieldValue bean="${profileInstance}" field="feeStructure"/></span>

				</li>
				</g:if>

				<g:if test="${profileInstance?.affiliations}">
				<li class="fieldcontain">
					<span id="affiliations-label" class="property-label"><g:message code="profile.affiliations.label" default="Affiliations" /></span>

						<g:each in="${profileInstance.affiliations}" var="a">
						<span class="property-value" aria-labelledby="affiliations-label"><g:link controller="affiliation" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${profileInstance?.askingFee}">
				<li class="fieldcontain">
					<span id="askingFee-label" class="property-label"><g:message code="profile.askingFee.label" default="Asking Fee" /></span>

						<span class="property-value" aria-labelledby="askingFee-label"><g:fieldValue bean="${profileInstance}" field="askingFee"/></span>

				</li>
				</g:if>

				<g:if test="${profileInstance?.awards}">
				<li class="fieldcontain">
					<span id="awards-label" class="property-label"><g:message code="profile.awards.label" default="Awards" /></span>

						<g:each in="${profileInstance.awards}" var="a">
						<span class="property-value" aria-labelledby="awards-label"><g:link controller="award" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>
<%--
				<g:if test="${profileInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="profile.category.label" default="Category" /></span>

						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${profileInstance?.category?.id}">${profileInstance?.category?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>
 --%>
				<g:if test="${profileInstance?.contacts}">
				<li class="fieldcontain">
					<span id="contactInformation-label" class="property-label"><g:message code="profile.contacts.label" default="Contact Information" /></span>

						<g:each in="${profileInstance.contacts}" var="c">
						<span class="property-value" aria-labelledby="contactInformation-label"><g:link controller="contactInfo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${profileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="profile.dateCreated.label" default="Date Created" /></span>

						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${profileInstance?.dateCreated}" /></span>

				</li>
				</g:if>

				<g:if test="${profileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="profile.lastUpdated.label" default="Last Updated" /></span>

						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${profileInstance?.lastUpdated}" /></span>

				</li>
				</g:if>

				<g:if test="${profileInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="profile.lastName.label" default="Last Name" /></span>

						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${profileInstance}" field="lastName"/></span>

				</li>
				</g:if>
				
				<g:if test="${profileInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="profile.firstName.label" default="First Name" /></span>

						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${profileInstance}" field="firstName"/></span>

				</li>
				</g:if>

				<g:if test="${profileInstance?.reviews}">
				<li class="fieldcontain">
					<span id="reviews-label" class="property-label"><g:message code="profile.reviews.label" default="Reviews" /></span>

						<g:each in="${profileInstance.reviews}" var="r">
						<span class="property-value" aria-labelledby="reviews-label"><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${profileInstance?.services}">
				<li class="fieldcontain">
					<span id="services-label" class="property-label"><g:message code="profile.services.label" default="Services" /></span>

						<g:each in="${profileInstance.services}" var="s">
						<span class="property-value" aria-labelledby="services-label"><g:link controller="service" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${profileInstance?.id}" />
					<g:link class="edit" action="edit" id="${profileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
