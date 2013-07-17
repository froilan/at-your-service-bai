<g:javascript>
	var affiliationChildCount = ${affiliations?.size()} + 0;

    function addAffiliation() {
		var clone = $("#affiliation_clone").clone()
		var divId = 'affiliation'+affiliationChildCount;
		var htmlId = 'affiliations['+affiliationChildCount+'].';
		var nameInput = clone.find("input[id$=affiliationName]");

		clone.find("input[type=button]")
				.attr('onclick','deleteRow("' + divId + '")')
		clone.find("input[id$=id]")
				.attr('id',htmlId + 'id')
				.attr('name',htmlId + 'id');
		clone.find("input[id$=deleted]")
		        .attr('id',htmlId + 'deleted')
		        .attr('name',htmlId + 'deleted');
		clone.find("input[id$=new]")
		        .attr('id',htmlId + 'new')
		        .attr('name',htmlId + 'new')
		        .attr('value', 'true');
		nameInput.attr('id',htmlId + 'affiliationName')
		        .attr('name',htmlId + 'affiliationName');
		clone.find("input[id$=affiliationRole]")
		        .attr('id',htmlId + 'affiliationRole')
		        .attr('name',htmlId + 'affiliationRole');
		
		clone.attr('id', 'affiliation'+affiliationChildCount);
		$("#affiliationChildList").append(clone);
		clone.show();
		nameInput.focus();
		affiliationChildCount++;
    }

	<g:if test="${!affiliations}">
    	addAffiliation();
    </g:if>
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="affiliationChildList">
		    <g:each var="affiliation" in="${affiliations}" status="i">
		        <g:render template='affiliation' model="['affiliation':affiliation,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input type="button" value="Add Another Organization" onclick="addAffiliation();" />
			<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
