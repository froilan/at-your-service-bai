<g:javascript>
	var differentiationChildCount = ${differentiations?.size()} + 0;

    function addDifferentiation(setFocus) {
		var clone = $("#differentiation_clone").clone()
		var divId = 'differentiation'+differentiationChildCount;
		var htmlId = 'differentiations['+differentiationChildCount+'].';
		var keywordInput = clone.find("input[id$=differentiationKeywords]");

		clone.find("input[type=button]")
				.attr('onclick','deleteDifferentiation("' + divId + '")')
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
		keywordInput.attr('id',htmlId + 'differentiationKeywords')
		        .attr('name',htmlId + 'differentiationKeywords');
		clone.find("textarea")
		        .attr('id',htmlId + 'differentiationDescription')
		        .attr('name',htmlId + 'differentiationDescription');
		
		clone.attr('id', 'differentiation'+differentiationChildCount);
		$("#differentiationChildList").append(clone);
		clone.show();
		if (setFocus) {
			keywordInput.focus();
		}
		differentiationChildCount++;
		toggleAddDifferentiation();
    }
    
    function deleteDifferentiation(parentDiv) {
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
        differentiationChildCount--;
        toggleAddDifferentiation();
    }
    
    function toggleAddDifferentiation() {
    	$("#differentiationCount").text(''+differentiationChildCount)
    	var button = $("#addDifferentiationButton")
		if (differentiationChildCount >= 5) {
			button.hide();
		} else {
			button.show();
		}
    }
    
    <g:if test="${!differentiations}">
    	addDifferentiation(false);
    </g:if>
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="differentiationChildList">
		    <g:each var="differentiation" in="${differentiations}" status="i">
		        <g:render template='differentiation' model="['differentiation':differentiation,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input id="addDifferentiationButton" type="button" value="Add Another Differentiation" onclick="addDifferentiation(true);" />
			<span class="count"><span id="differentiationCount" class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
