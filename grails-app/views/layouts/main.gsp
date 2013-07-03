<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" type="text/css">
		<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700italic,400italic,700|Muli:400,300,300italic,400italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700italic,400italic,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css"> -->
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<header class="container-fluid">
			<div class="container header">
					<h1 class="logo"><a href="">At Your Service</a></h1>
			<!-- <a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a> -->
					<div class="user-options">
						<sec:ifLoggedIn>
							<%--g:link class="create btn login-btn" action="create" controller="siteUser"><g:message code="signup.label" /></g:link--%>
							<g:link class="create btn btn-primary" controller="logout"><g:message code="logout.label" /></g:link>
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
							<g:link class="create btn login-btn" action="create" controller="siteUser"><g:message code="signup.label" /></g:link>
							<g:link class="create btn btn-primary" controller="login"><g:message code="login.label" /></g:link>
						</sec:ifNotLoggedIn>
					</div>
				</div>
			</div>
		</header>
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
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
		<footer class="container-fluid">
			<div class="container footer">
				<a class="footer-logo" href="#">At Your Service</a>
				<p class="copyright">&copy; Copyright 2013 | AtYourService.ph | All rights reserved | Terms of Service</p>
			</div>
		</footer>
	</body>
</html>