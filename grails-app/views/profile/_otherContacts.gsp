<g:javascript>
	var otherContactChildCount = ${otherContacts?.size()} + 0;

    function addOtherContact() {
		var clone = $("#phoneNumber_clone").clone()
		var divId = 'otherContact'+otherContactChildCount;
		var htmlId = 'otherContacts['+otherContactChildCount+'].';
		var nameInput = clone.find("input[id$=contactAlias]");

		clone.find("input[type=button]")
				.attr('onclick','deleteOtherContact("' + divId + '")')
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
		toggleAddOtherContact();
    }
    
    function deleteOtherContact(parentDiv) {
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
        otherContactChildCount--;
        toggleAddOtherContact();
    }
    
    function toggleAddOtherContact() {
    	$("#otherContactsCount").text(''+otherContactChildCount)
    	var button = $("#addOtherContactButton")
		if (otherContactChildCount >= 5) {
			button.hide();
		} else {
			button.show();
		}
    }
</g:javascript>

<ul class="input-wrap">
	<li class="user-input">
		<div class="inline-wrap facebook-wrap">
			<span class="icon"></span>
			<g:hiddenField name='facebookContactInfo.id' value='${profile.facebookContactInfo?.id}'/>
			<%--<g:textField class="custom-width" name="facebookContactInfo.contactValue" 
				value="${profile?.facebookContactInfo?.contactValue}" placeholder="http://" />--%>
			<input type="text" class="custom-width"
				id="facebookContactInfo.contactValue"
				name="facebookContactInfo.contactValue" 
				value="${profile?.facebookContactInfo?.contactValue}" 
				placeholder="http://www.facebook.com"
				title="URL" pattern="^(http|https|ftp)\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*[^\.\,\)\(\s]$" />
		</div>
		<div class="inline-wrap twitter-wrap">
			<span class="icon"></span>
			<g:hiddenField name='twitterContactInfo.id' value='${profile.twitterContactInfo?.id}'/>
			<%--<g:textField class="custom-width" name="twitterContactInfo.contactValue" 
				value="${profile?.twitterContactInfo?.contactValue}" placeholder="http://" />--%>
			<input type="text" class="custom-width"
				id="twitterContactInfo.contactValue"
				name="twitterContactInfo.contactValue" 
				value="${profile?.twitterContactInfo?.contactValue}" 
				placeholder="http://www.twitter.com"
				title="URL" pattern="^(http|https|ftp)\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*[^\.\,\)\(\s]$" />
		</div>	
		<div class="inline-wrap linkedin-wrap">
			<span class="icon"></span>
			<g:hiddenField name='linkedInContactInfo.id' value='${profile.linkedInContactInfo?.id}'/>
			<%--<g:textField class="custom-width" name="linkedInContactInfo.contactValue" 
				value="${profile?.linkedInContactInfo?.contactValue}" placeholder="http://" />--%>
			<input type="text" class="custom-width"
				id="linkedInContactInfo.contactValue"
				name="linkedInContactInfo.contactValue" 
				value="${profile?.linkedInContactInfo?.contactValue}" 
				placeholder="http://www.linkedin.com"
				title="URL" pattern="^(http|https|ftp)\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*[^\.\,\)\(\s]$" />
		</div>
		<div id="otherContactChildList">
		    <g:each var="otherContact" in="${profile.otherContacts}" status="i">
		        <g:render template='otherContact' model="['otherContact':otherContact,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input id="addOtherContactButton" type="button" value="Add Another Network" onclick="addOtherContact();" />
			<span class="count"><span id="otherContactsCount" class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
