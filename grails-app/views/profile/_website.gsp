<div id="website${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='contacts[${i}].id' value='${website?.id}'/>
    <g:hiddenField name='contacts[${i}].deleted' value='false'/>
	<g:hiddenField name='contacts[${i}].new' value="${website?.id == null?'true':'false'}"/>
    
    <g:hiddenField name='contacts[${i}].contactType' value='WEBSITE'/>
	<g:textField class="inline half" name="contacts[${i}].contactValue" 
		value="${website?.contactValue}" 
		placeholder="http://www.mydomain.com" />
    <input type="button" onclick="deleteRow('website${i}')" value="Delete" />
	
</div>
