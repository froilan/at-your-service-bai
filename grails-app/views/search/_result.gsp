<%@ page import="com.aysb.Result" %>

<div id="list-employee" class="content scaffold-list" role="results">

	<g:each in="${results}" var="result">

		<div id="entry-employee" class="entries" role="entry">
			<span class="photo">
			 
			</span>
			${result.siteUser?.username}
			${result.employee }
			<div class="details">
				<ul>
					<li>Rate </li>
					<li>Ratings </li>
					<li>Info <%-- TODO :<g:link> </g:link> --%></li>
				</ul>
			</div> 
		</div>

	</g:each>

</div>

