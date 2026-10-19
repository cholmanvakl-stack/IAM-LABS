# 03 — Implement App Registration

## Main concept
`Register an app identity → Define authentication and permissions → Obtain consent → Authorize users and workloads → Govern access.`

An application registration describes how software uses Entra as an identity provider. It is not automatically permission to read data.

## Plan a line-of-business registration
- Identify `client application` (requests tokens) and `resource/API` (accepts access tokens).
- Decide supported account audience: `single tenant` or `multitenant` (and personal Microsoft accounts where relevant).
- Identify platform: web, SPA, mobile/desktop, daemon/service.
- Choose `redirect URI`, token flow, public/confidential client type and credential strategy.
- Use managed identities or federated credentials where supported instead of long-lived client secrets.

**How they connect:** App type and identity model determine how it authenticates and what permissions it needs.

## Register an application
- `Application (client) ID`: identifies the application registration.
- `Directory (tenant) ID`: identifies the tenant.
- `Application object`: home-tenant blueprint of the app.
- `Service principal`: app's identity instance in a tenant, shown under Enterprise applications.
- `Redirect URI`: registered destination for returning an authorization response; mismatches cause authentication errors.
- `Client secret/certificate/federated credential`: confidential-client authentication choices; protect secrets and rotate credentials.

**How they connect:** Registration defines the app; a service principal represents it locally; credentials prove the calling app's identity.

## Configure API permissions
- `Delegated permissions (scopes)`: app acts on behalf of a signed-in user; effective access is limited by both the user's rights and the granted scopes.
- `Application permissions (app roles)`: app acts without a user in app-only scenarios, with tenant-approved permissions.
- `Consent`: authorizes requested permissions; some permissions require admin consent.
- `Least privilege`: request only necessary scopes/roles and review grants regularly.
- API permissions configured in a registration are `requested`; access depends on actual grants and tokens.

**How they connect:** App requests permission → user/admin grants consent → token includes authorized scopes/roles → API enforces them.

## Multi-tier applications
- `Frontend`: authenticates the user and requests a token for the middle-tier API.
- `Middle-tier API`: validates its access token and, when necessary, obtains a downstream token.
- `On-behalf-of (OBO) flow`: supported delegated flow to call another API for the signed-in user.
- `Audience (aud)`: each access token is intended for a specific API; do not forward a Graph token as if it were your custom API token.
- `Expose an API`: defines scopes/app roles that other applications can request.
- Separate delegated permissions from app-only background jobs.

**How they connect:** Client → token for API A → API A validates → OBO token for API B → API B authorizes.

## Application authorization
- `App roles`: application-defined permissions such as Reader/Approver/Admin, assignable to supported users/groups or applications.
- `Scopes`: delegated permissions representing actions an app can perform for a user.
- `Groups claims`: can help app authorization, but group overage and token size matter.
- `Enterprise app assignment`: determines who may access the app if assignment is required; app roles determine what they may do inside it.
- `Admin consent` does not automatically assign every user an application role.

## App governance and monitoring
- Review owners, credentials, API grants, high-privilege permissions and activity.
- Detect unused or overprivileged app identities; investigate suspicious OAuth behavior.
- Monitor service principal sign-ins, audit logs, credential expiry and app governance findings where available.

## SC-300 exam essentials
| Distinction | Remember |
|---|---|
| Application object vs service principal | Definition in home tenant vs tenant-local instance |
| Delegated vs application permission | Signed-in user context vs app-only context |
| Scope vs app role | Delegated API action vs application-defined permission |
| Registration vs consent | Requested access vs granted access |
| Redirect URI vs API audience | Login response destination vs token recipient |
| OBO vs client credentials | User delegation downstream vs app-only workload |

## Troubleshooting
`App registration → Tenant/audience → Redirect URI → Client credential → Requested permission → Consent grant → Token claims/audience → API authorization → Logs`

## Check understanding
1. Why can an app registration request Graph permissions but still receive 403?
2. What flow is appropriate when an API calls Graph for the signed-in user?
3. Why does assigning an app role differ from granting tenant-wide admin consent?

Source: https://learn.microsoft.com/en-us/training/modules/implement-app-registration/
