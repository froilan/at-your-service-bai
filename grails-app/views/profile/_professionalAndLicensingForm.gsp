<h2>Professional & Licensing</h2>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'differentiation', 'error')} ">
	<label for="differentiation">
		<g:message code="profile.differentiation.label" default="Differentiation" />

	</label>
	<g:textField name="differentiation" value="${profileInstance?.differentiation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'number', 'error')} ">
	<label for="number">
		<g:message code="license.number.label" default="Number" />

	</label>
	<g:textField name="number" value="${licenseInstance?.number}"/>
</div>

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

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'expirationDate', 'error')} required">
	<label for="expirationDate">
		<g:message code="license.expirationDate.label" default="Expiration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="expirationDate" precision="day"  value="${licenseInstance?.expirationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="license.description.label" default="Description" />

	</label>
	<g:textField name="description" value="${licenseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: affiliationInstance, field: 'name', 'error')} ">
	<label for="affiliation">
		<g:message code="profile.affiliation.label" default="Affiliation" />
	</label>
	<g:textField name="affiliation.name" value="${affiliationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: affiliationInstance, field: 'role', 'error')} ">
	<label for="affiliation.role">
		<g:message code="profile.affiliation.role.label" default="Affiliation Role" />
	</label>
	<g:textField name="affiliation.role" value="${affiliationInstance?.role}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'name', 'error')} ">
	<label for="award">
		<g:message code="profile.award.label" default="Award" />
	</label>
	<g:textField name="award.name" value="${awardInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'year', 'error')} ">
	<label for="award.year">
		<g:message code="profile.award.year.label" default="Award Year" />
	</label>
	<g:textField name="award.year" value="${awardInstance?.year}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'description', 'error')} ">
	<label for="award.description">
		<g:message code="profile.award.description.label" default="Award Description" />
	</label>
	<g:textField name="award.description" value="${awardInstance?.description}"/>
</div>
