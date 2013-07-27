<div id="affiliation${i}" class="entry-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='affiliations[${i}].id' value='${affiliation?.id}'/>
    <g:hiddenField name='affiliations[${i}].deleted' value='false'/>
	<g:hiddenField name='affiliations[${i}].new' value="${affiliation?.id == null?'true':'false'}"/>
    
	<g:textField class="custom-width" name="affiliations[${i}].affiliationName" 
		value="${affiliation?.affiliationName}" 
		placeholder="Organization Name" />
	<g:textField class="custom-width" name="affiliations[${i}].affiliationRole" 
		value="${affiliation?.affiliationRole}" 
		placeholder="Role / Postion" />
    <input type="button" onclick="deleteAffiliation('affiliation${i}')" value="Delete" />
	
</div>
