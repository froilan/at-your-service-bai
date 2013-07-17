<g:javascript>
	var websiteChildCount = ${websites?.size()} + 0;
	
    function addWebsite() {
		var clone = $("#website_clone").clone()
		var divId = 'website'+websiteChildCount;
		var htmlId = 'websites['+websiteChildCount+'].';
		var valueInput = clone.find("input[id$=contactValue]");

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
		valueInput.attr('id',htmlId + 'contactValue')
		        .attr('name',htmlId + 'contactValue');
		
		clone.attr('id', 'website'+websiteChildCount);
		$("#websiteChildList").append(clone);
		clone.show();
		valueInput.focus();
		websiteChildCount++;
    }
    
    <g:if test="${!websites}">
    	addWebsite();
    </g:if>
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="websiteChildList">
		    <g:each var="website" in="${websites}" status="i">
		        <g:render template='website' model="['website':website,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input type="button" value="Add Another Site" onclick="addWebsite();" />
			<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
