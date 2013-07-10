<%@ page import="com.ays.SiteUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteUser.label', default: 'SiteUser')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript">
		function checkPass() {
		    //Store the password field objects into variables ...
		    var pass1 = document.getElementById('password');
		    var pass2 = document.getElementById('passwordRetry');
		    //Store the Confimation Message Object ...
		    var message = document.getElementById('confirmMessage');
		    //Set the colors we will be using ...
		    var goodColor = "#66cc66";
		    var badColor = "#ff6666";
		    //Compare the values in the password field 
		    //and the confirmation field
		    if (pass1.value == pass2.value) {
		        //The passwords match. 
		        //Set the color to the good color and inform
		        //the user that they have entered the correct password 
		        pass2.style.backgroundColor = goodColor;
		        message.style.color = goodColor;
		        message.innerHTML = "Passwords Match!"
		    } else {
		        //The passwords do not match.
		        //Set the color to the bad color and
		        //notify the user.
		        pass2.style.backgroundColor = badColor;
		        message.style.color = badColor;
		        message.innerHTML = "Passwords Do Not Match!"
		    }
		} 
	</script>
	</head>
	<body>
		<div id="create-siteUser" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${siteUserInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${siteUserInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
