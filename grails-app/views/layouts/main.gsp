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
						<a href="#">List Your Services</a>
						<a class="btn login-btn" href="#">Login</a>
					</div>
				</div>
			</div>
		</header>
		<div class="navbar">
	    	<div class="navbar-inner">
	    		 <div class="container">
		    		<ul class="nav">
		    			<li><a href="#">Accountant</a></li>
		    			<li><a href="#">Doctors</a></li>
		   			 	<li><a href="#">Legal Services</a></li>
		   			 	<li><a href="#">Nurses</a></li>
		   			 	<li><a href="#">Bookkeepers</a></li>
		   			 	<li><a href="#">Caretakers</a></li>
		    		</ul>
		    	 </div>
	    	</div>
	    </div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
		<footer>
			<p class="copyright">&copy; Copyright 2013 | AtYourService.ph | All rights reserved | Terms of Service</p>
		</footer>
	</body>
</html>