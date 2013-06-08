<%@ page import="com.aysb.Client" %>

<label for="avatar">Avatar (16K)</label>
    <input type="file" name="avatar" id="avatar" />
    <div style="font-size:0.8em; margin: 1.0em;">
      For best results, your avatar should have a width-to-height ratio of 4:5.
      For example, if your image is 80 pixels wide, it should be 100 pixels high.
    </div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="client.contactNumber.label" default="Contact Number" />
		
	</label>
	<g:textField name="contactNumber" value="${clientInstance?.contactNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="client.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${com.aysb.Employee.list()}" optionKey="id" required="" value="${clientInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="client.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${clientInstance?.name}"/>
</div>

