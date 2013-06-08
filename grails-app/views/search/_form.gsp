<%@ page import="com.aysb.Employee" %>

<div class="fieldcontain ${hasErrors(bean: employee, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="employee.category.label" default="Category" />
	</label>
	<g:select name="category" from="${employee.constraints.category.inList}" value="${employee?.category}" valueMessagePrefix="employee.category" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employee, field: 'subCategory', 'error')} ">
	<label for="subCategory">
		<g:message code="employee.subCategory.label" default="Sub Category" />
	</label>
	<g:select name="subCategory" from="${employee.constraints.subCategory.inList}" value="${employee?.subCategory}" valueMessagePrefix="employee.subCategory" noSelection="['': '']"/>
</div>

