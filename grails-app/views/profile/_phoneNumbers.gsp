<g:javascript>
	var contactChildCount = ${contacts?.size()} + 0;

    function addPhoneNumber() {
		var clone = $("#phoneNumber_clone").clone()
		var divId = 'phoneNumber'+contactChildCount;
		var htmlId = 'contacts['+contactChildCount+'].';
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
		clone.find("input[id$=contactType]")
		        .attr('id',htmlId + 'contactType')
		        .attr('name',htmlId + 'contactType');
		nameInput.attr('id',htmlId + 'contactAlias')
		        .attr('name',htmlId + 'contactAlias');
		clone.find("input[id$=contactValue]")
		        .attr('id',htmlId + 'contactValue')
		        .attr('name',htmlId + 'contactValue');
		
		clone.attr('id', 'phoneNumber'+contactChildCount);
		$("#phoneNumberChildList").append(clone);
		clone.show();
		nameInput.focus();
		contactChildCount++;
    }

    function deleteRow(parentDiv) {
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
    }
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="phoneNumberChildList">
		    <g:each var="phoneNumber" in="${phoneNumbers}" status="i">
		        <g:render template='phoneNumber' model="['phoneNumber':phoneNumber,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input type="button" value="Add Another Number" onclick="addPhoneNumber();" />
			<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
