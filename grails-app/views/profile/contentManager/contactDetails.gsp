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
					<p><span class="steps">Step <span class="current-step">5</span> of <span class="total-steps">5</span></span> <span class="time-to-complete">| Est. 3-4 minutes</span></p>
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
								<li class="completed"><a href="http://184.173.193.62/%7Eays/app/step-4-professional-and-licensing.html">Professional &amp; Licensing</a></li>
								<li class="active-menu-item"><a class="active" href="http://184.173.193.62/%7Eays/app/step-5-contact-information.html">Contact Information</a></li>
								<li class=""><a href="http://184.173.193.62/%7Eays/app/content-manager-template.html">Template</a></li>
							</ul>
						</ul>
					</div><!-- end .wrap -->
				</div><!-- end #primary-sidebar -->
			
					<div id="content">
						<div class="wrap">							
							<h2 class="category-heading">Contact Information</h2>
							<a href="#" class="hide tips-link">show tips</a>
							<ul class="tips hidden">
								<li>The red asterisk <span class="red">*</span> denotes required fields.</li>
								<li>The blue <span class="blue-star">star</span> denotes <span class="prem-brand">premium content</span>
 and will only be shown to premium users.  You can promote your business
 by making this premium content public to all users by signing up for a 
premium business account at the end of this form.</li>
								<li><span class="tip-badge">Hot Tip</span> The more quality information you enter, the more trusted your profile will be and the more business you will attract.</li>
							</ul>
							<div class="step-5 edit form-wrap">
								<g:form enctype="multipart/form-data">
									<ul class="outer-form-ul">
										
										<li id="phone-numbers" class="input-section">
											<h3>Phone Numbers <span class="red">*</span></h3>
											<p>Add one or more contact numbers below.</p>
											<g:render template="phoneNumbers" model="['phoneNumbers':profileInstance.phoneNumbers]" />
											<%--
											<ul class="input-wrap">
												<li class="user-input">
													<!-- input class="single-line" value="Name (example: Customer Support)" type="text">
													<select>
														<option selected="selected" value="">Cell</option>
														<option value="">Landline</option>																														
													</select>
													<div class="inline phone-number">																																					
														<input class="inline country-code" value="+63" maxlength="3" type="text">
														<input class="inline area-code" value="0916" maxlength="4" type="text">
														<input class="inline prefix" value="123" maxlength="4" type="text">
														<input class="inline suffix" value="4567" maxlength="4" type="text">
														<input class="inline phone-ext" value="ext" maxlength="4" type="text">																												
													</div> -->
													<g:textField class="inline half" name="contactInfo.phoneNumber.contactAlias" 
														value="${phoneNumberInstance?.contactAlias}" placeholder="Name (example: Customer Support)" />
													<g:textField class="inline half" name="contactInfo.phoneNumber" 
														value="${phoneNumberInstance?.contactValue}" placeholder="+639991234567" />							
													<div class="add-btn-wrap">
														<input value="Add Another Phone" type="button">
														<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
													</div>												
												</li>																				
											</ul>
											--%> 
										</li>
										
										
										<li id="email-addresses" class="input-section">
											<h3>Email</h3>
											<p>Input your primary business email address which people can email you at.</p>	
											<g:render template="emailAddresses" model="['emailAddresses':profileInstance.emailAddresses]" />		
											<%--			
											<ul class="input-wrap">	
												<li class="user-input">
													<!-- input class="inline half" value="Name (example: Sales)" type="text">
													<input class="inline half" value="email@domain.com" type="text"-->
													<g:textField class="inline half" name="contactInfo.email.contactAlias" 
														value="${emailInstance?.contactAlias}" placeholder="Name (example: Sales)" />
													<g:textField class="inline half" name="contactInfo.email" 
														value="${emailInstance?.contactValue}" placeholder="email@domain.com" />				
													<div class="add-btn-wrap">
														<input value="Add Another Email" type="button">
														<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
													</div>
												</li>
											</ul>
											--%>
										</li>
										
										<li id="website" class="input-section">
											<h3>Website</h3>
											<p>Input your current website URL if you have an existing website you would like to share to potential clients.</p>
											<g:render template="websites" model="['websites':profileInstance.websites]" />		
											<%--				
											<ul class="input-wrap">	
												<li class="user-input">
													<!-- input class="full-width" value="http://" type="text"-->
													<g:textField class="full-width" name="contactInfo.website" 
														value="${websiteInstance?.contactValue}" placeholder="http://" />																						
													<div class="add-btn-wrap">
														<input value="Add Another Website" type="button">
														<span class="count"><span class="current-count">1</span> of <span class="total-count">3</span> added</span>
													</div>
												</li>
											</ul>
											 --%>
										</li>
										
										<li id="social-networks" class="input-section last">
											<h3>Social Networks</h3>
											<p>Input the links to each of your business social networks you would like to share.</p>						
											<ul class="input-wrap">	
												<li class="user-input">
													<div class="inline-wrap facebook-wrap">
														<span class="icon"></span>
														<g:textField class="custom-width" name="contactInfo.facebook" 
															value="${facebookInstance?.contactValue}" placeholder="http://" />
													</div>
													<div class="inline-wrap twitter-wrap">
														<span class="icon"></span>
														<g:textField class="custom-width" name="contactInfo.twitter" 
															value="${twitterInstance?.contactValue}" placeholder="http://" />
													</div>	
													<div class="inline-wrap linkedin-wrap">
														<span class="icon"></span>
														<g:textField class="custom-width" name="contactInfo.linkedIn" 
															value="${linkedInInstance?.contactValue}" placeholder="http://" />
													</div>																						
													<div class="add-btn-wrap">
														<input value="Add Another Network" type="button">
														<span class="count"><span class="current-count">3</span> of <span class="total-count">5</span> added</span>
													</div>
												</li>
											</ul>
										</li>
																																																		
									</ul><!-- end .outer-form-ul -->
								<!--  input class="create-profile-btn" value="Create My FREE Profile" type="submit"-->
								<g:submitButton class="create-profile-btn" name="next" value="Create My FREE Profile" />
							</g:form>
							<g:render template='phoneNumber' model="['phoneNumber':null,'i':'_clone','hidden':true]"/>
							<g:render template='emailAddress' model="['emailAddress':null,'i':'_clone','hidden':true]"/>
							<g:render template='website' model="['website':null,'i':'_clone','hidden':true]"/>
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
					<g:render template="contactDetailsForm"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="next" value="Next" />
				</fieldset>
			</g:form>
		</div>
	--%>
	</body>
</html>
