<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<g:set var="entityName" value="${message(code: 'site.label', default: 'At Your Service')}" />
	<title><g:message code="site.label" /></title>
</head>
<body>
    <div class="navbar">
	    <div class="navbar-inner">
		    <div class="container">
		     	<ul  class="nav">
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
	    </div>
    </div>

	<div class="container-fluid search-container">
		<div style="display:none;">
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="create" action="preCreate" controller="siteUser"><g:message code="signup.label" /></g:link></li>
					<li><g:link class="create" controller="login"><g:message code="login.label" /></g:link></li>
				</ul>
			</div>
		</div>
		<div class="container">
			<div class="row-fluid">
				<div class="span6">
			    	<h2>The smart way to hire services in Cebu City</h2>
			    	<blockquote class="quote-home">Start finding trusted contractors, professionals and skilled workers for free!</blockquote>
			   	</div>
			   	<div class="span6">
					<div class="content scaffold-create" role="main">
						<div role="search" class="searchform">
							<g:form action="search" >
								<fieldset class="form">
									<g:render template="form"/>
								</fieldset>
								<fieldset class="buttons">
									<g:submitButton name="create" class="save btn btn-large btn-block btn-primary" value="${message(code: 'default.button.search.label', default: 'Search')}" />
								</fieldset>
							</g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="container sub-content">
			<h3>View Cebu's finest:</h3>
			<ul class="circular-menu">
				<li><h4><g:message code="template.search.contractors" /></h4>
					<g:link class="circle-icon" controller="search" action="search" params="[category:'contractors']"><img src="<g:resource dir="images" file="icon-house.png" />" /></g:link>
					<g:link controller="search" action="search" params="[category:'contractors']"><g:message code="search.label" /></g:link>
				</li>
				<li><h4><g:message code="template.search.doctors" /></h4>
					<g:link class="circle-icon" controller="search" action="search" params="[category:'doctors']"><img src="<g:resource dir="images" file="icon-medical.png" />" /></g:link>
					<g:link controller="search" action="search" params="[category:'doctors']"><g:message code="search.label" /></g:link>
				</li>
				<li><h4><g:message code="template.search.gardeners" /></h4>
					<g:link class="circle-icon" controller="search" action="search" params="[category:'gardeners']"><img src="<g:resource dir="images" file="icon-plant.png" />" /></g:link>
					<g:link controller="search" action="search" params="[category:'gardeners']"><g:message code="search.label" /></g:link>
				</li>
				<li><h4><g:message code="template.search.accountants" /></h4>
					<g:link class="circle-icon" controller="search" action="search" params="[category:'accountants']"> <img src="<g:resource dir="images" file="icon-table.png" />" /></g:link>
					<g:link controller="search" action="search" params="[category:'accountants']"> <g:message code="search.label" /></g:link>
				</li>
				<li><h4><g:message code="template.search.lawyers" /></h4>
					<g:link class="circle-icon" controller="search" action="search" params="[category:'lawyers']"><img src="<g:resource dir="images" file="icon-judge.png" />" /></g:link>
					<g:link controller="search" action="search" params="[category:'lawyers']"><g:message code="search.label" /></g:link>
				</li>
				<li><h4><g:message code="template.search.bookkeepers" /></h4>
					<g:link class="circle-icon" controller="search" action="search" params="[category:'bookkeepers']"><img src="<g:resource dir="images" file="icon-books.png" />" /></g:link>
				 	<g:link controller="search" action="search" params="[category:'bookkeepers']"><g:message code="search.label" /></g:link>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>