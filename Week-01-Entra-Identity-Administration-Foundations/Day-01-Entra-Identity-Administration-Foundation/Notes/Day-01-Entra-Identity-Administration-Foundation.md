# Day 1 — Implement Initial Configuration of Microsoft Entra ID

## Microsoft Entra ID

**Microsoft Entra ID** → Cloud-based identity and access management service.

- Provides authentication and authorization.
- Manages identities and access.
- Contains identity objects and configuration for the organization.

**How they connect:**  
Entra ID provides the identity foundation used to authenticate users and control access to organizational resources.

---

## Company Branding

**Company branding** → Customizes the Microsoft Entra sign-in experience.

- Can customize the sign-in page.
- Can add organization branding such as logos and images.
- Can provide organization-specific sign-in text.

**How they connect:**  
Company branding changes the user's sign-in experience while Entra ID continues to handle authentication.

---

## Microsoft Entra Roles

**Microsoft Entra role** → Defines administrative permissions in Entra ID.

- **Built-in role** → Predefined permissions for common administrative tasks.
- **Custom role** → Custom permissions for specific administrative requirements.
- Roles can be assigned to users, groups, and service principals.
- **Global Administrator** → Broad administrative access across the tenant.

**How they connect:**  
Roles determine **what** administrative actions an identity can perform.

---

## Administrative Units

**Administrative Unit (AU)** → Defines an administrative scope within a tenant.

- Can contain users, groups, and devices.
- Supports delegated administration.
- Allows administration of specific objects without requiring tenant-wide permissions.
- Does not create a separate tenant.

**How they connect:**  
Administrative Units help determine **where** delegated administrators can manage objects.

---

## Role Permissions

**Role permissions** → The individual actions allowed by an Entra role.

- Different roles provide different permissions.
- Built-in roles provide predefined permission sets.
- Custom roles provide more specific permissions.
- Follow **least privilege** → Give administrators only the permissions they need.

**How they connect:**  
Roles determine **what** an administrator can do; Administrative Units can help determine **which objects** the administrator can manage.

---

## Custom Domains

**Custom domain** → An organization's domain added to Microsoft Entra ID.

Example:

`contoso.com`

- New tenants receive an initial `onmicrosoft.com` domain.
- Organizations can add their own domain.
- A custom domain must be **verified** before it can be used.
- A verified domain can be used for organizational identities.

**How they connect:**  
Custom domains allow the organization to use its own domain name within Microsoft Entra ID.

---

## Tenant-Wide Settings

**Tenant-wide settings** → Configuration that applies broadly across the Microsoft Entra tenant.

Examples:

- User settings
- External collaboration settings
- Application-related settings
- Organization-wide identity configuration

**How they connect:**  
Tenant-wide settings establish behavior that can affect the broader Entra environment instead of one individual object.

---

## Tenant

**Tenant** → A dedicated Microsoft Entra environment for an organization.

- Contains the organization's identity configuration.
- Has its own directory.
- Uses a tenant-specific domain.
- Contains users, groups, devices, applications, and administrative configuration.

**How they connect:**  
The tenant is the overall Entra environment in which identity and access administration occurs.

---

## Delegated Administration

**Delegated administration** → Giving an administrator responsibility for a defined scope instead of the entire tenant.

- Uses administrative roles.
- Administrative Units can provide the administrative scope.
- Supports least-privilege administration.

**How they connect:**  
Roles provide the administrator's permissions, while Administrative Units can restrict the objects within the administrator's scope.

---

## Day 1 Core Relationships

**Tenant**  
→ Contains the Entra environment

**Roles**  
→ Define what an administrator can do

**Administrative Units**  
→ Define an administrative scope

**Role permissions**  
→ Define the specific actions allowed

**Custom domains**  
→ Provide the organization's verified domain

**Tenant-wide settings**  
→ Configure behavior across the tenant

**Company branding**  
→ Customizes the sign-in experience

**How they connect:**  
Microsoft Entra ID provides the tenant-wide identity platform. Roles provide administrative permissions, Administrative Units support delegated scope, custom domains establish organizational identity naming, tenant-wide settings configure broad behavior, and company branding customizes the authentication experience.
