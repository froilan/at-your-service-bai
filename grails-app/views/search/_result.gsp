<%@ page import="com.aysb.Result" %>

<div id="list-employee" class="content scaffold-list" role="results">
	<g:each in="${results}" var="result">

		<div class="content scaffold-show entry-employee row-fluid" role="entry">
				<div class="span3 image-container">
					<g:if test="${result.employee?.id}">
		 				<img class="photo" src="${createLink(controller:'employee', action:'avatar_image', id:result?.employee?.id)}" />
					</g:if>	
				</div>
				<div class="span9 list-content">
					<g:if test="${result.employee?.name}">
						<h4>${result.employee?.name }</h4>
					</g:if>
					<g:if test="${result.employee?.skills}">
						<p>${result.employee?.skills }</p>
					</g:if>
					<p class="meta-salary">
					<g:if test="${result.employee?.lowRate || result.employee?.highRate}">
						<strong>${result.employee?.lowRate}</strong> per hour
					</g:if>
					</p>
					<p class="meta-rate">
					<g:if test="${result.employee?.averageRating}">
						Rating: <strong>${result.employee?.averageRating} / 10</strong>
					</g:if>
					</p>
					<g:link action="show" class="btn btn-info btn-small btn-details" controller="employee" id="${result.employee?.id}"> View Details </g:link>
				</div>
		</div>
	</g:each>

</div>

