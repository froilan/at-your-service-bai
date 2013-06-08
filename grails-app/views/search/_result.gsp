<%@ page import="com.aysb.Result" %>

<g:each in="${results}" var="result">
	<div id="list-employee" class="content scaffold-list" role="main">
		${result.siteUser?.username}
		${result.employee } 
	</div>
</g:each>


