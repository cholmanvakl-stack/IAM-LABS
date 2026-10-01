# Day 1 — Entra Identity Administration Foundation

## Microsoft Entra ID

**Microsoft Entra ID** → Microsoft's cloud-based identity and access management service.

- Provides authentication and authorization.
- Manages users, groups, devices, applications, and identities.
- Controls access to resources based on identity and permissions.

**How they connect:**  
Entra ID provides the identity foundation used to authenticate users and control access to organizational resources.

---

## Tenant

**Tenant** → A dedicated Microsoft Entra environment for an organization.

- Contains the organization's identities and configuration.
- Has its own directory.
- Provides the boundary for identity and access management.

**How they connect:**  
The tenant is the main Entra environment that contains users, groups, roles, applications, and other identity objects.

---

## Users

**User** → An identity representing a person or account in the tenant.

- Can be created and managed in Entra ID.
- Can be assigned roles.
- Can be added to groups.
- Can be assigned licenses.
- Can authenticate to applications and resources.

**How they connect:**  
Users are the primary identities managed by Entra ID and can receive access directly or through group membership.

---

## Groups

**Group** → A collection of users or other supported objects used to simplify access and administration.

- Security groups can be used to manage access.
- Users can be added to groups.
- Permissions and licenses can be assigned through groups.

**How they connect:**  
Groups allow administrators to manage access and assignments for multiple users instead of configuring each user individually.

---

## Administrative Units

**Administrative Unit (AU)** → A container used to limit administrative scope within a tenant.

- Can contain users, groups, and devices.
- Allows delegated administration over a specific scope.
- Does not create a separate tenant.

**How they connect:**  
Administrative Units allow administrators to delegate management of specific objects without giving administrators access to the entire tenant.

---

## Microsoft Entra Roles

**Microsoft Entra role** → Defines what administrative actions an administrator can perform.

- **Built-in role** → Predefined permissions for common administrative tasks.
- **Custom role** → Custom permissions created for specific administrative requirements.
- Roles can be assigned to users, groups, or service principals.

**Global Administrator** → Has broad administrative access across the tenant.

**How they connect:**  
Roles control administrative permissions, while Administrative Units can limit the scope of some administrative actions.

---

## Licensing

**License** → Provides access to Microsoft cloud services and features.

- Licenses can be assigned to users.
- Licenses can be assigned individually or through groups.
- Available features depend on the assigned license.

**How they connect:**  
Licensing determines which Microsoft services and capabilities are available to users in the tenant.

---

## Identity Administration

**Identity administration** → Managing identities and their access throughout the organization.

Core administration areas include:

- Users
- Groups
- Administrative Units
- Roles
- Licenses

**How they connect:**  
Users are organized with groups, administrative scope can be controlled with Administrative Units, administrative permissions are controlled with roles, and available services/features are controlled through licensing.
