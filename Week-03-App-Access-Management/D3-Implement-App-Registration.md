# Week 3 Day 3 — Implement App Registration

## Microsoft Learn Alignment

**Module:** Implement app registration

### App Registration Strategy

**Application registration strategy** → Defines how internally developed applications will be represented and secured in Microsoft Entra ID.

Evaluate:

- single-tenant vs multitenant
- authentication method
- API permissions
- app roles
- ownership
- consent
- monitoring

**How they connect:** Strategy prevents applications from being registered without an intentional identity and authorization design.

### Application Registration

**App registration** → Defines an application's identity and configuration in Microsoft Entra ID.

Common settings include:

- redirect URIs
- supported account types
- authentication
- API permissions
- app roles

**How they connect:** The application object defines how the application participates in Microsoft Entra authentication and authorization.

### API Permissions

**API permission** → Permission allowing an application to access an API.

Two major models:

- **Delegated permission** → Application acts on behalf of a signed-in user.
- **Application permission** → Application acts without a signed-in user.

**How they connect:** API permissions determine what protected resources an application can request access to.

### Tenant-Wide Admin Consent

**Admin consent** → Administrator approval for permissions that require organizational authorization.

Use carefully because granting consent can allow an application to access organizational data.

**How they connect:** Admin consent establishes organizational authorization for requested API permissions.

### Application Authorization

**Application authorization** → Determines what an application is allowed to do after authentication.

Authorization can use:

- API permissions
- app roles
- scopes
- Conditional Access
- resource-specific authorization

**How they connect:** Authentication establishes identity; authorization determines permitted actions.

### App Roles

**App role** → Application-defined role that can be assigned to users, groups, or applications.

Example:

- Reader
- Contributor
- Administrator

**How they connect:** App roles provide application-specific authorization beyond basic sign-in.

### App Governance

**Application governance** → Managing application registrations and their permissions throughout their lifecycle.

Review:

- owners
- permissions
- credentials
- consent
- activity
- risk

**How they connect:** Governance prevents applications from accumulating unnecessary permissions or becoming unmanaged identities.

## Troubleshooting

**Registration → Authentication → Permission → Consent → Token → Application → Logs**

1. Verify the application registration.
2. Verify redirect URI/authentication settings.
3. Check API permissions.
4. Verify required admin consent.
5. Inspect the token/claims where appropriate.
6. Check application authorization.
7. Review logs.

## Scenario

An internal application can authenticate but cannot call Microsoft Graph.

Check:

- API permission requested
- delegated vs application permission
- admin consent
- token scopes/roles
- application authorization

## Interview Skill

Be able to explain why application registration is an identity-management problem and why application permissions must be treated with least privilege.
