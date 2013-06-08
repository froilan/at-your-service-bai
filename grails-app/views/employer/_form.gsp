<%@ page import="com.aysb.Employer" %>



<div class="fieldcontain ${hasErrors(bean: employerInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="employer.contactNumber.label" default="Contact Number" />
		
	</label>
	<g:textField name="contactNumber" value="${employerInstance?.contactNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employerInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="employer.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${employerInstance?.name}"/>
</div>

