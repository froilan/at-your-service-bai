<div id="secondaryService${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='secondaryServices[${i}].id' value='${service?.id}'/>
    <g:hiddenField name='secondaryServices[${i}].deleted' value='false'/>
	<g:hiddenField name='secondaryServices[${i}].new' value="${service?.id == null?'true':'false'}"/>
    
	<g:textField class="custom-width" name="secondaryServices[${i}].serviceName" 
		value="${service?.serviceName}" placeholder="Secondary Service Title" />
	<input type="button" onclick="deleteSecondaryService('secondaryService${i}')" value="Delete" />
	<g:textArea class="premium-field" name="secondaryServices[${i}].serviceDescription" 
		value="${service?.serviceDescription}" placeholder="Describe this service..." />
	<span class="blue-star-icon"></span>
    
</div>
