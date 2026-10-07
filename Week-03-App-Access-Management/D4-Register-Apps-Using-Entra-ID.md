# Week 3 Day 4 — Register Apps Using Microsoft Entra ID

## Microsoft Learn Alignment

**Module:** Register apps using Microsoft Entra ID

### App Registration Planning

**Registration planning** → Decide how an application will authenticate and which tenants/users it will support.

Consider:

- single-tenant
- multitenant
- supported account types
- authentication flow
- API permissions
- ownership

**How they connect:** Planning determines the application's identity boundary before registration.

### Single-Tenant vs Multitenant

**Single-tenant application** → Intended for users in one Microsoft Entra tenant.

**Multitenant application** → Can be used by users from multiple Microsoft Entra tenants.

**How they connect:** Account-type configuration determines the application's tenant boundary.

### Application Object

**Application object** → Global definition of the application in its home tenant.

Contains configuration such as:

- app ID
- redirect URIs
- API permissions
- app roles
- authentication settings

**How they connect:** The application object defines the application's identity and configuration.

### Service Principal

**Service principal** → Local representation of an application in a tenant.

A multitenant application can have service principals in multiple resource tenants.

**How they connect:** Application object defines the app; service principal represents the app in a specific tenant.

### Application Authentication

**Application authentication** → Configuration that determines how the application proves its identity.

Examples:

- client secret
- certificate
- managed identity for supported Azure workloads

Secrets and certificates must be lifecycle-managed and protected.

**How they connect:** Authentication establishes the application's identity before authorization occurs.

### API Permissions

**API permissions** → Define what APIs and operations an application can request.

Review permissions using least privilege.

**How they connect:** API permissions determine what the application can access after authentication.

### App Roles

**App roles** → Application-defined authorization roles.

Examples:

- Reader
- User
- Administrator

**How they connect:** App roles provide application-specific authorization decisions.

## Critical Comparison

| Concept | Meaning |
|---|---|
| Application object | Definition of the application |
| Service principal | Tenant-local instance of the application |
| App registration | Process/configuration used to create the application identity |
| API permission | Access requested from an API |
| App role | Application-specific authorization role |

## Troubleshooting

**Application Object → Service Principal → Authentication → API Permissions → Consent → Token → Resource**

1. Verify the app registration.
2. Verify the service principal exists in the target tenant.
3. Check authentication configuration.
4. Check API permissions.
5. Check consent.
6. Verify token permissions.
7. Test the resource call.

## Interview Skill

Be able to clearly explain:

> **Application object = what the app is. Service principal = how that app exists in a tenant.**

That distinction is one of the most important application-identity concepts in SC-300.
