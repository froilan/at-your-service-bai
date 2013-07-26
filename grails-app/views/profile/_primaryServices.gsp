<g:javascript>
	var primaryServiceChildCount = ${primaryServices?.size()} + 0;

    function addPrimaryService(setFocus) {
		var clone = $("#primaryService_clone").clone()
		var divId = 'primaryService'+primaryServiceChildCount;
		var htmlId = 'primaryServices['+primaryServiceChildCount+'].';
		var serviceNameInput = clone.find("input[id$=serviceName]");

		clone.find("input[type=button]")
				.attr('onclick','deletePrimaryService("' + divId + '")')
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
		//clone.find("input[id$=serviceDescription]")
		clone.find("textarea")
		        .attr('id',htmlId + 'serviceDescription')
		        .attr('name',htmlId + 'serviceDescription');
		
		clone.attr('id', 'primaryService'+primaryServiceChildCount);
		$("#primaryServiceChildList").append(clone);
		clone.show();
		if (setFocus) {
			serviceNameInput.focus();
		}
		primaryServiceChildCount++;
		toggleAddPrimaryServiceButton();
    }
	
    function deletePrimaryService(parentDiv) {
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
        primaryServiceChildCount--;
        toggleAddPrimaryServiceButton();
    }
    
    function toggleAddPrimaryServiceButton() {
    	$("#primaryServicesCount").text(''+primaryServiceChildCount)
    	var button = $("#addPrimaryServiceButton")
		if (primaryServiceChildCount >= 5) {
			button.hide();
		} else {
			button.show();
		}
    }
    
    <g:if test="${!primaryServices}">
    	addPrimaryService(false);
    </g:if>
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="primaryServiceChildList">
		    <g:each var="service" in="${primaryServices}" status="i">
		        <g:render template='primaryService' model="['service':service,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input id="addPrimaryServiceButton" type="button" value="Add Another Service" onclick="addPrimaryService(true);" />
			<span class="count"><span id="primaryServicesCount" class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
