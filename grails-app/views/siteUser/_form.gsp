<%@ page import="com.ays.SiteUser" %>



<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="siteUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${siteUserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="siteUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" id="password" required=""/>
	<span id="confirmMessage" class="confirmMessage"></span>
</div>

<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'passwordRetry', 'error')} required">
	<label for="passwordRetry">
		<g:message code="siteUser.repassword.label" default="Re-Type Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="passwordRetry" id="passwordRetry" required="" onkeyup="checkPass(); return false"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="siteUser.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${siteUserInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="siteUser.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${siteUserInstance?.lastName}"/>
</div>

<img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}"/>
<label for="captcha">Type the letters above in the box below:</label>
<g:textField name="captcha"/>

