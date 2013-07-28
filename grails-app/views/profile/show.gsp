<!doctype html>
<html>
<head>
	<meta name="layout" content="main">
</head>
<body>
	<div id="inner">
		<div id="inner-wrap">
			
			<div id="inner-title">
				<div class="title-right">
					<div class="breadcrumb">
						<span class="inline-wrap"><a href="http://184.173.193.62/~ays/app/public-profile.html#"><span class="category">Financial Services</span></a> &gt; <a href="http://184.173.193.62/~ays/app/public-profile.html#"><span class="sub-category">Accountants</span></a> &gt; <span class="member-name">Anna Cruze</span></span>
					</div>
					<div class="title-right-meta">
						<div class="next-prev">
							<a href="http://184.173.193.62/~ays/app/public-profile.html#">prev</a>
							<a href="http://184.173.193.62/~ays/app/public-profile.html#">next</a>
						</div>
						<div class="match-count"><span class="current-count">2</span> of <span class="total-count">24</span> matches</div>
					</div>
				</div>
			</div> <!-- end of inner-title -->
			
			<div id="front-app-content-sidebar-wrap">
		
				<div id="public-profile-sidebar">
					<div class="wrap">
						<ul class="profile-badges">
							<li class="premium-badge"><a href="http://184.173.193.62/~ays/app/public-profile.html#"><span class="icon"></span>Premium Member</a></li>
							<li class="verified-badge"><a href="http://184.173.193.62/~ays/app/public-profile.html#"><span class="icon"></span>Verified Business</a></li>
							<li class="top-rated-badge"><a href="http://184.173.193.62/~ays/app/public-profile.html#"><span class="icon"></span>Top Rated Service</a></li>
							<li class="featured-badge"><a href="http://184.173.193.62/~ays/app/public-profile.html#"><span class="icon"></span>Featured Account</a></li>
						</ul>
						
						<div class="member-info">
							<div class="member-info-wrap">
								<img src="./AtYourService - Your Reliable Services Network - Profile Setup Step 1_files/anna-cruze-profile-pic.jpg">
								<div class="name-wrap">	
									<h2 class="sb-member-name">${profileInstance.firstName} ${profileInstance.lastName}</h2>
									<!-- <span class="member-title">Accountant / CPA</span><br>
									<span class="company-position">Partner at Total Business Accounting</span> -->
								</div>
								
								<div class="contact-info-wrap">
									<div class="phone-numbers">
										<span class="icon"></span>
										<div class="wrap">
											<ul class="phone-list">
												<g:each var="phoneNumber" in="${profileInstance.phoneNumbers}">
													<li>${phoneNumber.contactValue} <span class="phone-label">${phoneNumber.contactAlias}</span></li>
												</g:each>
											</ul>
										</div>
									</div>
									
									<div class="email prem-content">
										<span class="icon"></span>
										<div class="wrap">
											<ul class="email-list">
												<g:each var="email" in="${profileInstance.emailAddresses}">
													<li>${email.contactValue} <span class="phone-label">${email.contactAlias}</span></li>
												</g:each>
											</ul>
										</div>
									</div>
									
									<div class="website prem-content">
										<span class="icon"></span>
										<div class="wrap">
											<ul class="website-list">
												<g:each var="website" in="${profileInstance.websites}">
													<li>${website.contactValue}</li>
												</g:each>
											</ul>
										</div>
									</div>
									
									<div class="email prem-content">
										<span class="icon"></span>
										<div class="wrap">${profileInstance.facebookContactInfo?.contactValue}</div>
									</div>
									
									<div class="email prem-content">
										<span class="icon"></span>
										<div class="wrap">${profileInstance.twitterContactInfo?.contactValue}</div>
									</div>
									
									<div class="email prem-content">
										<span class="icon"></span>
										<div class="wrap">${profileInstance.linkedInContactInfo?.contactValue}</div>
									</div>
									
									<div class="phone-numbers">
										<span class="icon"></span>
										<div class="wrap">
											<ul class="other-list">
												<g:each var="other" in="${profileInstance.otherContacts}">
													<li>${other.contactValue} <span class="phone-label">${other.contactAlias}</span></li>
												</g:each>
											</ul>
										</div>
									</div>
								</div><!-- end .contact-info-wrap -->
								
								<div class="meta-data-wrap">
									<ul class="meta-data-list">
										<li class="rate"><span class="icon"></span><span class="rate-wrap">P<span class="rate">${profileInstance.askingFee}</span> per <span class="rate-interval">${profileInstance.feeStructure.unit}</span></span></li>
										<!-- <li class="rating"><span class="grey-stars"></span><span class="yellow-stars"></span><span class="rating-wrap"><span class="rating rate-45">4.5 </span>Stars</span></li> -->
									</ul>									
								</div><!-- end .meta-data-wrap" -->
								
							</div><!-- end .member-info-wrap" -->
						</div><!-- end .member-info -->
						
					</div><!-- end .wrap -->
				</div><!-- end #public-profile-sidebar -->

				<div id="content">
					<div class="wrap">
						<div class="service-overview">
							<div class="meta-col">
								<div class="img-wrap">
									<img src="./AtYourService - Your Reliable Services Network - Profile Setup Step 1_files/total-business-accounting-demo-logo.jpg" class="biz-logo">
								</div>
								<%--<div class="biz-meta-box">Operating Since: <span class="op-since">${profileInstance.companyProfile}</span></div>
								<div class="biz-meta-box">Size: <span class="employee-count">13</span> associates</div>--%>
							</div>
							
							<div class="details-col">
								<h1>${profileInstance.businessName}</h1>
								<p>${profileInstance.companyProfile.description}</p>
							</div>
						</div><!-- end .service-overivew -->
						
						<div class="primary-services">
							<h2>Primary Services</h2>
							<ul class="collapsible-bars blue-bars primary-content prem-content">
								<g:each var="service" in="${profileInstance.primaryServices}" status="idx">
									<li class="open unlocked">
										<a class="title-wrap" href="http://184.173.193.62/~ays/app/public-profile.html#">
											<h4><span class="count">${idx+1}</span> ${service.serviceName} </h4>
											<!-- <span class="pc-white-link"><span class="star-icon"></span>Premium Content</span> -->
										</a>
										<div class="content-wrap">
											<p>${service.serviceDescription}</p>
										</div>
									</li>
								</g:each>
							</ul>
						</div><!-- end .primary-services" -->
						
						<div class="secondary-services">
							<h2>Secondary Services</h2>
							<ul class="collapsible-bars blue-bars primary-content prem-content">
								<g:each var="service" in="${profileInstance.secondaryServices}" status="idx">
									<li class="open unlocked">
										<a class="title-wrap" href="http://184.173.193.62/~ays/app/public-profile.html#">
											<h4><span class="count">${idx+1}</span> ${service.serviceName} </h4>
											<!-- <span class="pc-white-link"><span class="star-icon"></span>Premium Content</span> -->
										</a>
										<div class="content-wrap">
											<p>${service.serviceDescription}</p>
										</div>
									</li>
								</g:each>
							</ul>
						</div><!-- end .secondary-services" -->
						
						<div class="differentiation">
							<h2>Differentiation</h2>
							<ul class="collapsible-bars blue-bars primary-content prem-content">
								<g:each var="diff" in="${profileInstance.differentiations}" status="idx">
									<li class="open unlocked">
										<a class="title-wrap" href="http://184.173.193.62/~ays/app/public-profile.html#">
											<h4><span class="count">${idx+1}</span> ${diff.differentiationKeywords} </h4>
											<!-- <span class="pc-white-link"><span class="star-icon"></span>Premium Content</span> -->
										</a>
										<div class="content-wrap">
											<p>${diff.differentiationDescription}</p>
										</div>
									</li>
								</g:each>
							</ul>
						</div><!-- end .differentiation" -->
						
						<div class="address">
							<h2>Address</h2>
							<div class="content-wrap">
								<p>${profileInstance.companyProfile.address.displayValue}</p>
							</div>
						</div><!-- end .primary-services" -->
						
						<%--
						<ul class="secondary-services-list">
							
							<li class="differentiation collapsible secondary-content prem-content open locked">
								<div class="title-wrap">							
									<a class="toggle" ref="#"><h3>Differentiation <span class="minus">-</span></h3></a>
									<span class="pc-blue-link"><span class="star-icon"></span>Premium Content</span>
								</div>
								<div class="secondary-content-wrap view-pc-message">
									<h4>To view <span class="lg-pc-blue-link"><span class="lg-star-icon"></span>Premium Content</span> you must:</h4>
									<div class="blue-btn-wrap">	
										<div class="blue-button"><a href="http://184.173.193.62/~ays/app/public-profile.html#">Be A Premium Member</a></div>
										<div class="blue-button"><a href="http://184.173.193.62/~ays/app/public-profile.html#">Pay With A Facebook Post</a></div>
									</div>
									<a href="http://184.173.193.62/~ays/app/public-profile.html#">
										<div class="orange-button">
											<h5>Invite <span class="service-member-name">Anna</span> to be a premium member</h5>
											<p>If <span class="service-memeber-name">Anna</span> joins then all users can see her full profile for free and you will get 30 free days as a premium member!</p>
										</div>
									</a>
								</div>								
							</li><!-- end. differentiation -->
							
							<li class="collapsible secondary-content prem-content closed locked">
								<div class="title-wrap">							
									<a class="toggle" ref="#"><h3>Another Category Title Here <span class="plus">+</span></h3></a>
									<span class="pc-blue-link"><span class="star-icon"></span>Premium Content</span>
								</div>
							</li>	
								
							<li class="collapsible secondary-content prem-content closed locked">
								<div class="title-wrap">							
									<a class="toggle" ref="#"><h3>Another Category Title Here <span class="plus">+</span></h3></a>
									<span class="pc-blue-link"><span class="star-icon"></span>Premium Content</span>
								</div>
							</li>	
						</ul><!-- end .secondary-services-list -->
						--%>
						
					</div><!-- end .wrap -->
				</div><!-- end #content -->
		
			</div><!-- end #content-sidebar-inside-wrap -->
		
		</div><!-- end #inner-wrap -->		
	</div><!-- end #inner -->
</body>
</html>
