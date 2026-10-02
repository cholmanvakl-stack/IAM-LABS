# IAM LABS — Day 3 Lab

## Lab 1 — External Identity Administration

**Objective:**  
Inspect and document the Microsoft Entra configuration used to manage external identities, B2B collaboration, guest users, dynamic guest groups, cross-tenant access, and external identity providers.

**Portfolio title:**  
**IAM LABS Week 1 — External Identity & B2B Collaboration Administration**

---

## Part 1 — External Identities Overview

### Step 1 — Open Microsoft Entra External Identities

1. Open the **Microsoft Entra admin center**.
2. Select **Microsoft Entra ID**.
3. Select **External Identities**.
4. Review the External Identities overview.

**Look for:**
- External collaboration capabilities
- Guest user management
- Cross-tenant access
- Identity providers

**Screenshot:**  
`01-external-identities-overview.png`

**Evidence:**  
This screenshot documents the tenant's External Identities administration area.

---

## Part 2 — External Collaboration Settings

### Step 1 — Open External Collaboration Settings

1. In **Microsoft Entra ID**, select **External Identities**.
2. Open **External collaboration settings**.
3. Review the available guest collaboration controls.

**Look for:**
- Guest invitation settings
- Guest user permissions
- Collaboration restrictions
- Domain restrictions

**Screenshot:**  
`02-external-collaboration-settings.png`

**Evidence:**  
This screenshot documents the tenant's current external collaboration configuration.

**Important:**  
No settings were changed during this inspection.

---

## Part 3 — Guest Invitation Configuration

### Step 1 — Open the External User Invitation Workflow

1. Go to **Microsoft Entra ID**.
2. Select **Users**.
3. Select **All users**.
4. Select **+ New user**.
5. Select **Invite external user**.
6. Review the invitation form.

**Look for:**
- Email address
- Display name
- Invitation message
- Groups
- Roles
- Properties

**Screenshot:**  
`03-guest-invite-settings.png`

**Evidence:**  
This screenshot documents the administrative workflow used to invite an external identity.

**Important:**  
Do not send an invitation.

---

## Part 4 — Guest User Management

### Step 1 — Review Existing Guest Users

1. Return to **Microsoft Entra ID**.
2. Select **Users**.
3. Select **All users**.
4. Review the **User type** column.
5. Identify any users marked **Guest**.

**Look for:**
- Guest user accounts
- User type
- Account status
- User properties
- Available management actions

**Screenshot:**  
`04-guest-user-management.png`

**Evidence:**  
This screenshot documents how guest identities are identified and managed within the tenant.

**Important:**  
Do not delete or modify guest users during this lab.

---

## Part 5 — Dynamic Groups for External Users

### Step 1 — Open Dynamic Group Configuration

1. Go to **Microsoft Entra ID**.
2. Select **Groups**.
3. Select **All groups**.
4. Select **+ New group**.
5. Set **Group type** to **Security**.
6. Set **Membership type** to **Dynamic User**.
7. Open the **Add dynamic query** / rule builder.

### Step 2 — Inspect Guest User Rules

Review how a dynamic membership rule can identify guest users.

Example attribute:

`user.userType`

Example condition:

`user.userType -eq "Guest"`

**Look for:**
- Dynamic membership
- Rule builder
- User attributes
- `userType`
- Guest-based membership logic

**Screenshot:**  
`05-dynamic-guest-group.png`

**Evidence:**  
This screenshot demonstrates how Microsoft Entra can automatically identify and group external users based on identity attributes.

**Important:**  
Do not save or create the group unless specifically instructed.

---

## Part 6 — Cross-Tenant Access Default Settings

### Step 1 — Open Cross-Tenant Access Settings

1. Go to **Microsoft Entra ID**.
2. Select **External Identities**.
3. Select **Cross-tenant access settings**.
4. Open **Default settings**.

**Look for:**
- Inbound access
- Outbound access
- B2B collaboration
- Trust settings

**Screenshot:**  
`06-cross-tenant-default-settings.png`

**Evidence:**  
This screenshot documents the tenant's default cross-tenant collaboration policy.

**Important:**  
Do not modify the default settings.

---

## Part 7 — Cross-Tenant Inbound Access

### Step 1 — Inspect Inbound Access

1. Remain in **Cross-tenant access settings**.
2. Open the **Inbound access** configuration.
3. Review the available B2B collaboration and trust controls.

**Look for:**
- External users accessing your tenant
- B2B collaboration
- Organization-specific policies
- Trust settings
- Authentication/device claims

**Screenshot:**  
`07-cross-tenant-inbound-access.png`

**Evidence:**  
This screenshot documents how the tenant controls inbound collaboration from other Microsoft Entra organizations.

**Important:**  
Do not modify the configuration.

---

## Part 8 — External Identity Providers

### Step 1 — Open Identity Providers

1. Go to **Microsoft Entra ID**.
2. Select **External Identities**.
3. Open **All identity providers**.
4. Review the available identity-provider configuration.

**Look for:**
- External identity providers
- SAML
- WS-Fed
- Authentication providers
- Provider configuration options

**Screenshot:**  
`08-identity-providers.png`

**Evidence:**  
This screenshot documents where external authentication providers are configured within Microsoft Entra.

**Important:**  
Do not configure or add an identity provider.

---

# Day 3 Evidence

| # | Evidence | Screenshot |
|---|---|---|
| 1 | External Identities overview | `01-external-identities-overview.png` |
| 2 | External collaboration settings | `02-external-collaboration-settings.png` |
| 3 | Guest invitation configuration | `03-guest-invite-settings.png` |
| 4 | Guest user management | `04-guest-user-management.png` |
| 5 | Dynamic guest group configuration | `05-dynamic-guest-group.png` |
| 6 | Cross-tenant default settings | `06-cross-tenant-default-settings.png` |
| 7 | Cross-tenant inbound access | `07-cross-tenant-inbound-access.png` |
| 8 | External identity providers | `08-identity-providers.png` |

---

# Day 3 Summary

This lab documented the tenant's external identity administration capabilities, including:

- Guest users
- Microsoft Entra B2B collaboration
- External collaboration settings
- External user invitations
- Guest user management
- Dynamic groups for external users
- Cross-tenant access
- External identity providers

The lab focused on **inspection and documentation** rather than changing tenant configuration.

---

# Completion Checklist

- [x] External Identities overview inspected
- [x] External collaboration settings inspected
- [x] Guest invitation workflow inspected
- [x] Guest user management inspected
- [x] Dynamic guest group rule builder inspected
- [x] Cross-tenant default settings inspected
- [x] Cross-tenant inbound access inspected
- [x] External identity providers inspected
- [x] All 8 screenshots captured
- [ ] GitHub screenshots uploaded
- [ ] GitHub README saved

---

# Skills Practiced

- Microsoft Entra External Identities
- B2B collaboration
- Guest user administration
- External collaboration management
- Dynamic group membership
- Cross-tenant access
- External identity providers
- Identity administration
- IAM documentation
- Evidence-based administration
