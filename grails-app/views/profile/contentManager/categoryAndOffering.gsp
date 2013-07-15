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
					<p><span class="steps">Step <span class="current-step">1</span> of <span class="total-steps">5</span></span> <span class="time-to-complete">| Est. 2-4 minutes</span></p>
				</div>
			</div><!-- #inner-title -->
			
			<div id="content-sidebar-inside-wrap" class="initalize-process">
		
				<div id="primary-sidebar">
					<div class="wrap">
						<ul class="primary-sidebar-menu">
							<li class="page active parent"><a href="#">Public Profile<span class="dropdown-arrow"></span></a></li>
							<ul class="page-sub-menu">
								<li class="active-menu-item"><a class="active" href="http://184.173.193.62/%7Eays/app/step-1-categories-and-offerings.html">Categories &amp; Offerings</a></li>
								<li class="not-clickable"><a href="http://184.173.193.62/%7Eays/app/step-2-company-info.html">General Company Info</a></li>
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
							<div class="init-message">
								<h2>Welcome to your Content Manager <span class="first-name">John</span>!</h2>
								<p>This is where you manage your profile information. To get 
started with your FREE profile tell us a little bit more about your 
business below so we can share it with people looking for your services.</p>
							</div>
							<h2 class="category-heading">Categories &amp; Offerings</h2>
							<a href="#" class="hide tips-link">hide tips</a>
							<ul class="tips">
								<li>The red asterisk <span class="red">*</span> denotes required fields.</li>
								<li>The blue <span class="blue-star">star</span> denotes <span class="prem-brand">premium content</span>
 and will only be shown to premium users.  You can promote your business
 by making this premium content public to all users by signing up for a 
premium business account at the end of this form.</li>
								<li><span class="tip-badge">Hot Tip</span> The more quality information you enter, the more trusted your profile will be and the more business you will attract.</li>
							</ul>
							<div class="step-1 edit form-wrap">
								<g:form enctype="multipart/form-data">
									<ul class="outer-form-ul">
										<li id="business-name" class="input-section">
											<h3>Business Name</h3>
											<p>If left blank, your full name will be used</p>
											<ul class="input-wrap">
												<li class="user-input">
													<g:textField class="full-width" name="name" 
														value="${companyProfileInstance?.companyName}" />
												</li>
											</ul>
										</li>
										<li id="service-categories" class="input-section">
											<h3>General Service Category <span class="red">*</span></h3>
											<p>Select a category and sub-category which best describes your primary service offering:</p>
											<ul class="input-wrap">
												<li class="user-input">
													<label>Service Category <span class="red">*</span></label>
													<g:select id="category" name="category.id" 
														from="${com.ays.Category.list()}" optionKey="id" required="" 
														value="${profileInstance?.subCategory?.category?.id}" class="many-to-one" 
														noSelection="['': 'Select...']"/>
												</li>
												<li class="user-input">
													<label>Sub-Category <span class="red">*</span></label>
													<g:select id="subCategory" name="subCategory.id" 
														from="${com.ays.SubCategory.list()}" optionKey="id" required=""
														value="${profileInstance?.subCategory?.id}" class="many-to-one" 
														noSelection="['': 'Select...']"/>
												</li>
											</ul> 
										</li>
															
										<li id="company-description" class="input-section">
											<h3>Company Description <span class="red">*</span></h3>
											<p>Describe your company in 2-4 sentences.</p>
											<ul class="input-wrap">
												<li class="user-input">
													<g:textArea name="description" value="${companyProfileInstance?.description}"
														required="" />
													<p class="bottom-description">500 character limit.</p>
												</li>
											</ul>
										</li>
										
										<li id="primary-service-offerings" class="input-section">
											<h3>Primary Service Offerings <span class="red">*</span></h3>
											<p>Add one or more primary services (max 5) you offer to clients on occasion and provide a short description of each:</p>
											<g:render template="primaryServices" model="['primaryServices':profileInstance.primaryServices]" />
										</li>
										
										<li id="secondary-service-offerings" class="input-section last">
											<h3>Secondary Service Offerings <span class="red">*</span></h3>
											<p>Add one or more secondary services (max 5) you offer to clients regularly and provide a short description of each:</p>
											<g:render template="secondaryServices" model="['secondaryServices':profileInstance.secondaryServices]" />
										</li>
									</ul><!-- end .outer-form-ul -->
								<g:submitButton class="continue-btn" name="next" value="Continue" />
							</g:form>
							<g:render template='primaryService' model="['service':null,'i':'_clone','hidden':true]"/>
							<g:render template='secondaryService' model="['service':null,'i':'_clone','hidden':true]"/>
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
					<g:render template="categoryAndOfferingForm"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="next" value="Next" />
				</fieldset>
			</g:form>
		</div>
	 --%>
	</body>
</html>
