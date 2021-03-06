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
					<p><span class="steps">Step <span class="current-step">4</span> of <span class="total-steps">5</span></span> <span class="time-to-complete">| Est. 3-4 minutes</span></p>
				</div>
			</div><!-- #inner-title -->
			
			<div id="content-sidebar-inside-wrap" class="initalize-process">
		
				<div id="primary-sidebar">
					<div class="wrap">
						<ul class="primary-sidebar-menu">
							<li class="page active parent"><a href="#">Public Profile<span class="dropdown-arrow"></span></a></li>
							<ul class="page-sub-menu">
								<li class="completed"><a href="http://184.173.193.62/%7Eays/app/step-1-categories-and-offerings.html">Categories &amp; Offerings</a></li>
								<li class="completed"><a href="http://184.173.193.62/%7Eays/app/step-2-company-info.html">General Company Info</a></li>
								<li class="completed"><a href="http://184.173.193.62/%7Eays/app/step-3-location-and-directions.html">Location &amp; Directions</a></li>
								<li class="active-menu-item"><a class="active" href="http://184.173.193.62/%7Eays/app/step-4-professional-and-licensing.html">Professional &amp; Licensing</a></li>
								<li class="not-clickable"><a href="http://184.173.193.62/%7Eays/app/step-5-contact-information.html">Contact Information</a></li>
								<li class=""><a href="http://184.173.193.62/%7Eays/app/content-manager-template.html">Template</a></li>
							</ul>
						</ul>
					</div><!-- end .wrap -->
				</div><!-- end #primary-sidebar -->
			
					<div id="content">
						<div class="wrap">			
							<h2 class="category-heading">Profesional &amp; Licensing</h2>
							<a href="#" class="hide tips-link">show tips</a>
							<ul class="tips hidden">
								<li>The red asterisk <span class="red">*</span> denotes required fields.</li>
								<li>The blue <span class="blue-star">star</span> denotes <span class="prem-brand">premium content</span>
 and will only be shown to premium users.  You can promote your business
 by making this premium content public to all users by signing up for a 
premium business account at the end of this form.</li>
								<li><span class="tip-badge">Hot Tip</span> The more quality information you enter, the more trusted your profile will be and the more business you will attract.</li>
							</ul>
							<ul class="errors">
								<li>${errorMessage}</li>
							</ul>
							<div class="step-4 edit form-wrap">
								<g:form enctype="multipart/form-data">
									<ul class="outer-form-ul">																			
										
										<li id="differentiation" class="input-section">
											<h3>Differentiation <span class="red">*</span></h3>
											<p>Add one or more reasons how you stand out from your competitors and provide a short description of each:</p>
											<g:render template="differentiations" model="['differentiations':profileInstance.differentiations]" />
										</li>
										
										<li id="license-details" class="input-section">
											<h3>License Details</h3>
											<p>Input any relevant licensing credentials you or your company currently hold.</p>						
											<ul class="input-wrap">	
												<li class="user-input half-text">
													<!-- input class="single-line" value="Trade license number" type="text">
													<input class="single-line" value="Trace license area" type="text">
													<input class="single-line" value="Trace license authority" type="text">
													<input class="single-line" value="Trade license expiration" type="text">
													<input class="single-line" value="Trade industry website" type="text">
													<textarea class="short-textarea">Trade license description...</textarea-->
													Number: <g:textField class="inline half" name="licenseNumber" 
														value="${licenseInstance?.licenseNumber}" placeholder="License Number" /><br>
													Area: <g:textField class="inline half" name="licenseArea" 
														value="${licenseInstance?.licenseArea}" placeholder="License Area" /><br>
													Authority: <g:textField class="inline half" name="licenseAuthority" 
														value="${licenseInstance?.licenseAuthority}" placeholder="License Authority" /><br>
													<%--<g:datePicker class="single-line" name="licenseExpirationDate" precision="day"  
														value="${licenseInstance?.licenseExpirationDate}" placeholder="License Expiration Date" />--%>
													Expiration Date: <calendar:datePicker class="inline half" name="licenseExpirationDate" 
														value="${licenseInstance?.licenseExpirationDate}" /><br>
													Description: <g:textField class="inline half" name="licenseDescription" 
														value="${licenseInstance?.licenseDescription}" placeholder="License Description" />
												</li>
											</ul>
										</li>
										
										<li id="trade-org-and-memberships" class="input-section">
											<h3>Trade Organization &amp; Memberships</h3>
											<p>List any trade organizations or other relevant groups you or your company are an active member of.</p>
											<g:render template="affiliations" model="['affiliations':profileInstance.affiliations]" />
											<%--						
											<ul class="input-wrap">	
												<li class="user-input half-text">
													<!-- input class="inline half" value="Organization name" type="text">
													<input class="inline half" value="Role / Postion" type="text"-->
													<g:textField name="affiliationName" placeholder="Organization Name"
														value="${affiliationInstance?.affiliationName}"/>
													<g:textField name="affiliationRole" placeholder="Role / Postion"
														value="${affiliationInstance?.affiliationRole}"/>								
													<div class="add-btn-wrap">
														<input value="Add Another Organization" type="button">
														<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
													</div>
												</li>
											</ul>
											 --%>
										</li>
										
										<li id="awards-and-recognition" class="input-section last">
											<h3>Awards &amp; Recognition</h3>
											<p>List any awards you have received in your industry within recent years.</p>
											<g:render template="awards" model="['awards':profileInstance.awards]" />
											<%--				
											<ul class="input-wrap">	
												<li class="user-input half-text">
													<div class="inline-wrap">
														<!-- input class="inline award-name" value="Award Name" type="text">
														<input class="inline year short" value="Year" type="text"-->
														<g:textField name="awardName" placeholder="Award Name" 
															value="${awardInstance?.awardName}"/>
														<g:textField name="awardYear" placeholder="Award Year" 
															value="${awardInstance?.awardYear}"/>									
													</div>											
													<!-- textarea class="short-textarea">Trade license description...</textarea-->
													<g:textArea class="short-textarea" name="awardDescription" 
														value="${awardInstance?.awardDescription}" placeholder="Award Description" />
													<div class="add-btn-wrap">
														<input value="Add Another Award" type="button">
														<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
													</div>
												</li>
											</ul>
											--%>
										</li>
										
									</ul><!-- end .outer-form-ul -->
								<g:submitButton class="continue-btn" name="next" value="Continue" />
							</g:form>
							<g:render template='differentiation' model="['differentiation':null,'i':'_clone','hidden':true]"/>
							<g:render template='affiliation' model="['affiliation':null,'i':'_clone','hidden':true]"/>
							<g:render template='award' model="['award':null,'i':'_clone','hidden':true]"/>
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
					<g:render template="professionalAndLicensingForm"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="next" value="Next" />
				</fieldset>
			</g:form>
		</div>
	--%>
	</body>
</html>
