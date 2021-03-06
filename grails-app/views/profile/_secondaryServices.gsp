<g:javascript>
	var secondaryServiceChildCount = ${secondaryServices?.size()} + 0;

    function addSecondaryService(setFocus) {
		var clone = $("#secondaryService_clone").clone()
		var divId = 'secondaryService'+secondaryServiceChildCount;
		var htmlId = 'secondaryServices['+secondaryServiceChildCount+'].';
		var serviceNameInput = clone.find("input[id$=serviceName]");

		clone.find("input[type=button]")
				.attr('onclick','deleteSecondaryService("' + divId + '")')
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
		if (setFocus) {
			serviceNameInput.focus();
		}
		secondaryServiceChildCount++;
		toggleAddSecondaryServiceButton();
    }
    
    function deleteSecondaryService(parentDiv) {
    	//find the parent div
    	var prnt = $("#"+parentDiv)
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        var newHidden = prnt.find("input[id$=new]")
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if (newValue == 'true') {
            prnt.remove();
        } else {
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }
        secondaryServiceChildCount--;
        toggleAddSecondaryServiceButton();
    }
    
    function toggleAddSecondaryServiceButton() {
    	$("#secondaryServicesCount").text(''+secondaryServiceChildCount)
    	var button = $("#addSecondaryServiceButton")
		if (secondaryServiceChildCount >= 5) {
			button.hide();
		} else {
			button.show();
		}
    }
    
    <g:if test="${!secondaryServices}">
		addSecondaryService(false);
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
			<input id="addSecondaryServiceButton" type="button" value="Add Another Service" onclick="addSecondaryService(true);" />
			<span class="count"><span id="secondaryServicesCount" class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
