<%@ page import="com.ays.SiteUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteUser.label', default: 'SiteUser')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</script>
	</head>
	<body>
		<a href="#create-siteUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<a href="${createLink(uri: '/')}">I just want to search</a>
		<g:link controller="profile" action="create">I want to create my profile</g:link>
	</body>
</html>
