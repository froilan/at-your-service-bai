<g:javascript>
	var emailChildCount = ${emails?.size()} + 0;
	
    function addEmailAddress() {
		var clone = $("#emailAddress_clone").clone()
		var divId = 'emailAddress'+emailChildCount;
		var htmlId = 'emailAddresses['+emailChildCount+'].';
		var nameInput = clone.find("input[id$=contactAlias]");

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
		nameInput.attr('id',htmlId + 'contactAlias')
		        .attr('name',htmlId + 'contactAlias');
		clone.find("input[id$=contactValue]")
		        .attr('id',htmlId + 'contactValue')
		        .attr('name',htmlId + 'contactValue');
		
		clone.attr('id', 'emailAddress'+emailChildCount);
		$("#emailAddressChildList").append(clone);
		clone.show();
		nameInput.focus();
		emailChildCount++;
    }
    
    <g:if test="${!emails}">
    	addEmailAddress();
    </g:if>
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="emailAddressChildList">
		    <g:each var="emailAddress" in="${emailAddresses}" status="i">
		        <g:render template='emailAddress' model="['emailAddress':emailAddress,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input type="button" value="Add Another Email" onclick="addEmailAddress();" />
			<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
