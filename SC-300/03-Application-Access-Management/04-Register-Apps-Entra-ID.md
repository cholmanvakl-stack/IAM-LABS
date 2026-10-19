# 04 — Register Apps Using Microsoft Entra ID

## Main concept
`Application object = global definition; service principal = tenant-local identity; authentication settings = how tokens are requested; permissions and roles = what access is allowed.`

This module reinforces the registration architecture and the settings you must recognize in the portal and on the SC-300 exam.

## Why register apps?
- Delegate user authentication to Microsoft Entra rather than building your own password store.
- Request tokens for protected APIs using modern OAuth/OIDC flows.
- Manage redirect URIs, identity credentials, token configuration, consent and app permissions centrally.
- Enable conditional access and governance where supported.

## Single-tenant vs multitenant
- `Single-tenant app`: accepts accounts from its home organization's directory.
- `Multitenant app`: can accept organizational accounts from other Entra tenants when configured and consented.
- A multitenant registration has an `application object` in its home tenant and generally a `service principal` in each consenting/using tenant.
- Multitenant does not mean unrestricted: tenant consent, app assignments, policies and authorization still matter.

## Application objects and service principals
| Object | Purpose | Location |
|---|---|---|
| `Application object` | Definition, identifiers, supported audiences, redirect URIs, credentials, API configuration | Home tenant |
| `Service principal` | Local app identity, enterprise app settings, assignments, consent relationships | Each relevant tenant |

- `App registrations` portal shows application definitions.
- `Enterprise applications` shows service principals, including gallery and third-party apps.
- Deleting or changing one object has effects depending on tenant and relationship; do not assume the two views are duplicates.

## Create and configure app registrations
1. Choose name and supported account types.
2. Select correct platform and register exact redirect URI(s).
3. Record client ID and tenant ID.
4. Configure certificate, federated credential, or secret only when needed; never commit secrets.
5. Define required API permissions, obtain consent and assign owners.
6. Expose API scopes/app roles if the app is a resource API.
7. Test token issuance and app access; review logs.

## Configure authentication
- `Web/confidential client`: can authenticate to token endpoint with protected credentials; use authorization code flow for interactive web apps.
- `SPA/public client`: cannot securely keep a client secret; use authorization code with PKCE in supported scenarios.
- `Mobile/desktop public client`: native app; use recommended public-client flows.
- `Client credentials`: noninteractive workload/app-only access; no user context.
- `Redirect URI mismatch`: common sign-in failure; scheme, hostname, path and registration must align.
- `Implicit flow`: legacy pattern; prefer modern authorization code + PKCE when supported.

## Configure API permissions and consent
- `Delegated`: scopes in user context.
- `Application`: app roles for unattended workloads.
- `Admin consent`: approval by authorized tenant admin for required permission grants.
- `Least privilege`: narrow permissions, scope app access, review grants.
- The `API permissions` page can show configured requests; verify actual granted status.

## Create app roles
- Define `display name`, `value`, `description`, `allowed member types` and enablement.
- Assign roles to users/groups or applications as supported.
- In tokens, `roles` can represent assigned app roles; `scp` represents delegated scopes in access tokens.
- App must validate the token and enforce role authorization; merely defining a role does not implement app security.

## SC-300 exam essentials
- `App registration` vs `enterprise application`: definition vs tenant instance.
- `Single tenant` vs `multitenant`: audience and service principal deployment.
- `Public` vs `confidential client`: can securely hold credentials or not.
- `Authorization code + PKCE` vs `client credentials`: user interactive vs app-only.
- `Scopes` vs `roles`: delegated permissions vs app-defined roles/app permissions.
- `Token audience` and `redirect URI` solve different problems.

## Troubleshooting
`Supported audience → App/service principal → Redirect URI → Client type/flow → Credentials → API permissions/consent → Token audience/claims → Role assignment → Sign-in logs`

## Check understanding
1. Why does a multitenant app need a service principal in a customer's tenant?
2. Why should a SPA not store a client secret?
3. How do roles and scopes differ in access tokens?

Source: https://learn.microsoft.com/en-us/training/modules/register-apps-use-microsoft-entra-id/
