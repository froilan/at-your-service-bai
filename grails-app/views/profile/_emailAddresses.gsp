<g:javascript>
	var emailChildCount = ${emailAddresses?.size()} + 0;
	
    function addEmailAddress(setFocus) {
		var clone = $("#emailAddress_clone").clone()
		var divId = 'emailAddress'+emailChildCount;
		var htmlId = 'emailAddresses['+emailChildCount+'].';
		var nameInput = clone.find("input[id$=contactAlias]");

		clone.find("input[type=button]")
				.attr('onclick','deleteEmailAddress("' + divId + '")')
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
		if (setFocus) {
			nameInput.focus();
		}
		emailChildCount++;
		toggleAddEmailAddress();
    }
    
    function deleteEmailAddress(parentDiv) {
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
        emailChildCount--;
        toggleAddEmailAddress();
    }
    
    function toggleAddEmailAddress() {
    	$("#emailAddressCount").text(''+emailChildCount)
    	var button = $("#addEmailAddressButton")
		if (emailChildCount >= 5) {
			button.hide();
		} else {
			button.show();
		}
    }
    
    <g:if test="${!emailAddresses}">
    	addEmailAddress(false);
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
			<input id="addEmailAddressButton" type="button" value="Add Another Email" onclick="addEmailAddress(true);" />
			<span class="count"><span id="emailAddressCount" class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
