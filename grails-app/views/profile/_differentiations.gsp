<script type="text/javascript">
	var differentiationChildCount = ${differentiations?.size()} + 0;

    function addDifferentiation() {
		var clone = $("#differentiation_clone").clone()
		var divId = 'differentiation'+differentiationChildCount;
		var htmlId = 'differentiations['+differentiationChildCount+'].';
		var keywordInput = clone.find("input[id$=differentiationKeywords]");

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
		keywordInput.attr('id',htmlId + 'differentiationKeywords')
		        .attr('name',htmlId + 'differentiationKeywords');
		clone.find("textarea")
		        .attr('id',htmlId + 'differentiationDescription')
		        .attr('name',htmlId + 'differentiationDescription');
		
		clone.attr('id', 'differentiation'+differentiationChildCount);
		$("#differentiationChildList").append(clone);
		clone.show();
		keywordInput.focus();
		differentiationChildCount++;
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
</script>

<ul class="input-wrap">
	<li class="user-input">
		<div id="differentiationChildList">
		    <g:each var="differentiation" in="${differentiations}" status="i">
		        <g:render template='differentiation' model="['differentiation':differentiation,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input type="button" value="Add Another Differentiation" onclick="addDifferentiation();" />
			<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
