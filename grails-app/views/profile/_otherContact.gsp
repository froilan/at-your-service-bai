<div id="otherContact${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='otherContacts[${i}].id' value='${otherContact?.id}'/>
    <g:hiddenField name='otherContacts[${i}].deleted' value='false'/>
	<g:hiddenField name='otherContacts[${i}].new' value="${otherContact?.id == null?'true':'false'}"/>
    
	<g:textField class="inline half" name="otherContacts[${i}].contactAlias" 
		value="${otherContact?.contactAlias}" 
		placeholder="Network Site (example: Tumblr)" />
	<g:textField class="inline half" name="otherContacts[${i}].contactValue" 
		value="${otherContact?.contactValue}" 
		placeholder="www.tumblr.com/example" />
    <input type="button" onclick="deleteRow('otherContact${i}')" value="Delete" />
	
</div>
