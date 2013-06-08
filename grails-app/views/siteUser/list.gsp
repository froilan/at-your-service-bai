
<%@ page import="com.aysb.SiteUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteUser.label', default: 'SiteUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-siteUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="preCreate"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-siteUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'siteUser.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'siteUser.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'siteUser.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'siteUser.accountLocked.label', default: 'Account Locked')}" />
					
						<th><g:message code="siteUser.employee.label" default="Employee" /></th>
					
						<th><g:message code="siteUser.employer.label" default="Employer" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${siteUserInstanceList}" status="i" var="siteUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${siteUserInstance.id}">${fieldValue(bean: siteUserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: siteUserInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${siteUserInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${siteUserInstance.accountLocked}" /></td>
					
						<td>${fieldValue(bean: siteUserInstance, field: "employee")}</td>
					
						<td>${fieldValue(bean: siteUserInstance, field: "employer")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${siteUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
