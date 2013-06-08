<%@ page import="com.aysb.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="employee.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${employeeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'contactNumber', 'error')} required">
	<label for="contactNumber">
		<g:message code="employee.contactNumber.label" default="Contact Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNumber" required="" value="${employeeInstance?.contactNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="employee.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${employeeInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'highRate', 'error')} ">
	<label for="highRate">
		<g:message code="employee.highRate.label" default="High Rate" />
		
	</label>
	<g:field name="highRate" value="${fieldValue(bean: employeeInstance, field: 'highRate')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lowRate', 'error')} ">
	<label for="lowRate">
		<g:message code="employee.lowRate.label" default="Low Rate" />
		
	</label>
	<g:field name="lowRate" value="${fieldValue(bean: employeeInstance, field: 'lowRate')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="employee.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${employeeInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'clients', 'error')} ">
	<label for="clients">
		<g:message code="employee.clients.label" default="Clients" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${employeeInstance?.clients?}" var="c">
    <li><g:link controller="client" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="client" action="create" params="['employee.id': employeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'client.label', default: 'Client')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="employee.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${employeeInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'negotiableRate', 'error')} ">
	<label for="negotiableRate">
		<g:message code="employee.negotiableRate.label" default="Negotiable Rate" />
		
	</label>
	<g:checkBox name="negotiableRate" value="${employeeInstance?.negotiableRate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'skills', 'error')} ">
	<label for="skills">
		<g:message code="employee.skills.label" default="Skills" />
		
	</label>
	<g:textField name="skills" value="${employeeInstance?.skills}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'subCategory', 'error')} ">
	<label for="subCategory">
		<g:message code="employee.subCategory.label" default="Sub Category" />
		
	</label>
	<g:textField name="subCategory" value="${employeeInstance?.subCategory}"/>
</div>

