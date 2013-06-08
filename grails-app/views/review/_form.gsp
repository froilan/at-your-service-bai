<%@ page import="com.aysb.Review" %>


<input type="hidden" name="empId" value"${employeeId}" />
<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="review.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rating" value="${fieldValue(bean: reviewInstance, field: 'rating')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'remarks', 'error')} ">
	<label for="remarks">
		<g:message code="review.remarks.label" default="Remarks" />
		
	</label>
	<g:textField name="remarks" value="${reviewInstance?.remarks}"/>
</div>

