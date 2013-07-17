<g:javascript>
	var awardChildCount = ${awards?.size()} + 0;

    function addAward() {
		var clone = $("#award_clone").clone()
		var divId = 'award'+awardChildCount;
		var htmlId = 'awards['+awardChildCount+'].';
		var nameInput = clone.find("input[id$=awardName]");

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
		nameInput.focus();
		awardChildCount++;
    }

    <g:if test="${!awards}">
    	addAward();
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
			<input type="button" value="Add Another Award" onclick="addAward();" />
			<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
