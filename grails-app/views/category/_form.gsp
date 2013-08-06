<%@ page import="com.ays.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'categoryName', 'error')} ">
	<label for="categoryName">
		<g:message code="category.categoryName.label" default="Category Name" />
		
	</label>
	<g:textField name="categoryName" value="${categoryInstance?.categoryName}"/>
</div>

