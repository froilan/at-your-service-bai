<%@ page import="com.aysb.Review" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-review" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-review" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${reviewInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${reviewInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="submitReview" >
				<fieldset class="form">
					<input type="hidden" name="empId" value"${employeeId}" />
					<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'rating', 'error')} required">
						<label for="rating">
							<g:message code="review.rating.label" default="Rating" />
							<span class="required-indicator">*</span>
						</label>
						<g:field name="rating" value="${fieldValue(bean: reviewInstance, field: 'rating')}" required=""/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'remarks', 'error')} ">
						<label for="remarks">
							<g:message code="review.remarks.label" default="Remarks" />
							
						</label>
						<g:textArea name="remarks" rows="5" value="${reviewInstance?.remarks}"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
