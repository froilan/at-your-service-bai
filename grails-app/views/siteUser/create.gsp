<%@ page import="com.aysb.SiteUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteUser.label', default: 'SiteUser')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-siteUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-siteUser" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${siteUserInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${siteUserInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>${isEmployee}
				<g:if test = "${isEmployee}">
					<fieldset id="employeeDetails" class="form">
						<g:render template="/employee/form"/>
					</fieldset>
				</g:if>
				<g:else>
					<fieldset id="employerDetails" class="form">
						<g:render template="/employer/form"/>
					</fieldset>
				</g:else>
				<g:hiddenField name="isEmployee" value="${isEmployee}"/>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
