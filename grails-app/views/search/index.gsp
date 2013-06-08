<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<g:set var="entityName" value="${message(code: 'site.label', default: 'At Your Service')}" />
	<title><g:message code="site.label" /></title>
</head>
<body>

	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link class="create" action="preCreate" controller="siteUser"><g:message code="signup.label" /></g:link></li>
			<sec:ifNotLoggedIn>
				<li><g:link class="create" controller="login"><g:message code="login.label" /></g:link></li>
			</sec:ifNotLoggedIn>
			<sec:ifLoggedIn>
				<li><g:link class="create" controller="logout"><g:message code="logout.label" default="Log Out" /></g:link></li>
			</sec:ifLoggedIn>
		</ul>
	</div>
	
	<div class="content scaffold-create" role="main">
		<div role="search">
			<g:form action="search" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'search.label', default: 'Search')}" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>