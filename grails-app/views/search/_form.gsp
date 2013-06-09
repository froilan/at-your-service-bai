<%@ page import="com.aysb.Employee" %>

<div class="fieldcontain ${hasErrors(bean: employee, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="employee.category.label" default="Category" />
	</label>
	<g:select name="category" from="['Financial','Skilled']" value="${employee?.category}" valueMessagePrefix="employee.category" noSelection="['': 'select category']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employee, field: 'subCategory', 'error')} ">
	<label for="subCategory">
		<g:message code="employee.subCategory.label" default="Sub Category" />
	</label>
	<g:select name="subCategory" from="['Bookkeeper', 'Accountant', 'Doctors', 'Nurse', 'Caregiver', 'Legal', 'Cleaner', 'Janitor', 'Plumber', 'Carpenter', 'Painter', 'Mason', 'Electrician']" 
	value="${employee?.subCategory}" valueMessagePrefix="employee.subCategory" noSelection="['': 'select subcategory']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employee, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="employee.location.label" default="Location" />
	</label>
	<g:textField name="location" value="${employee?.location}"/>
</div>
