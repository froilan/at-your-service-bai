
<%@ page import="com.aysb.Employee" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-employee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'employee.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="contactNumber" title="${message(code: 'employee.contactNumber.label', default: 'Contact Number')}" />
					
						<g:sortableColumn property="location" title="${message(code: 'employee.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="highRate" title="${message(code: 'employee.highRate.label', default: 'High Rate')}" />
					
						<g:sortableColumn property="lowRate" title="${message(code: 'employee.lowRate.label', default: 'Low Rate')}" />
					
						<g:sortableColumn property="category" title="${message(code: 'employee.category.label', default: 'Category')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${employeeInstance.id}">${fieldValue(bean: employeeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: employeeInstance, field: "contactNumber")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "location")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "highRate")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "lowRate")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "category")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${employeeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
