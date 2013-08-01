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
						<div class="next-prev">
							<a href="#" class="not-clickable">prev</a>
							<a href="#">next</a>
						</div>
						<div class="match-count"><span class="current-count-start">1</span> - <span class="current-count-end">10</span> of <span class="total-count">24</span> matches</div>
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
<%--
<div class="container-fluid search-result">
	<div class="container">
    <g:set var="haveQuery" value="${params.q?.trim()}" />
    <g:set var="haveResults" value="${searchResult?.results}" />
    
    <div class="row-fluid">
		<div class="span4 refine-search-form">
			<h2>Refine Results</h2>
			<div role="search">
				<g:form action="index" >
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save btn btn-large btn-block btn-primary" value="${message(code: 'search.results.label', default: 'Search')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
		<div class="span8">
			<div class="title">
		      <span>
		        <g:if test="${haveQuery && haveResults}">
		          Showing <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
		          results for <strong>${params.q}</strong>
		        </g:if>
		        <g:else>
		        &nbsp;
		        </g:else>
		      </span>
		    </div>
			<div role="result" class="result-list">
			
			    <g:if test="${haveQuery && !haveResults && !parseException}">
			      <p>Nothing matched your query - <strong>${params.q}</strong></p>
			      <g:if test="${!searchResult?.suggestedQuery}">
			        <p>Suggestions:</p>
			        <ul>
			          <li>Try a suggested query: <g:link controller="searchable" action="index" params="[q: params.q, suggestQuery: true]">Search again with the <strong>suggestQuery</strong> option</g:link><br />
			            <em>Note: Suggestions are only available when classes are mapped with <strong>spellCheck</strong> options, either at the class or property level.<br />
					The simplest way to do this is add <strong>spellCheck "include"</strong> to the domain class searchable mapping closure.<br />
			                See the plugin/Compass documentation Mapping sections for details.</em>
			          </li>
			        </ul>
			      </g:if>
			    </g:if>
			
			    <g:if test="${searchResult?.suggestedQuery}">
			      <p>Did you mean <g:link controller="searchable" action="index" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
			    </g:if>
			
			    <g:if test="${parseException}">
			      <p>Your query - <strong>${params.q}</strong> - is not valid.</p>
			      <p>Suggestions:</p>
			      <ul>
			        <li>Fix the query: see <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples</li>
			        <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
			          <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.q)}</strong></em><br />
			              <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
			          </li>
			          <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.q)}</strong></em><br />
			              <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
			              <em>Or use the Searchable Plugin's <strong>escape</strong> option: <g:link controller="searchable" action="index" params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
			          </li>
			        </g:if>
			      </ul>
			    </g:if>
			
			    <g:if test="${haveResults}">
			    	<h3>Results:</h3>
					<div id="list-employee" class="content scaffold-list" role="results">
						<g:each in="${searchResult.results}" var="profile">
							<div class="content scaffold-show entry-employee row-fluid" role="entry">
								<div class="span3 image-container">
						 			<img class="photo" src="${createLink(controller:'profile', action:'avatar_image', id:profile.id)}" />
								</div>
								<div class="span9 list-content">
									<h4>${profile.businessName}</h4>
									<g:if test="${profile.companyProfile?.description}">
										<p>${profile.companyProfile?.description}</p>
									</g:if>
									<p class="meta-salary">
										<g:if test="${profile.askingFee}">
											<strong>${profile.askingFee}</strong> ${profile.feeStructure.displayValue}
										</g:if>
									</p>
									<p class="meta-rate">
										<g:if test="${profile.averageRating}">
											Rating: <strong>${profile.averageRating} / 5</strong>
										</g:if>
									</p>
									<g:link action="show" class="btn btn-info btn-small btn-details" controller="profile" id="${profile.id}"> View Details </g:link>
								</div>
							</div>
						</g:each>
					</div>
    			</g:if>
    
    		</div><!-- result-list -->
    	</div><!-- span8 -->
  	</div><!-- row-fluid -->
	</div><!-- container -->
</div><!-- container-fluid -->
 --%>
</body>
</html>
