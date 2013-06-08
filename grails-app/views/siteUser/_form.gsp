<%@ page import="com.aysb.SiteUser" %>



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
	<g:textField name="password" required="" value="${siteUserInstance?.password}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="siteUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${siteUserInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="siteUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${siteUserInstance?.accountLocked}" />
</div>

--%><%--<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="siteUser.employee.label" default="Employee" />
	</label>
	<g:select id="employee" name="employee.id" from="${com.aysb.Employee.list()}" optionKey="id" required="" value="${siteUserInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'employer', 'error')} required">
	<label for="employer">
		<g:message code="siteUser.employer.label" default="Employer" />
	</label>
	<g:select id="employer" name="employer.id" from="${com.aysb.Employer.list()}" optionKey="id" required="" value="${siteUserInstance?.employer?.id}" class="many-to-one"/>
</div>

--%><%--<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="siteUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${siteUserInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: siteUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="siteUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${siteUserInstance?.passwordExpired}" />
</div>

--%>