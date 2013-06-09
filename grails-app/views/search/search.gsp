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
    </div>	<div class="container-fluid search-result">
		<div class="container">
			<div class="row-fluid">
				<div class="span4 refine-search-form">
					<h2>Refine Results</h2>
					<div role="search">
						<g:form action="search" >
							<fieldset class="form">
								<g:render template="form"/>
							</fieldset>
							<fieldset class="buttons">
								<g:submitButton name="create" class="save btn btn-large btn-block btn-primary" value="${message(code: 'search.results.label', default: 'Search')}" />
							</fieldset>
						</g:form>
					</div>
				</div>
				<div class="span8">	
					<div role="result" class="result-list">
						<h3>Results:</h3>
						<g:render template="result"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>