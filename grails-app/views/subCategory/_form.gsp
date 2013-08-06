<%@ page import="com.ays.SubCategory" %>



<div class="fieldcontain ${hasErrors(bean: subCategoryInstance, field: 'subCategoryName', 'error')} ">
	<label for="subCategoryName">
		<g:message code="subCategory.subCategoryName.label" default="Sub Category Name" />
		
	</label>
	<g:textField name="subCategoryName" value="${subCategoryInstance?.subCategoryName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subCategoryInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="subCategory.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.ays.Category.list()}" optionKey="id" required="" value="${subCategoryInstance?.category?.id}" class="many-to-one"/>
</div>

