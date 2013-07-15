<div id="differentiation${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='differentiations[${i}].id' value='${differentiation?.id}'/>
    <g:hiddenField name='differentiations[${i}].deleted' value='false'/>
	<g:hiddenField name='differentiations[${i}].new' value="${differentiation?.id == null?'true':'false'}"/>
    
	<g:textField class="custom-width" name="differentiations[${i}].differentiationKeywords" 
		value="${differentiation?.differentiationKeywords}" 
		placeholder="How is your service unique? Example: Superior Communication" />
	<span class="blue-star-icon"></span>
	<input type="button" onclick="deleteRow('differentiation${i}')" value="Delete" />
	<g:textArea class="premium-field" name="differentiations[${i}].differentiationDescription" 
		value="${differentiation?.differentiationDescription}" 
		placeholder="Tell us a little more why you feel this way..." />
	<span class="blue-star-icon"></span>
    
</div>
