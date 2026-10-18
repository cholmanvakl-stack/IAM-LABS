# 01 — Initial Configuration of Microsoft Entra ID

## Main concept
**Configure the identity tenant and delegate administration safely.** Everything here concerns the directory boundary, its settings, and who is allowed to manage which objects.

### Microsoft Entra ID and tenant
- **Microsoft Entra ID:** Microsoft's cloud identity and access management service.
- **Tenant:** dedicated directory instance containing users, groups, devices, applications, roles, and policies.
- **Tenant ID:** unique GUID identifying the directory; **primary domain:** initial `*.onmicrosoft.com` namespace.
- **Microsoft Entra role:** administrative permissions inside the directory; **Azure RBAC role:** permissions to manage Azure resources. They are not interchangeable.
**How they connect:** A tenant contains identity objects and administrative boundaries; roles determine who can configure them.

### Company branding
- Customizes supported sign-in pages with organization logo, background, text, and links.
- Improves recognition and user experience; branding itself is **not** an authentication security control.
- May require appropriate licensing for some features.
**How they connect:** Branding changes the presentation of the tenant's authentication experience, not its permissions.

### Microsoft Entra roles
- **Built-in roles:** predefined administrative permissions; e.g., Global Administrator (broad tenant control), User Administrator (user administration), Groups Administrator (group management), Helpdesk Administrator (limited password resets).
- **Custom roles:** selected supported permissions assembled for a narrower administrative requirement.
- **Role assignment:** principal + role + scope. Apply **least privilege** and limit standing Global Administrator assignments.
- Role permissions depend on the role and assignment scope; not every role supports every scope.
**How they connect:** Roles answer **who can administer what**, rather than which business applications a user can access.

### Administrative Units (AUs)
- **AU:** a container that scopes supported directory administration to a subset of users, groups, or devices.
- Example: a Helpdesk Administrator assigned to an HR AU can perform supported helpdesk tasks for members of that AU.
- **AU membership alone does not grant access**; combine AU scope with a supported role assignment.
- AUs are **not** security boundaries for application access, and they do not automatically scope every directory permission.
- **Restricted management AUs:** specialized protection with additional management restrictions; understand the distinction from ordinary AUs.
**How they connect:** Role = permitted operation; AU = which directory objects the delegated admin can manage.

### Analyze role permissions
- Determine the requested action, target object, required permission, role, and supported scope.
- Prefer built-in least-privilege roles before custom roles.
- Distinguish directory roles, Azure RBAC, app roles, and group membership.
**How they connect:** A role assignment only works if the role includes the required action at the target's scope.

### Custom domains
- Add a verified domain (e.g., `contoso.com`) to enable familiar UPNs such as `alex@contoso.com`.
- Verify domain ownership through the required DNS record before use.
- A domain may be set as default; changing the default does not automatically rename existing users.
- **UPN** is sign-in name; email address and UPN can differ.
**How they connect:** Domains control sign-in namespaces, not the identity's role or resource access.

### Tenant-wide settings
- Organization-wide settings establish defaults for identity features and collaboration.
- Evaluate who can register applications, invite guests, or access directory features; feature-specific controls may live in separate settings.
- Tenant-wide controls can affect many users; assess scope and impact before changing them.
**How they connect:** Tenant-wide settings create broad rules; roles and scoped controls refine who can administer the tenant.

## Exam essentials
- **Global Administrator vs User Administrator vs Groups Administrator:** broad vs specialized administration.
- **Entra roles vs Azure RBAC:** directory management vs Azure resource management.
- **Role vs AU:** action vs object scope.
- **Custom domain:** DNS ownership verification; default-domain changes do not rewrite existing UPNs.
- **Branding:** sign-in appearance, not authorization.

## Troubleshooting
**Action → Target object → Assigned role → Scope/AU → Role permissions → Tenant settings → Audit/Result**

## Check understanding
1. Why does adding a user to an AU not give an administrator access?
2. Why can't an Azure Contributor automatically reset Entra user passwords?
3. What must happen before a custom domain can be used for UPNs?

[Microsoft Learn module](https://learn.microsoft.com/en-us/training/modules/implement-initial-configuration-of-azure-active-directory/)
