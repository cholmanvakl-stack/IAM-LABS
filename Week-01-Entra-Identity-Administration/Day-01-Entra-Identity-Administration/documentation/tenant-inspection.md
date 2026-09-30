# Tenant Inspection

## Objective

Inspect the IAM LABS Microsoft Entra tenant and document its current identity-administration configuration.

## Environment

- Microsoft Entra ID
- IAM LABS tenant

## Tasks Performed

### Part 1 — Tenant Inspection

- [ ] Reviewed tenant overview
- [ ] Reviewed tenant properties
- [ ] Reviewed custom domains
- [ ] Reviewed tenant-wide settings
- [ ] Reviewed administrative structure

## Findings

### Tenant Overview

The IAM LABS tenant was inspected to establish a baseline of the current Microsoft Entra identity environment.

The tenant overview was reviewed for:

- Tenant name
- Tenant ID
- Primary domain
- Tenant configuration
- Basic tenant properties

### Evidence

![Tenant Overview](../screenshots/01-tenant-overview.png)

### Validation

The tenant overview was reviewed directly in the Microsoft Entra admin center to confirm the current tenant environment before making administrative changes.

### Administrative Role Inspection

The Microsoft Entra administrative role structure was reviewed to identify how tenant-level administrative access is assigned.

The **Global Administrator** role was inspected to determine the current assignment structure and identify the principals with the highest level of administrative access.

The review focused on:

- Current Global Administrator assignments
- Assignment type
- Administrative principals
- Existing role configuration

### Evidence

![Global Administrator Role](../screenshots/02-global-administrator-role.png)

### Validation

The Global Administrator role was opened in the Microsoft Entra admin center and its assignment information was reviewed directly in the tenant.

