<g:javascript>
	var websiteChildCount = ${websites?.size()} + 0;
	
    function addWebsite(setFocus) {
		var clone = $("#website_clone").clone()
		var divId = 'website'+websiteChildCount;
		var htmlId = 'websites['+websiteChildCount+'].';
		var valueInput = clone.find("input[id$=contactValue]");

		clone.find("input[type=button]")
				.attr('onclick','deleteWebsite("' + divId + '")')
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
		valueInput.attr('id',htmlId + 'contactValue')
		        .attr('name',htmlId + 'contactValue');
		
		clone.attr('id', 'website'+websiteChildCount);
		$("#websiteChildList").append(clone);
		clone.show();
		if (setFocus) {
			valueInput.focus();
		}
		websiteChildCount++;
		toggleAddWebsite();
    }
    
    function deleteWebsite(parentDiv) {
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
        websiteChildCount--;
        toggleAddWebsite();
    }
    
    function toggleAddWebsite() {
    	$("#websiteCount").text(''+websiteChildCount)
    	var button = $("#addWebsiteButton")
		if (websiteChildCount >= 5) {
			button.hide();
		} else {
			button.show();
		}
    }
    
    <g:if test="${!websites}">
    	addWebsite(false);
    </g:if>
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="websiteChildList">
		    <g:each var="website" in="${websites}" status="i">
		        <g:render template='website' model="['website':website,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input id="addWebsiteButton" type="button" value="Add Another Site" onclick="addWebsite(true);" />
			<span class="count"><span id="websiteCount" class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
