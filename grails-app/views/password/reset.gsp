<head>
<meta name='layout' content='main' />
<title><g:message code='springSecurity.denied.title' /></title>
</head>

<body>
<g:form action='resetPassword'>
	<g:textField name="username"/>
	<input type="submit" value="reset"/>
	<g:message code="${flash.message}"/>
</g:form>
</body>