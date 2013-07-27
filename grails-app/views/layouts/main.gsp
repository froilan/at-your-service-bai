<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>At Your Service</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" type="text/css">
		<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700italic,400italic,700|Muli:400,300,300italic,400italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700italic,400italic,700' rel='stylesheet' type='text/css'>
		<!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css"> -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'app-general-style.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'app-user-style.css')}" type="text/css">
		<!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css"> -->
		<script src="${resource(dir: 'js', file: 'jquery.js')}"></script>
		<script src="${resource(dir: 'js', file: 'app-biz-form.js')}"></script>
		<g:layoutHead/>
		<calendar:resources lang="en" theme="blue2"/>
		<r:layoutResources />
	</head>
	<body>
	<div id="wrap">
	
		<div id="header">	
			<div class="wrap">
				<div class="header-left">
					<g:link class="logo-link" controller="home"><img src="${resource(dir: 'images', file: 'atyourservice-logo-a.png')}"></g:link>
				</div>	
		
				<div class="header-right">			
					<div class="logout-btn blue-btn">
						<sec:ifLoggedIn>
							<g:link controller="logout"><g:message code="logout.label" /></g:link>
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
							<g:link controller="login"><g:message code="login.label" /></g:link>
						</sec:ifNotLoggedIn>
					</div>
					<sec:ifLoggedIn>
					<div class="user-info">
						<!-- <p class="bold">Welcome <span class="first-last-name">John Smith</span></p>
						<p class="header-company">ABC Corporation</p> -->
						<g:welcome />
					</div>
					</sec:ifLoggedIn>
				</div>
			</div><!-- .end wrap -->
		</div><!-- end #header -->
		
		<div id="nav">
			<div class="wrap">
				<ul class="top-left-menu business-user-menu">
					<li><g:link controller="home">Home</g:link></li>
					<sec:ifLoggedIn>
						<li><g:link controller="profile" action="contentManager">Content Manager</g:link></li>
						<li><g:link controller="profile" action="show">Public Profile</g:link></li>
					</sec:ifLoggedIn>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>
		</div><!-- end #nav -->
		
		<g:layoutBody/>
		
		<div id="footer">
			<div class="wrap">
				<div class="footer-left">
					<p>© Copyright 2013  |  <a href="#" target="_blank">AtYourService.ph</a>  |  All rights reserved  |  <a href="#" target="_blank">Terms of Service</a></p>
				</div>
				<div class="footer-right">
					<a href="#" target="_blank"><img src="${resource(dir: 'images', file: 'ays-app-footer-logo.png')}" alt="at your service logo"></a>
				</div>
			</div>
		</div><!-- end #footer -->
		
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
		
	</div>
	</body>
</html>