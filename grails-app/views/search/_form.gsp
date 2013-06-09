<%@ page import="com.aysb.Employee" %>

<div class="fieldcontain ${hasErrors(bean: employee, field: 'category', 'error')} ">
	<g:select class="span12 select-form" name="category" from="${employee.constraints.category.inList}" value="${employee?.category}" valueMessagePrefix="employee.category" noSelection="['': '']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: employee, field: 'subCategory', 'error')} ">
	<g:select class="span12 select-form" name="subCategory" from="${employee.constraints.subCategory.inList}" value="${employee?.subCategory}" valueMessagePrefix="employee.subCategory" noSelection="['': '']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: employee, field: 'location', 'error')} ">
	<g:textField class="span12" placeholder="Location" name="location" value="${employee?.location}"/>
</div>
