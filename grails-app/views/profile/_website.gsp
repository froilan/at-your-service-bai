<div id="website${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='websites[${i}].id' value='${website?.id}'/>
    <g:hiddenField name='websites[${i}].deleted' value='false'/>
	<g:hiddenField name='websites[${i}].new' value="${website?.id == null?'true':'false'}"/>
    
	<%--<g:textField class="inline half" name="websites[${i}].contactValue" 
		value="${website?.contactValue}" 
		placeholder="http://www.mydomain.com" />--%>
	<input name="websites[${i}].contactValue" type="text" 
		value="${website?.contactValue}" 
		placeholder="www.mydomain.com"
		title="URL" pattern="/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/" />
    <input type="button" onclick="deleteWebsite('website${i}')" value="Delete" />
	
</div>
