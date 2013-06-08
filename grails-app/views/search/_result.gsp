<%@ page import="com.aysb.Result" %>

<div id="list-employee" class="content scaffold-list" role="results">

	<g:each in="${results}" var="result">

		<div id="entry-employee" class="content scaffold-show" role="entry">

				<ul class="property-list employee">
					<g:if test="${result.employee?.id}">
						<li class="fieldcontain">
			 				<img class="photo" src="${createLink(controller:'employee', action:'avatar_image', id:result?.employee?.id)}" />
						</li>
					</g:if>	
						
					<g:if test="${result.siteUser?.username}">
						<li class="fieldcontain">
							${result.siteUser?.username}
						</li>
					</g:if>
					
					<g:if test="${result.employee?.name}">
						<li class="fieldcontain">
							${result.employee?.name }
						</li>
					</g:if>
				
					<g:if test="${result.employee?.rating}">
						<li class="fieldcontain">
							Rate ${result.employee?.rating}
						</li>
					</g:if>	
					
					<g:if test="${result.employee?.lowRate || result.employee?.highRate}">
						<li class="fieldcontain">
							Ratings ${result.employee?.lowRate} - ${result.employee?.highRate}
						</li>
					</g:if>
					
					<g:if test="${result.employee?.negotiableRate}">
						<li class="fieldcontain">Negotiable</li>
					</g:if>
					
					<li class="fieldcontain">
						<g:link action="show" controller="employee" id="${result.employee?.id}"> Info </g:link>
					</li>
				</ul>
			 
		</div>

	</g:each>

</div>

