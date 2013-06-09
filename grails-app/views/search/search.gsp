<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<g:set var="entityName" value="${message(code: 'site.label', default: 'At Your Service')}" />
	<title><g:message code="site.label" /></title>
</head>
<body>
	<div role="search template">
		<ul>
			<li>
				<g:link controller="search" action="search" params="[category:'accountants']"><g:message code="template.search.accountants" /></g:link>
			</li>
			<li>
				<g:link controller="search" action="search" params="[category:'doctors']"><g:message code="template.search.doctors" /></g:link>
			</li>
			<li>
				<g:link controller="search" action="search" params="[category:'legal services']"><g:message code="template.search.services" /></g:link>
			</li>
			<li>
				<g:link controller="search" action="search" params="[category:'nurses']"><g:message code="template.search.nurses" /></g:link>
			</li>
			<li>
				<g:link controller="search" action="search" params="[category:'bookkeepers']"><g:message code="template.search.bookkeepers" /></g:link>
			</li>
			<li>
				<g:link controller="search" action="search" params="[category:'caretakes']"><g:message code="template.search.caretakes" /></g:link>
			</li>	
		</ul>
	</div>
	
	<div class="content scaffold-create" role="main">
		<div role="search">
			<g:form action="search" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'search.results.label', default: 'Search')}" />
				</fieldset>
			</g:form>
		</div>
		
		<div role="result">
			<h1> Results </h1>
			<g:render template="result"/>
		</div>
		
	</div>
</body>
</html>