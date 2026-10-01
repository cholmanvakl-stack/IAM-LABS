# Day 1 — Implement Initial Configuration of Microsoft Entra ID

## Microsoft Entra ID

**Microsoft Entra ID** → Cloud-based identity and access management service.

- Manages identities and access.
- Provides authentication and authorization.
- Contains users, groups, devices, applications, and administrative configuration.

**How they connect:**  
Entra ID provides the identity foundation used to authenticate identities and control access to resources.

---

## Microsoft Entra Roles

**Microsoft Entra role** → Defines what administrative actions an identity can perform in Entra ID.

- **Built-in role** → Predefined permissions for common administrative tasks.
- **Custom role** → Custom permissions created for specific administrative requirements.
- Roles can be assigned to users, groups, or service principals.
- **Global Administrator** → Broad administrative access across the tenant.

**How they connect:**  
Roles determine **what** an administrator can do in Entra ID.

---

## Administrative Units

**Administrative Unit (AU)** → Defines an administrative scope within a tenant.

- Can contain users, groups, and devices.
- Supports delegated administration.
- Allows administrators to manage specific objects without requiring tenant-wide access.
- Does not create a separate tenant.

**How they connect:**  
Administrative Units help control **where** an administrator can perform certain management tasks.

---

## Role Permissions

**Role permissions** → The specific actions an Entra role allows an administrator to perform.

- Roles contain permissions.
- Different roles provide different levels of access.
- Least privilege means assigning only the permissions required.
- Custom roles can provide more specific permissions when built-in roles are not appropriate.

**How they connect:**  
A role defines the permissions available to an administrator; the assignment and administrative scope determine where those permissions can be used.

---

## Custom Domains

**Custom domain** → An organization's own domain name added to Microsoft Entra ID.

Example:

`contoso.com`

- The initial tenant domain uses the `onmicrosoft.com` domain.
- A custom domain can be added for organizational identities.
- The domain must be verified before it can be used.
- Only verified domains can be used for supported identity configuration.

**How they connect:**  
Custom domains allow the Entra tenant to use an organization's own domain instead of relying only on the default tenant domain.

---

## Tenant-wide Settings

**Tenant-wide settings** → Configuration that affects the Microsoft Entra tenant broadly.

Examples include:

- User settings
- External collaboration settings
- Application settings
- Other organization-wide identity configuration

Changes can affect users or services throughout the tenant.

**How they connect:**  
Tenant-wide settings establish configuration that applies broadly across the Entra environment rather than to one individual object.

---

## Company Branding

**Company branding** → Customizes the organization's Microsoft Entra sign-in experience.

Can include:

- Organization logo
- Background image
- Sign-in page appearance
- Organization-specific text

**How they connect:**  
Company branding changes the appearance and messaging of the authentication experience without changing the underlying authentication process.
