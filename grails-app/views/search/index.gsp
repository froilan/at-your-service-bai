<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>At Your Service</title>
    <meta name="layout" content="main" />
</head>
<body>
	<g:set var="haveQuery" value="${params.q?.trim()}" />
    <g:set var="haveResults" value="${searchResult?.results}" />
    
	<div id="inner">
		<div id="inner-wrap">
			
			<div id="inner-title">
				<div class="title-left">
					<p class="results-page-title">Refine Results</p>
				</div>
				<div class="title-right">
					<div class="breadcrumb">
						<span class="inline-wrap"><a href="#"><span class="category">Financial Services</span></a> &gt; <a href="#"><span class="sub-category">Accountants</span></a> &gt; <span class="member-name">Anna Cruze</span></span>
					</div>
					<div class="title-right-meta">
						<%--<div class="next-prev">
							<a href="#" class="not-clickable">prev</a>
							<a href="#">next</a>
						</div>
						--%><g:if test="${haveResults}">
							<%--<div class="match-count"><span class="current-count-start">1</span> - <span class="current-count-end">${searchResult.results.size()}</span> of <span class="total-count">${searchResult.total}</span> matches</div>
							--%>
						    
					    	<div class="next-prev">
						        <g:paginate controller="search" action="index" params="[q: params.q]" 
						                    total="${searchResult.total}" prev="&lt; previous" next="next &gt;"/>
						        <div class="match-count"><span class="current-count-start">${searchResult.offset+1}</span> - <span class="current-count-end">${searchResult.offset+searchResult.max}</span> of <span class="total-count">${searchResult.total}</span> matches</div>            
					         </div>           
						    
						</g:if>
					</div>
				</div>
			</div> 
			
			<div id="front-app-content-sidebar-wrap">
				<g:form action="index" >
				<div id="primary-sidebar">
					<div class="wrap">
						<ul class="primary-sidebar-menu">
							<li class="user-input select">
								<label>Keyword</label>
								<input type="search" name="q" value="${params.q}" size="50" 
									placeholder="Keyword (e.g., accountant, electrician)" required/> 
							</li>
							<li class="user-input select">
								<label>Location</label>
								<input type="search" name="location" value="${params.location}" size="20" 
									placeholder="Location (optional)" /> 
							</li>
							<li><g:submitButton name="search" class="filter-submit" value="Update Results" /></li>
						</ul>	
					</div><!-- end .wrap -->
				</div><!-- end #primary-sidebar -->
				</g:form>
		
				<g:if test="${haveResults}">
				<div id="content">
					<div class="wrap">
						<g:each in="${searchResult.results}" var="profile" status="i">
						<div id="result-${i}" class="result-wrap">
							<div class="result-logo">
								<g:if test="${profile.companyProfile.logo}">
									<!-- TODO: display logo -->
									<img src="${resource(dir: 'images', file: 'default-logo.jpg')}">
								</g:if>
								<g:elseif test="${profile.displayPicture}">
									<!-- TODO: display avatar -->
									<img src="${resource(dir: 'images', file: 'default-logo.jpg')}">
								</g:elseif>
								<g:else>
									<img src="${resource(dir: 'images', file: 'default-logo.jpg')}">
								</g:else>
							</div>
							<div class="results-profile-info-wrap">
								<g:link controller="profile" action="show" id="${profile.id}">
									<h3 class="result-profile-title">${profile.businessName}</h3>
								</g:link>
								<p class="short-descript">${profile.companyProfile.description}</p>
								<ul class="result-profile-meta meta-data-list">										
									<li class="rate">
										<span class="icon"></span>
										<span class="rate-wrap">P<span class="rate">${profile.askingFee}</span> per <span class="rate-interval">${profile.feeStructure.unit}</span></span>
									</li>
									<%--<li class="rating"><span class="grey-stars"></span><span class="yellow-stars"></span><span class="rating-wrap"><span class="rating rate-45">4.5 </span>Stars</span></li> --%>
									<li class="view-details-btn"><g:link class="blue-btn" controller="profile" action="show" id="${profile.id}">View Details</g:link></li>
								</ul>	
							</div>								
						</div><!-- end .result-wrap -->
						</g:each>
					</div><!-- end .wrap -->
				</div><!-- end #content -->
				</g:if>
		
			</div><!-- end #front-app-content-sidebar-wrap -->
			<g:if test="${haveResults}">
			<div id="inner-pagination">
				<div class="pagination-left">
					<ul class="pagination-list">
						<li class="results-prev-page first-page"><a class="not-clickable" href="#">prev</a></li>
						<li class="current-page"><a href="#">1</a></li>
						<li class="current-plus-1"><a href="#">2</a></li>
						<li class="current-plus-2"><a href="#">3</a></li>
						<li><span class="ellipsis">...</span></li>
						<li class="last-page"><a href="#">10</a></li>
						<li class="results-next-page"><a href="#">next</a></li>																																			
					</ul>
				</div>
				<div class="pagination-right-meta">
					<p class="match-count">Showing <span class="current-count-range">1-10</span> of <span class="total-count">24</span> matches</p>
					
				</div>
			</div><!-- #inner-pagination -->
			</g:if>
			
		</div><!-- end #inner-wrap -->		
	</div><!-- end #inner -->
</body>
</html>
