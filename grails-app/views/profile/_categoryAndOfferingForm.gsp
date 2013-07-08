<h2>Categories & Offerings</h2>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="companyProfile.name.label" default="Business Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${profileInstance?.companyProfile?.name}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="profile.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.ays.Category.list()}" optionKey="id" required="" value="${profileInstance?.category?.id}" class="many-to-one" noSelection="['': '- select a category -']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'subCategory', 'error')} ">
	<label for="subCategory">
		<g:message code="profile.subCategory.label" default="Sub Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subCategory" name="subCategory.id" from="${com.ays.SubCategory.list()}" optionKey="id" value="${profileInstance?.subCategory?.id}" class="many-to-one" noSelection="['': '- select a category -']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="companyProfile.description.label" default="Description" />

	</label>
	<g:textField name="description" value="${profileInstance?.companyProfile?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: primaryServiceInstance, field: 'name', 'error')} ">
	<label for="primaryService.name">
		<g:message code="profile.primaryService.name.label" default="Primary Service Offering" />
	</label>
	<g:textField name="primaryService.name" value="${primaryServiceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: primaryServiceInstance, field: 'description', 'error')} ">
	<label for="primaryService.description">
		<g:message code="profile.primaryService.description.label" default="Primary Service Description" />
	</label>
	<g:textField name="primaryService.description" value="${primaryServiceInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secondaryServiceInstance, field: 'name', 'error')} ">
	<label for="secondaryService.name">
		<g:message code="profile.secondaryService.name.label" default="Secondary Service Offering" />
	</label>
	<g:textField name="secondaryService.name" value="${secondaryServiceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secondaryServiceInstance, field: 'description', 'error')} ">
	<label for="secondaryService.description">
		<g:message code="profile.secondaryService.description.label" default="Secondary Service Description" />
	</label>
	<g:textField name="secondaryService.description" value="${secondaryServiceInstance?.description}"/>
</div>