<g:javascript>
	var phoneNumberChildCount = ${phoneNumbers?.size()} + 0;

    function addPhoneNumber(setFocus) {
		var clone = $("#phoneNumber_clone").clone()
		var divId = 'phoneNumber'+phoneNumberChildCount;
		var htmlId = 'phoneNumbers['+phoneNumberChildCount+'].';
		var nameInput = clone.find("input[id$=contactAlias]");

		clone.find("input[type=button]")
				.attr('onclick','deletePhoneNumber("' + divId + '")')
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
		
		clone.attr('id', 'phoneNumber'+phoneNumberChildCount);
		$("#phoneNumberChildList").append(clone);
		clone.show();
		if (setFocus) {
			nameInput.focus();
		}
		phoneNumberChildCount++;
		toggleAddPhoneNumber();
    }
    
    function deletePhoneNumber(parentDiv) {
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
        phoneNumberChildCount--;
        toggleAddPhoneNumber();
    }
    
    function toggleAddPhoneNumber() {
    	$("#phoneNumberCount").text(''+phoneNumberChildCount)
    	var button = $("#addPhoneNumberButton")
		if (phoneNumberChildCount >= 5) {
			button.hide();
		} else {
			button.show();
		}
    }
    
    <g:if test="${!phoneNumbers}">
    	addPhoneNumber(false);
    </g:if>
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="phoneNumberChildList">
		    <g:each var="phoneNumber" in="${phoneNumbers}" status="i">
		        <g:render template='phoneNumber' model="['phoneNumber':phoneNumber,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input id="addPhoneNumberButton" type="button" value="Add Another Number" onclick="addPhoneNumber(true);" />
			<span class="count"><span id="phoneNumberCount" class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
