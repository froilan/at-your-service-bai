<%@ page import="com.ays.License" %>



<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'area', 'error')} ">
	<label for="area">
		<g:message code="license.area.label" default="Area" />
		
	</label>
	<g:textField name="area" value="${licenseInstance?.area}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'authority', 'error')} ">
	<label for="authority">
		<g:message code="license.authority.label" default="Authority" />
		
	</label>
	<g:textField name="authority" value="${licenseInstance?.authority}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="license.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${licenseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'expirationDate', 'error')} required">
	<label for="expirationDate">
		<g:message code="license.expirationDate.label" default="Expiration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="expirationDate" precision="day"  value="${licenseInstance?.expirationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'number', 'error')} ">
	<label for="number">
		<g:message code="license.number.label" default="Number" />
		
	</label>
	<g:textField name="number" value="${licenseInstance?.number}"/>
</div>

