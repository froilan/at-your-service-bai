<%@ page import="com.aysb.Employee" %>

<div class="fieldcontain ${hasErrors(bean: employee, field: 'category', 'error')} ">
	<g:select class="span12 select-form" name="category" from="['Financial','Skilled']" value="${employee?.category}" valueMessagePrefix="employee.category" noSelection="['': 'select category']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: employee, field: 'subCategory', 'error')} ">
	<g:select class="span12 select-form" name="subCategory" from="['Bookkeeper', 'Accountant', 'Doctors', 'Nurse', 'Caregiver', 'Legal', 'Cleaner', 'Janitor', 'Plumber', 'Carpenter', 'Painter', 'Mason', 'Electrician']" value="${employee?.subCategory}" valueMessagePrefix="employee.subCategory"  noSelection="['': 'select subcategory']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: employee, field: 'location', 'error')} ">
	<g:textField class="span12" placeholder="Location" name="location" value="${employee?.location}"/>
</div>
