<g:javascript>
	var otherContactChildCount = ${otherContacts?.size()} + 0;

    function addOtherContact() {
		var clone = $("#phoneNumber_clone").clone()
		var divId = 'otherContact'+otherContactChildCount;
		var htmlId = 'otherContacts['+otherContactChildCount+'].';
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
		nameInput.attr('id',htmlId + 'contactAlias')
		        .attr('name',htmlId + 'contactAlias');
		clone.find("input[id$=contactValue]")
		        .attr('id',htmlId + 'contactValue')
		        .attr('name',htmlId + 'contactValue');
		
		clone.attr('id', 'otherContact'+otherContactChildCount);
		$("#otherContactChildList").append(clone);
		clone.show();
		nameInput.focus();
		otherContactChildCount++;
    }
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div class="inline-wrap facebook-wrap">
			<span class="icon"></span>
			<g:hiddenField name='facebookContactInfo.id' value='${profile.facebookContactInfo?.id}'/>
			<g:textField class="custom-width" name="facebookContactInfo.contactValue" 
				value="${profile?.facebookContactInfo?.contactValue}" placeholder="http://" />
		</div>
		<div class="inline-wrap twitter-wrap">
			<span class="icon"></span>
			<g:hiddenField name='twitterContactInfo.id' value='${profile.twitterContactInfo?.id}'/>
			<g:textField class="custom-width" name="twitterContactInfo.contactValue" 
				value="${profile?.twitterContactInfo?.contactValue}" placeholder="http://" />
		</div>	
		<div class="inline-wrap linkedin-wrap">
			<span class="icon"></span>
			<g:hiddenField name='linkedInContactInfo.id' value='${profile.linkedInContactInfo?.id}'/>
			<g:textField class="custom-width" name="linkedInContactInfo.contactValue" 
				value="${profile?.linkedInContactInfo?.contactValue}" placeholder="http://" />
		</div>
		<div id="otherContactChildList">
		    <g:each var="otherContact" in="${profile.otherContacts}" status="i">
		        <g:render template='otherContact' model="['otherContact':otherContact,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input type="button" value="Add Another Network" onclick="addOtherContact();" />
			<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
