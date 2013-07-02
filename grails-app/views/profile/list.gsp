
<%@ page import="com.ays.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-profile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="profile.subCategory.label" default="Sub Category" /></th>
					
						<g:sortableColumn property="displayPicture" title="${message(code: 'profile.displayPicture.label', default: 'Display Picture')}" />
					
						<th><g:message code="profile.companyProfile.label" default="Company Profile" /></th>
					
						<th><g:message code="profile.license.label" default="License" /></th>
					
						<g:sortableColumn property="differentiation" title="${message(code: 'profile.differentiation.label', default: 'Differentiation')}" />
					
						<g:sortableColumn property="feeStructure" title="${message(code: 'profile.feeStructure.label', default: 'Fee Structure')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${profileInstanceList}" status="i" var="profileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${profileInstance.id}">${fieldValue(bean: profileInstance, field: "subCategory")}</g:link></td>
					
						<td>${fieldValue(bean: profileInstance, field: "displayPicture")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "companyProfile")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "license")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "differentiation")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "feeStructure")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
