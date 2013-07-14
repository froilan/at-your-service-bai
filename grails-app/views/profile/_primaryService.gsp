<div id="primaryService${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='primaryServicesList[${i}].id' value='${service?.id}'/>
    <g:hiddenField name='primaryServicesList[${i}].deleted' value='false'/>
	<g:hiddenField name='primaryServicesList[${i}].new' value="${service?.id == null?'true':'false'}"/>
    
	<g:textField class="custom-width" name="primaryServicesList[${i}].serviceName" 
		value="${primaryServiceInstance?.serviceName}" placeholder="Primary Service Title" />
	<input type="button" onclick="deleteRow('primaryService${i}')" value="Delete" />
	<%--span class="del-primaryService">
        <img src="${resource(dir:'images/skin', file:'icon_delete.png')}" 
            style="vertical-align:middle;" />
    </span--%>
	<div class="star-wrap">
		<g:textArea class="premium-field" name="primaryServicesList[${i}].serviceDescription" 
			value="${primaryServiceInstance?.serviceDescription}" placeholder="Describe this service..." />
		<span class="blue-star-icon"></span>
	</div>
    
</div>
