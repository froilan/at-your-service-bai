<%@ page import="com.ays.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
	<div id="inner">
		<div id="inner-wrap">
			
			<div id="inner-title">
				<div class="title-left">
					<h1 class="page-title">Setup Your Profile</h1>
				</div>
				<div class="title-right-meta">
					<p><span class="steps">Step <span class="current-step">2</span> of <span class="total-steps">5</span></span> <span class="time-to-complete">| Est. 1-2 minutes</span></p>
				</div>
			</div><!-- #inner-title -->
			
			<div id="content-sidebar-inside-wrap" class="initalize-process">
		
				<div id="primary-sidebar">
					<div class="wrap">
						<ul class="primary-sidebar-menu">
							<li class="page active parent"><a href="#">Public Profile<span class="dropdown-arrow"></span></a></li>
							<ul class="page-sub-menu">
								<li class="completed"><a href="http://184.173.193.62/%7Eays/app/step-1-categories-and-offerings.html">Categories &amp; Offerings</a></li>
								<li class="active-menu-item"><a class="active" href="http://184.173.193.62/%7Eays/app/step-2-company-info.html">General Company Info</a></li>
								<li class="not-clickable"><a href="http://184.173.193.62/%7Eays/app/step-3-location-and-directions.html">Location &amp; Directions</a></li>
								<li class="not-clickable"><a href="http://184.173.193.62/%7Eays/app/step-4-professional-and-licensing.html">Professional &amp; Licensing</a></li>
								<li class="not-clickable"><a href="http://184.173.193.62/%7Eays/app/step-5-contact-information.html">Contact Information</a></li>
								<li class=""><a href="http://184.173.193.62/%7Eays/app/content-manager-template.html">Template</a></li>
							</ul>
						</ul>
					</div><!-- end .wrap -->
				</div><!-- end #primary-sidebar -->
			
					<div id="content">
						<div class="wrap">
							<h2 class="category-heading">Company Information &amp; Rates</h2>
							<a href="#" class="hide tips-link">show tips</a>
							<ul class="tips hidden">
								<li>The red asterisk <span class="red">*</span> denotes required fields.</li>
								<li>The blue <span class="blue-star">star</span> denotes <span class="prem-brand">premium content</span>
 and will only be shown to premium users.  You can promote your business
 by making this premium content public to all users by signing up for a 
premium business account at the end of this form.</li>
								<li><span class="tip-badge">Hot Tip</span> The more quality information you enter, the more trusted your profile will be and the more business you will attract.</li>
							</ul>
							<div class="step-2 edit form-wrap">
								<g:form enctype="multipart/form-data">
									<ul class="outer-form-ul">
										
										<li id="company-info-and-rates" class="input-section">
											<h3>Logo &amp; Professional Photo</h3>
											<p>Upload your logo and personal professional photo (this is 
important for client credibility online and so clients can identify you 
and your brand).</p>
											<ul class="input-wrap file-upload">
												<g:if test="${companyProfileInstance.logo}">
												  <img src="${createLink(controller:'profile', action:'logo', id:companyProfileInstance.id)}" />
												</g:if>
												<li class="user-input">
													<input name="logo" value="select logo..." type="file">	
													<p class="file-instructions">200px min width. Accepts jpg, png or gif only.</p>
												</li>
												<g:if test="${profileInstance.displayPicture}">
												  <img src="${createLink(controller:'profile', action:'displayPicture', id:profileInstance.id)}" />
												</g:if>
												<li class="user-input">
													<input name="displayPicture" value="select personal photo..." type="file">	
													<p class="file-instructions">200px min width. Accepts jpg, png or gif only.</p>
												</li>
											</ul>
										</li>
															
										<li id="fee-structure" class="input-section">
											<h3>Fee Structure <span class="red">*</span></h3>
											<p>Please specify your fee structure below.  Note users who 
have a set rate (even if it is subject to change) typically receive more
 inquiries.</p>
											<ul class="input-wrap">							
												<li class="user-input select">													
													<g:select name="feeStructure" from="${com.ays.FeeStructure?.values()}" 
														keys="${com.ays.FeeStructure.values()*.name()}" required=""
														value="${profileInstance?.feeStructure?.name()}" noSelection="['': 'Select...']"/>
												</li>
												<li class="user-input short-text">
													<input class="short" placeholder="$" type="text" required="" name="askingFee"
														value="${profileInstance?.askingFee}"><span class="rate-type">/ hour</span>								
												</li>												
												<li class="user-input checkbox-wrap">
													<span class="line-wrap"><input name="rateNegotiable" value="Y" 
														type="checkbox" <g:if test="${profileInstance?.rateNegotiable}">checked</g:if>><span>Rate negotiable</span></span><br>
												</li>
											</ul>
										</li>
										
										<li id="company-size" class="input-section">
											<h3>Company Size <span class="red">*</span></h3>
											<p>Select the number of in-house employees your company directly employs. If you are self-employed, select 1.</p>
											<ul class="input-wrap">
												<li class="user-input select inline">													
													<g:select name="companySize" from="${com.ays.CompanySize?.values()}" 
														keys="${com.ays.CompanySize.values()*.name()}" required=""
														value="${companyProfileInstance?.companySize?.name()}" noSelection="['': 'Select...']"/> 
												</li>
											</ul>
										</li>
										
										<li id="company-size" class="input-section last">
											<h3>In Business Since <span class="red">*</span></h3>
											<p>How long has your company been in operation?</p>
											<ul class="input-wrap">
												<li class="user-input select inline">													
													<%--<g:select name="companyAge" from="${com.ays.CompanyAge?.values()}" 
														keys="${com.ays.CompanyAge.values()*.name()}" required=""
														value="${companyProfileInstance?.companyAge?.name()}" noSelection="['': 'Select...']"/>--%>
													<input type="number" name="companyAge" maxlength="4" title="year" pattern="[0-9]+" 
														value="${companyProfileInstance?.companyAge}"> 
												</li>
											</ul>
										</li>
										
									</ul><!-- end .outer-form-ul -->
								<g:submitButton class="continue-btn" name="next" value="Continue" />
							</g:form>
						</div>
					</div><!-- end .wrap -->
				</div><!-- end #content -->
		
			</div><!-- end #content-sidebar-inside-wrap -->
		
		</div><!-- end #inner-wrap -->		
	</div><!-- end #inner -->
	<%--
		<div id="create-profile" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${profileInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${profileInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="companyInfoAndRatesForm"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="next" value="Next" />
				</fieldset>
			</g:form>
		</div>
	 --%>
	</body>
</html>
