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
	<g:textField name="licenseNumber" value="${licenseInstance?.licenseNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'area', 'error')} ">
	<label for="area">
		<g:message code="license.area.label" default="Area" />

	</label>
	<g:textField name="licenseArea" value="${licenseInstance?.licenseArea}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'authority', 'error')} ">
	<label for="authority">
		<g:message code="license.authority.label" default="Authority" />

	</label>
	<g:textField name="licenseAuthority" value="${licenseInstance?.licenseAuthority}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'expirationDate', 'error')} required">
	<label for="expirationDate">
		<g:message code="license.expirationDate.label" default="Expiration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="licenseExpirationDate" precision="day"  value="${licenseInstance?.licenseExpirationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: licenseInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="license.description.label" default="Description" />

	</label>
	<g:textField name="licenseDescription" value="${licenseInstance?.licenseDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: affiliationInstance, field: 'name', 'error')} ">
	<label for="affiliation">
		<g:message code="profile.affiliation.label" default="Affiliation" />
	</label>
	<g:textField name="affiliation.affiliationName" value="${affiliationInstance?.affiliationName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: affiliationInstance, field: 'role', 'error')} ">
	<label for="affiliation.role">
		<g:message code="profile.affiliation.role.label" default="Affiliation Role" />
	</label>
	<g:textField name="affiliation.affiliationRole" value="${affiliationInstance?.affiliationRole}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'name', 'error')} ">
	<label for="award">
		<g:message code="profile.award.label" default="Award" />
	</label>
	<g:textField name="award.awardName" value="${awardInstance?.awardName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'year', 'error')} ">
	<label for="award.year">
		<g:message code="profile.award.year.label" default="Award Year" />
	</label>
	<g:textField name="award.awardYear" value="${awardInstance?.awardYear}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: awardInstance, field: 'description', 'error')} ">
	<label for="award.description">
		<g:message code="profile.award.description.label" default="Award Description" />
	</label>
	<g:textField name="award.awardDescription" value="${awardInstance?.awardDescription}"/>
</div>
