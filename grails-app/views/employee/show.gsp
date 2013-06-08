
<%@ page import="com.aysb.Employee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-employee" class="content scaffold-show" role="main">
			<h1>
				<g:if test="${employeeInstance?.photo}">
						<span id="photo-label" class="property-label">
							<img class="photo" src="${createLink(controller:'employee', action:'avatar_image', id:employeeInstance?.id)}" />
						</span>
					</g:if>
					<g:if test="${employeeInstance?.name}">
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${employeeInstance}" field="name"/></span>
					</g:if>
			</h1>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<ol class="property-list employee">
				
				<%--<li class="fieldcontain">
					<g:if test="${employeeInstance?.photo}">
						<span id="photo-label" class="property-label">
							<img class="photo" src="${createLink(controller:'employee', action:'avatar_image', id:employeeInstance?.id)}" />
						</span>
					</g:if>
					<g:if test="${employeeInstance?.name}">
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${employeeInstance}" field="name"/></span>
					</g:if>
				</li>
				--%>
				
				<g:if test="${employeeInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="employee.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label">
						
							<g:fieldValue bean="${employeeInstance}" field="rating"/>
						
						</span>
				</li>
				</g:if>

				<g:if test="${employeeInstance?.highRate || employeeInstance?.lowRate}">
				<li class="fieldcontain">
					<span id="rate-label" class="property-label"><g:message code="employee.rate.label" default="Rate" /></span>
					
						<span class="property-value" aria-labelledby="highRate-label">
						
							<g:fieldValue bean="${employeeInstance}" field="lowRate"/> - <g:fieldValue bean="${employeeInstance}" field="highRate"/>
						
						</span>
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.negotiableRate}">
					<li class="fieldcontain">
						<span id="negotiableRate-label" class="property-label"><g:message code="employee.negotiableRate.label" default="(Negotiable)" /></span>
					</li>
				</g:if>
							
				<g:if test="${employeeInstance?.contactNumber}">
				<li class="fieldcontain">
					<span id="contactNumber-label" class="property-label"><g:message code="employee.contactNumber.label" default="Contact Number" /></span>
					
						<span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${employeeInstance}" field="contactNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="employee.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${employeeInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="employee.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${employeeInstance}" field="email"/></span>
				</li>
				</g:if>				
			
				<g:if test="${employeeInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="employee.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${employeeInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.subCategory}">
				<li class="fieldcontain">
					<span id="subCategory-label" class="property-label"><g:message code="employee.subCategory.label" default="Sub Category" /></span>
					
						<span class="property-value" aria-labelledby="subCategory-label"><g:fieldValue bean="${employeeInstance}" field="subCategory"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.companyProfile}">
				<li class="fieldcontain">
					<span id="companyProfile-label" class="property-label"><g:message code="employee.companyProfile.label" default="Company Profile" /></span>
					
						<span class="property-value" aria-labelledby="companyProfile-label"><g:link controller="companyProfile" action="show" id="${employeeInstance?.companyProfile?.id}">${employeeInstance?.companyProfile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.clients}">
				<li class="fieldcontain">
					<span id="clients-label" class="property-label"><g:message code="employee.clients.label" default="Clients" /></span>
					
						<g:each in="${employeeInstance.clients}" var="c">
						<span class="property-value" aria-labelledby="clients-label"><g:link controller="client" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			
				<g:if test="${employeeInstance?.skills}">
				<li class="fieldcontain">
					<span id="skills-label" class="property-label"><g:message code="employee.skills.label" default="Skills" /></span>
					
						<span class="property-value" aria-labelledby="skills-label"><g:fieldValue bean="${employeeInstance}" field="skills"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${employeeInstance?.averageRating}">
				<li class="fieldcontain">
					<span id="skills-label" class="property-label">Average Rating</span>
					
						<span class="property-value" aria-labelledby="rating-label">${employeeInstance.getAverageRating()}</span>
					
				</li>
				</g:if>
			
			</ol>
			
			<sec:ifLoggedIn>
				<g:if test="${sameEmployee}">
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${employeeInstance?.id}" />
							<g:link class="edit" action="edit" id="${employeeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						</fieldset>
					</g:form>
				</g:if>
				<sec:ifAllGranted roles="ROLE_EMPLOYER">
					<g:form>
						<fieldset class="buttons">
							<g:link action="postReview" id="${employeeInstance?.id}">Post Review</g:link>
						</fieldset>
					</g:form>
				</sec:ifAllGranted>
			</sec:ifLoggedIn>
			<%--
				TODO: add back to search results button here later	 			 
			--%>
		</div>
	</body>
</html>
