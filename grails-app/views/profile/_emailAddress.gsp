<div id="emailAddress${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='emailAddresses[${i}].id' value='${emailAddress?.id}'/>
    <g:hiddenField name='emailAddresses[${i}].deleted' value='false'/>
	<g:hiddenField name='emailAddresses[${i}].new' value="${emailAddress?.id == null?'true':'false'}"/>
    
	<g:textField class="inline half" name="emailAddresses[${i}].contactAlias" 
		value="${emailAddress?.contactAlias}" 
		placeholder="Name (example: Customer Support)" />
	<%--<g:textField class="inline half" name="emailAddresses[${i}].contactValue" 
		value="${emailAddress?.contactValue}" 
		placeholder="name@company.com" />--%>
	<input name="emailAddresses[${i}].contactValue" type="text" 
		value="${emailAddress?.contactValue}" 
		placeholder="name@company.com"
		title="email" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" />
    <input type="button" onclick="deleteEmailAddress('emailAddress${i}')" value="Delete" />
	
</div>
