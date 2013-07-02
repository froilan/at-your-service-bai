
<%@ page import="com.ays.CompanyProfile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'companyProfile.label', default: 'CompanyProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-companyProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-companyProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="logo" title="${message(code: 'companyProfile.logo.label', default: 'Logo')}" />
					
						<g:sortableColumn property="inBusinessSince" title="${message(code: 'companyProfile.inBusinessSince.label', default: 'In Business Since')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'companyProfile.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="directionsToAddress" title="${message(code: 'companyProfile.directionsToAddress.label', default: 'Directions To Address')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'companyProfile.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'companyProfile.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${companyProfileInstanceList}" status="i" var="companyProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${companyProfileInstance.id}">${fieldValue(bean: companyProfileInstance, field: "logo")}</g:link></td>
					
						<td>${fieldValue(bean: companyProfileInstance, field: "inBusinessSince")}</td>
					
						<td>${fieldValue(bean: companyProfileInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: companyProfileInstance, field: "directionsToAddress")}</td>
					
						<td><g:formatDate date="${companyProfileInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: companyProfileInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companyProfileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
