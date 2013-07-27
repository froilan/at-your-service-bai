<g:javascript>
	var affiliationChildCount = ${affiliations?.size()} + 0;

    function addAffiliation(setFocus) {
		var clone = $("#affiliation_clone").clone()
		var divId = 'affiliation'+affiliationChildCount;
		var htmlId = 'affiliations['+affiliationChildCount+'].';
		var nameInput = clone.find("input[id$=affiliationName]");

		clone.find("input[type=button]")
				.attr('onclick','deleteAffiliation("' + divId + '")')
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
		if (setFocus) {
			nameInput.focus();
		}
		affiliationChildCount++;
		toggleAddAffiliation();
    }
    
    function deleteAffiliation(parentDiv) {
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
        affiliationChildCount--;
        toggleAddAffiliation();
    }
    
    function toggleAddAffiliation() {
    	$("#affiliationCount").text(''+affiliationChildCount)
    	var button = $("#addAffiliationButton")
		if (affiliationChildCount >= 5) {
			button.hide();
		} else {
			button.show();
		}
    }

	<g:if test="${!affiliations}">
    	addAffiliation(false);
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
			<input id="addAffiliationButton" type="button" value="Add Another Organization" onclick="addAffiliation(true);" />
			<span class="count"><span id="affiliationCount" class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
