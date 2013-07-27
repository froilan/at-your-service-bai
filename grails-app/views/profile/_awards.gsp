<g:javascript>
	var awardChildCount = ${awards?.size()} + 0;

    function addAward(setFocus) {
		var clone = $("#award_clone").clone()
		var divId = 'award'+awardChildCount;
		var htmlId = 'awards['+awardChildCount+'].';
		var nameInput = clone.find("input[id$=awardName]");

		clone.find("input[type=button]")
				.attr('onclick','deleteAward("' + divId + '")')
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
		nameInput.attr('id',htmlId + 'awardName')
		        .attr('name',htmlId + 'awardName');
		clone.find("input[id$=awardYear]")
		        .attr('id',htmlId + 'awardYear')
		        .attr('name',htmlId + 'awardYear');
		clone.find("textarea")
	        .attr('id',htmlId + 'awardDescription')
	        .attr('name',htmlId + 'awardDescription');
		
		clone.attr('id', 'award'+awardChildCount);
		$("#awardChildList").append(clone);
		clone.show();
		if (setFocus) {
			nameInput.focus();
		}
		awardChildCount++;
		toggleAddAward();
    }
    
    function deleteAward(parentDiv) {
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
        awardChildCount--;
        toggleAddAward();
    }
    
    function toggleAddAward() {
    	$("#awardCount").text(''+awardChildCount)
    	var button = $("#addAwardButton")
		if (awardChildCount >= 5) {
			button.hide();
		} else {
			button.show();
		}
    }

    <g:if test="${!awards}">
    	addAward(false);
    </g:if>
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div id="awardChildList">
		    <g:each var="award" in="${awards}" status="i">
		        <g:render template='award' model="['award':award,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input id="addAwardButton" type="button" value="Add Another Award" onclick="addAward(true);" />
			<span class="count"><span id="awardCount" class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
