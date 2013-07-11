<h2>Contact Details</h2>

<div class="fieldcontain ${hasErrors(bean: phoneNumberInstance, field: 'name', 'error')} ">
	<label for="contactInfo.phoneNumber.name">
		<g:message code="profile.contactInfo.phoneNumber.name.label" default="Name" />
	</label>
	<g:textField name="contactInfo.phoneNumber.contactAlias" value="${phoneNumberInstance?.contactAlias}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phoneNumberInstance, field: 'value', 'error')} ">
	<label for="contactInfo.phoneNumber">
		<g:message code="profile.contactInfo.phoneNumber.label" default="Phone Number" />
	</label>
	<g:textField name="contactInfo.phoneNumber" value="${phoneNumberInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'name', 'error')} ">
	<label for="contactInfo.email.name">
		<g:message code="profile.contactInfo.email.name.label" default="Email Name" />
	</label>
	<g:textField name="contactInfo.email.contactAlias" value="${emailInstance?.contactAlias}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'value', 'error')} ">
	<label for="contactInfo.email">
		<g:message code="profile.contactInfo.email.label" default="Email" />
	</label>
	<g:textField name="contactInfo.email" value="${emailInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: websiteInstance, field: 'value', 'error')} ">
	<label for="contactInfo.website">
		<g:message code="profile.contactInfo.website.label" default="Website" />
	</label>
	<g:textField name="contactInfo.website" value="${websiteInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facebookInstance, field: 'value', 'error')} ">
	<label for="contactInfo.facebook">
		<g:message code="profile.contactInfo.facebook.label" default="Facebook" />
	</label>
	<g:textField name="contactInfo.facebook" value="${facebookInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: twitterInstance, field: 'value', 'error')} ">
	<label for="contactInfo.twitter">
		<g:message code="profile.contactInfo.twitter.label" default="Twitter" />
	</label>
	<g:textField name="contactInfo.twitter" value="${twitterInstance?.contactValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: linkedInInstance, field: 'value', 'error')} ">
	<label for="contactInfo.linkedIn">
		<g:message code="profile.contactInfo.linkedIn.label" default="LinkedIn" />
	</label>
	<g:textField name="contactInfo.linkedIn" value="${linkedInInstance?.contactValue}"/>
</div>