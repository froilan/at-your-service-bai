<head>
<meta name='layout' content='main' />
<title><g:message code='springSecurity.denied.title' /></title>
</head>

<body>
<g:form action='updatePassword'>
	<g:passwordField name='password'/>
	<g:passwordField name='newPassword'/>
	<g:passwordField name='newPassword2'/>
	<input type="submit" value="change"/>
	<g:message code="${flash.message}"/>
</g:form>
</body>