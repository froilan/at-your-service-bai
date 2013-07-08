<h2>Location & Directions</h2>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="companyProfile.address.label" default="Address" />

	</label>
	<g:textField name="address" value="${companyProfileInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'directionsToAddress', 'error')} ">
	<label for="directionsToAddress">
		<g:message code="companyProfile.directionsToAddress.label" default="Directions To Address" />

	</label>
	<g:textField name="directionsToAddress" value="${companyProfileInstance?.directionsToAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyProfileInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="companyProfile.photos.label" default="Photos" />

	</label>
	<input type="file" id="companyProfile.photos" name="companyProfile.photos" />
</div>