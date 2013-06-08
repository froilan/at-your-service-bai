<%@ page import="com.aysb.Employer" %>



<div class="fieldcontain ${hasErrors(bean: employerInstance, field: 'contractNumber', 'error')} ">
	<label for="contractNumber">
		<g:message code="employer.contractNumber.label" default="Contract Number" />
		
	</label>
	<g:textField name="contractNumber" value="${employerInstance?.contractNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employerInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="employer.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${employerInstance?.name}"/>
</div>

