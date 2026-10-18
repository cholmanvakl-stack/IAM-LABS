# 01 — Initial Configuration of Microsoft Entra ID

## Main concept
<span style="color:#58a6ff"><strong>Configure the identity tenant and delegate administration safely.</strong></span> Everything here concerns the directory boundary, its settings, and who is allowed to manage which objects.

### Microsoft Entra ID and tenant
- <span style="color:#58a6ff"><strong>Microsoft Entra ID:</strong></span> Microsoft's cloud identity and access management service.
- <span style="color:#58a6ff"><strong>Tenant:</strong></span> dedicated directory instance containing users, groups, devices, applications, roles, and policies.
- <span style="color:#58a6ff"><strong>Tenant ID:</strong></span> unique GUID identifying the directory; <span style="color:#58a6ff"><strong>primary domain:</strong></span> initial `*.onmicrosoft.com` namespace.
- <span style="color:#58a6ff"><strong>Microsoft Entra role:</strong></span> administrative permissions inside the directory; <span style="color:#58a6ff"><strong>Azure RBAC role:</strong></span> permissions to manage Azure resources. They are not interchangeable.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> A tenant contains identity objects and administrative boundaries; roles determine who can configure them.

### Company branding
- Customizes supported sign-in pages with organization logo, background, text, and links.
- Improves recognition and user experience; branding itself is <span style="color:#58a6ff"><strong>not</strong></span> an authentication security control.
- May require appropriate licensing for some features.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Branding changes the presentation of the tenant's authentication experience, not its permissions.

### Microsoft Entra roles
- <span style="color:#58a6ff"><strong>Built-in roles:</strong></span> predefined administrative permissions; e.g., Global Administrator (broad tenant control), User Administrator (user administration), Groups Administrator (group management), Helpdesk Administrator (limited password resets).
- <span style="color:#58a6ff"><strong>Custom roles:</strong></span> selected supported permissions assembled for a narrower administrative requirement.
- <span style="color:#58a6ff"><strong>Role assignment:</strong></span> principal + role + scope. Apply <span style="color:#58a6ff"><strong>least privilege</strong></span> and limit standing Global Administrator assignments.
- Role permissions depend on the role and assignment scope; not every role supports every scope.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Roles answer <span style="color:#58a6ff"><strong>who can administer what</strong></span>, rather than which business applications a user can access.

### Administrative Units (AUs)
- <span style="color:#58a6ff"><strong>AU:</strong></span> a container that scopes supported directory administration to a subset of users, groups, or devices.
- Example: a Helpdesk Administrator assigned to an HR AU can perform supported helpdesk tasks for members of that AU.
- <span style="color:#58a6ff"><strong>AU membership alone does not grant access</strong></span>; combine AU scope with a supported role assignment.
- AUs are <span style="color:#58a6ff"><strong>not</strong></span> security boundaries for application access, and they do not automatically scope every directory permission.
- <span style="color:#58a6ff"><strong>Restricted management AUs:</strong></span> specialized protection with additional management restrictions; understand the distinction from ordinary AUs.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Role = permitted operation; AU = which directory objects the delegated admin can manage.

### Analyze role permissions
- Determine the requested action, target object, required permission, role, and supported scope.
- Prefer built-in least-privilege roles before custom roles.
- Distinguish directory roles, Azure RBAC, app roles, and group membership.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> A role assignment only works if the role includes the required action at the target's scope.

### Custom domains
- Add a verified domain (e.g., `contoso.com`) to enable familiar UPNs such as `alex@contoso.com`.
- Verify domain ownership through the required DNS record before use.
- A domain may be set as default; changing the default does not automatically rename existing users.
- <span style="color:#58a6ff"><strong>UPN</strong></span> is sign-in name; email address and UPN can differ.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Domains control sign-in namespaces, not the identity's role or resource access.

### Tenant-wide settings
- Organization-wide settings establish defaults for identity features and collaboration.
- Evaluate who can register applications, invite guests, or access directory features; feature-specific controls may live in separate settings.
- Tenant-wide controls can affect many users; assess scope and impact before changing them.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Tenant-wide settings create broad rules; roles and scoped controls refine who can administer the tenant.

## Exam essentials
- <span style="color:#58a6ff"><strong>Global Administrator vs User Administrator vs Groups Administrator:</strong></span> broad vs specialized administration.
- <span style="color:#58a6ff"><strong>Entra roles vs Azure RBAC:</strong></span> directory management vs Azure resource management.
- <span style="color:#58a6ff"><strong>Role vs AU:</strong></span> action vs object scope.
- <span style="color:#58a6ff"><strong>Custom domain:</strong></span> DNS ownership verification; default-domain changes do not rewrite existing UPNs.
- <span style="color:#58a6ff"><strong>Branding:</strong></span> sign-in appearance, not authorization.

## Troubleshooting
**Action → Target object → Assigned role → Scope/AU → Role permissions → Tenant settings → Audit/Result**

## Check understanding
1. Why does adding a user to an AU not give an administrator access?
2. Why can't an Azure Contributor automatically reset Entra user passwords?
3. What must happen before a custom domain can be used for UPNs?

[Microsoft Learn module](https://learn.microsoft.com/en-us/training/modules/implement-initial-configuration-of-azure-active-directory/)
