<div id="emailAddress${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='contacts[${i}].id' value='${emailAddress?.id}'/>
    <g:hiddenField name='contacts[${i}].deleted' value='false'/>
	<g:hiddenField name='contacts[${i}].new' value="${emailAddress?.id == null?'true':'false'}"/>
    
    <g:hiddenField name='contacts[${i}].contactType' value='EMAIL'/>
	<g:textField class="inline half" name="contacts[${i}].contactAlias" 
		value="${emailAddress?.contactAlias}" 
		placeholder="Name (example: Customer Support)" />
	<g:textField class="inline half" name="contacts[${i}].contactValue" 
		value="${emailAddress?.contactValue}" 
		placeholder="name@company.com" />
    <input type="button" onclick="deleteRow('emailAddress${i}')" value="Delete" />
	
</div>
