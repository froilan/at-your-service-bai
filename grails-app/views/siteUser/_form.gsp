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


