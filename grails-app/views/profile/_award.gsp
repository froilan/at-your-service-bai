<div id="award${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='awards[${i}].id' value='${award?.id}'/>
    <g:hiddenField name='awards[${i}].deleted' value='false'/>
	<g:hiddenField name='awards[${i}].new' value="${award?.id == null?'true':'false'}"/>
    
	<g:textField class="custom-width" name="awards[${i}].awardName" 
		value="${award?.awardName}" 
		placeholder="Award Name" />
	<g:textField class="custom-width" name="awards[${i}].awardYear" 
		value="${award?.awardYear}" 
		placeholder="Award Year" />
	<g:textArea class="short-textarea" name="awards[${i}].awardDescription" 
		value="${award?.awardDescription}" placeholder="Award Description" />
    <input type="button" onclick="deleteAward('award${i}')" value="Delete" />
	
</div>
