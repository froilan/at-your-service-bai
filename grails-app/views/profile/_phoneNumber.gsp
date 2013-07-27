<div id="phoneNumber${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='phoneNumbers[${i}].id' value='${phoneNumber?.id}'/>
    <g:hiddenField name='phoneNumbers[${i}].deleted' value='false'/>
	<g:hiddenField name='phoneNumbers[${i}].new' value="${phoneNumber?.id == null?'true':'false'}"/>
    
	<g:textField class="inline half" name="phoneNumbers[${i}].contactAlias" 
		value="${phoneNumber?.contactAlias}" 
		placeholder="Name (example: Customer Support)" />
	<g:textField class="inline half" name="phoneNumbers[${i}].contactValue" 
		value="${phoneNumber?.contactValue}" 
		placeholder="+639991234567" />
    <input type="button" onclick="deletePhoneNumber('phoneNumber${i}')" value="Delete" />
	
</div>
