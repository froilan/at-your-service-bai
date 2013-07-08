<h2>Company Information & Rates</h2>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="companyProfile.logo.label" default="Logo" />

	</label>
	<input type="file" id="logo" name="logo" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'displayPicture', 'error')} ">
	<label for="displayPicture">
		<g:message code="profile.displayPicture.label" default="Display Picture" />

	</label>
	<input type="file" id="displayPicture" name="displayPicture" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'feeStructure', 'error')} ">
	<label for="feeStructure">
		<g:message code="profile.feeStructure.label" default="Fee Structure" />

	</label>
	<g:select name="feeStructure" from="${com.ays.FeeStructure?.values()}" keys="${com.ays.FeeStructure.values()*.name()}" value="${profileInstance?.feeStructure?.name()}" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'askingFee', 'error')} required">
	<label for="askingFee">
		<g:message code="profile.askingFee.label" default="Asking Fee" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="askingFee" type="number" value="${fieldValue(bean: profileInstance, field: 'askingFee')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'inBusinessSince', 'error')} ">
	<label for="inBusinessSince">
		<g:message code="companyProfile.inBusinessSince.label" default="In Business Since" />

	</label>
	<g:field name="inBusinessSince" type="number" value="${profileInstance?.companyProfile?.inBusinessSince}"/>
</div>