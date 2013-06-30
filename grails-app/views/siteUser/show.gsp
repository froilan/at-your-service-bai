
<%@ page import="com.ays.SiteUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteUser.label', default: 'SiteUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-siteUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-siteUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list siteUser">
			
				<g:if test="${siteUserInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="siteUser.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${siteUserInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="siteUser.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${siteUserInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.profile}">
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="siteUser.profile.label" default="Profile" /></span>
					
						<span class="property-value" aria-labelledby="profile-label"><g:link controller="profile" action="show" id="${siteUserInstance?.profile?.id}">${siteUserInstance?.profile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.membership}">
				<li class="fieldcontain">
					<span id="membership-label" class="property-label"><g:message code="siteUser.membership.label" default="Membership" /></span>
					
						<span class="property-value" aria-labelledby="membership-label"><g:link controller="membership" action="show" id="${siteUserInstance?.membership?.id}">${siteUserInstance?.membership?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="siteUser.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${siteUserInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="siteUser.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${siteUserInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.bookmarks}">
				<li class="fieldcontain">
					<span id="bookmarks-label" class="property-label"><g:message code="siteUser.bookmarks.label" default="Bookmarks" /></span>
					
						<g:each in="${siteUserInstance.bookmarks}" var="b">
						<span class="property-value" aria-labelledby="bookmarks-label"><g:link controller="bookmark" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="siteUser.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${siteUserInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="siteUser.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${siteUserInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="siteUser.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${siteUserInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.otherFeatures}">
				<li class="fieldcontain">
					<span id="otherFeatures-label" class="property-label"><g:message code="siteUser.otherFeatures.label" default="Other Features" /></span>
					
						<g:each in="${siteUserInstance.otherFeatures}" var="o">
						<span class="property-value" aria-labelledby="otherFeatures-label"><g:link controller="feature" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${siteUserInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="siteUser.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${siteUserInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${siteUserInstance?.id}" />
					<g:link class="edit" action="edit" id="${siteUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
