
<%@ page import="com.ays.License" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'license.label', default: 'License')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-license" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-license" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="area" title="${message(code: 'license.area.label', default: 'Area')}" />
					
						<g:sortableColumn property="authority" title="${message(code: 'license.authority.label', default: 'Authority')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'license.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'license.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="expirationDate" title="${message(code: 'license.expirationDate.label', default: 'Expiration Date')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'license.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${licenseInstanceList}" status="i" var="licenseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${licenseInstance.id}">${fieldValue(bean: licenseInstance, field: "area")}</g:link></td>
					
						<td>${fieldValue(bean: licenseInstance, field: "authority")}</td>
					
						<td><g:formatDate date="${licenseInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: licenseInstance, field: "description")}</td>
					
						<td><g:formatDate date="${licenseInstance.expirationDate}" /></td>
					
						<td><g:formatDate date="${licenseInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${licenseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
