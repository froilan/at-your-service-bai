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
					<p><span class="steps">Step <span class="current-step">3</span> of <span class="total-steps">5</span></span> <span class="time-to-complete">| Est. 1-2 minutes</span></p>
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
								<li class="active-menu-item"><a class="active" href="http://184.173.193.62/%7Eays/app/step-3-location-and-directions.html">Location &amp; Directions</a></li>
								<li class="not-clickable"><a href="http://184.173.193.62/%7Eays/app/step-4-professional-and-licensing.html">Professional &amp; Licensing</a></li>
								<li class="not-clickable"><a href="http://184.173.193.62/%7Eays/app/step-5-contact-information.html">Contact Information</a></li>
								<li class=""><a href="http://184.173.193.62/%7Eays/app/content-manager-template.html">Template</a></li>
							</ul>
						</ul>
					</div><!-- end .wrap -->
				</div><!-- end #primary-sidebar -->
			
					<div id="content">
						<div class="wrap">	
							<h2 class="category-heading">Location &amp; Directions</h2>
							<a href="#" class="hide tips-link">show tips</a>
							<ul class="tips hidden">
								<li>The red asterisk <span class="red">*</span> denotes required fields.</li>
								<li>The blue <span class="blue-star">star</span> denotes <span class="prem-brand">premium content</span>
 and will only be shown to premium users.  You can promote your business
 by making this premium content public to all users by signing up for a 
premium business account at the end of this form.</li>
								<li><span class="tip-badge">Hot Tip</span> The more quality information you enter, the more trusted your profile will be and the more business you will attract.</li>
							</ul>
							<div class="step-3 edit form-wrap">
								<g:form enctype="multipart/form-data">
									<ul class="outer-form-ul">
										
										<li id="business-address" class="input-section">
											<h3>Business Address <span class="red">*</span></h3>
											<p>Input your primary place of business</p>
											<ul class="input-wrap">
												<li class="user-input phil-address">
													<div class="inline-wrap line-1 blue-star">
														<!-- input class="inline street-adress" value="Streen Address" type="text">
														<input class="inline suite-number short" value="Suite #" type="text"-->
														<g:textField class="full-width" name="address" placeholder="Street/Building Address"
															value="${companyProfileInstance?.address?.streetBuildingAddress}"/>
													</div>
													<div class="inline-wrap line-2 blue-star">
														<!-- input class="inline building half" value="Building" type="text">
														<input class="inline barangay half" value="Barangay" type="text"-->
														<g:textField class="inline barangay half" name="barangay" placeholder="Barangay"
															value="${companyProfileInstance?.address?.barangay}" required="" />
														<g:textField class="inline city half" name="cityTown" placeholder="City/Town"
															value="${companyProfileInstance?.address?.cityTown}" required="" />
													</div>	
													<div class="inline-wrap line-3 blue-star">
														<!-- input class="inline city half" value="City" type="text">
														<input class="inline zip-code short" value="Zip Code" type="text"-->
														<g:textField class="inline zip-code half" name="barangay" placeholder="Zip Code"
															value="${companyProfileInstance?.address?.zipCode}" required="" />
													</div>										
													<p class="lower-address-comment"><span class="red">* </span>Barangay, City and Zip Code are required.</p>
												</li>
											</ul>	
												
										</li><li id="direction-to-address" class="input-section">
											<h3>Direction To Address</h3>
											<p>Describe how to get to your location of business.</p>
											<ul class="input-wrap">						
												<li class="textarea">																	
													<g:textArea name="directionsToAddress" placeholder="Directions..."
														value="${companyProfileInstance?.directionsToAddress}"/>
													<p class="bottom-description">500 character limit.</p>
												</li>
											</ul>
										</li>
										
										<li id="place-of-business-photos" class="input-section last">
											<h3>Place of Business Photos</h3>
											<p>Upload several photos of your office building. We 
recommend uploading one of the exterior and one or two of the interior 
of your office.</p>
											<ul class="input-wrap file-upload">
												<li class="user-input">
													<input name="user_upload" value="select logo..." type="file">	
													<p class="file-instructions">600px min width. Accepts jpg, png or gif only.</p>
													<div class="add-btn-wrap">
														<input value="Add Another Photo" type="button">
														<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> photos</span>
													</div>
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
					<g:render template="locationsAndDirectionsForm"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="next" value="Next" />
				</fieldset>
			</g:form>
		</div>
	--%>
	</body>
</html>
