
<%@ page import="com.aysb.Employer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employer.label', default: 'Employer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-employer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-employer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list employer">
			
				<g:if test="${employerInstance?.contractNumber}">
				<li class="fieldcontain">
					<span id="contractNumber-label" class="property-label"><g:message code="employer.contractNumber.label" default="Contract Number" /></span>
					
						<span class="property-value" aria-labelledby="contractNumber-label"><g:fieldValue bean="${employerInstance}" field="contractNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="employer.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${employerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:if test="${loggedIn == true}">
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${employerInstance?.id}" />
						<g:link class="edit" action="edit" id="${employerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					</fieldset>
				</g:form>
			</g:if>
		</div>
	</body>
</html>
