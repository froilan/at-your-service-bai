<div id="phoneNumber${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='contacts[${i}].id' value='${phoneNumber?.id}'/>
    <g:hiddenField name='contacts[${i}].deleted' value='false'/>
	<g:hiddenField name='contacts[${i}].new' value="${phoneNumber?.id == null?'true':'false'}"/>
    
    <g:hiddenField name='contacts[${i}].contactType' value='PHONE_NUMBER'/>
	<g:textField class="inline half" name="contacts[${i}].contactAlias" 
		value="${phoneNumber?.contactAlias}" 
		placeholder="Name (example: Customer Support)" />
	<g:textField class="inline half" name="contacts[${i}].contactValue" 
		value="${phoneNumber?.contactValue}" 
		placeholder="+639991234567" />
    <input type="button" onclick="deleteRow('phoneNumber${i}')" value="Delete" />
	
</div>
