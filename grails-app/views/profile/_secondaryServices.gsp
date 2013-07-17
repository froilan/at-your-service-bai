<g:javascript>
	var secondaryServiceChildCount = ${secondaryServices?.size()} + 0;

    function addSecondaryService() {
		var clone = $("#secondaryService_clone").clone()
		var divId = 'secondaryService'+secondaryServiceChildCount;
		var htmlId = 'secondaryServices['+secondaryServiceChildCount+'].';
		var serviceNameInput = clone.find("input[id$=serviceName]");

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
		serviceNameInput.attr('id',htmlId + 'serviceName')
		        .attr('name',htmlId + 'serviceName');
		clone.find("textarea")
		        .attr('id',htmlId + 'serviceDescription')
		        .attr('name',htmlId + 'serviceDescription');
		
		clone.attr('id', 'secondaryService'+secondaryServiceChildCount);
		$("#secondaryServiceChildList").append(clone);
		clone.show();
		serviceNameInput.focus();
		secondaryServiceChildCount++;
    }
    
    <g:if test="${!secondaryServices}">
		addSecondaryService();
	</g:if>
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="secondaryServiceChildList">
		    <g:each var="service" in="${secondaryServices}" status="i">
		        <g:render template='secondaryService' model="['service':service,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input type="button" value="Add Another Service" onclick="addSecondaryService();" />
			<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
