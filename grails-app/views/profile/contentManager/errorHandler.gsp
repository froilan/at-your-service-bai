<html>
<head>
	<meta name="layout" content="main">
</head>
<body>
	<g:eachError bean="${profileInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${companyProfileInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${licenseInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${primaryServiceInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${secondaryServiceInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${differentiationInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${affiliationInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${awardInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${phoneNumberInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${emailInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${websiteInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${facebookInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${twitterInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<g:eachError bean="${linkedInInstance}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
			<g:message error="${error}"/>
		</li>
	</g:eachError>
	<br><br>
	<g:link event="restart">Restart</g:link>
</body>
</html>