# 02 — Implement and Monitor the Integration of Enterprise Apps for SSO

## Main concept
`Configure trust → Control consent → Connect the app → Provision users → Monitor sign-in and lifecycle.`

Successful app integration requires both an authentication path and the right application authorization/provisioning configuration.

## Token customization
- `ID token`: OIDC token containing identity claims for the client application.
- `Access token`: authorizes access to an API; its audience is the resource API, not necessarily the client.
- `Claims`: statements such as user ID, name, groups, roles, tenant or custom attributes.
- `SAML assertion`: signed authentication/attribute statement used in SAML federation.
- Configure supported optional claims, claims mapping, group claims and app roles based on app requirements.
- Avoid assuming that every claim can be customized or that tokens are identical across protocols.
- Large group memberships may cause `group overage`; design app authorization appropriately.

**How they connect:** Entra authenticates the principal, issues a token/assertion, and the application interprets its claims to establish identity and permissions.

## Consent settings
- `User consent`: a user approves eligible delegated permissions under tenant policy.
- `Admin consent`: authorized administrator approves permissions on behalf of the organization, when appropriate.
- `Admin consent workflow`: users request review when they cannot grant required permissions.
- `Verified publisher`: useful trust signal, not proof that all requested permissions are safe.
- `Permission grant` is different from `user assignment`: one authorizes API access, the other governs app sign-in.

**How they connect:** Consent controls what data/API actions the app can perform; assignment controls who can access the app.

## Application Proxy for on-premises apps
- `Microsoft Entra application proxy`: publishes supported on-premises web apps through an outbound connector model without directly exposing inbound application ports.
- `Private network connector`: reaches the internal application; deploy resilient connector groups for production.
- `External URL`: user-facing published endpoint; `Internal URL`: destination reachable from the connector.
- `Preauthentication`: Entra authentication before traffic reaches the internal app, or passthrough where supported and appropriate.
- `Kerberos Constrained Delegation (KCD)`: supports integrated Windows authentication SSO in suitable deployments.
- Troubleshoot DNS, TLS, connector health, SPNs/delegation, internal URL and authorization separately.

**How they connect:** User → Entra preauthentication → proxy service → connector → on-prem app.

## Integrate custom SaaS SSO
- Add non-gallery enterprise app where necessary.
- Select supported SAML/OIDC integration, configure reply/redirect URLs, issuer, identifier, signing certificate and claims.
- Validate app-side configuration; SSO settings in Entra alone do not ensure the SaaS app accepts tokens.
- Manage signing certificate expiration and rotation.

## Application-based user provisioning
- `Provisioning`: automated creation, update, disable/deprovision of users/groups in a target app.
- `SCIM`: common standard used by SaaS apps for lifecycle provisioning.
- `Mappings`: translate source attributes to target fields.
- `Scope`: assigned users/groups or another supported filter; only in-scope users are provisioned.
- `Provision on demand`: tests a particular user where supported; provisioning logs explain failures.
- SSO can succeed while provisioning fails, or vice versa.

**How they connect:** Assignment/scope → provisioning engine → attribute mappings → SaaS account; SSO is a separate sign-in process.

## Monitor and audit application access
- `Sign-in logs`: who tried to sign in, app, Conditional Access result, authentication method and errors.
- `Audit logs`: changes to app settings, consent, assignments and credentials.
- `Provisioning logs`: account creation/update/removal and mapping errors.
- `Enterprise app usage`: review activity and unused apps/credentials where supported.
- `Application collections`: organize enterprise apps for user-facing access experiences where supported.

## SC-300 exam decisions
| Symptom | Check first |
|---|---|
| User authenticated but app rejects token | Audience, issuer, claims, signature, app-side trust |
| Consent prompt blocked | Consent policy, required permission, admin workflow |
| Published on-prem app unreachable | Connector health, DNS, internal URL, TLS |
| User not created in SaaS | Provisioning scope, mapping, target API, logs |
| Sign-in works but no app permission | App roles/group assignments and app authorization |
| Need change history | Audit logs; not only sign-in logs |

## Troubleshooting
`User/assignment → Consent → Protocol/claims → App Proxy/connector → App-side trust → Provisioning engine → Target result → Sign-in/audit/provisioning logs`

## Check understanding
1. Why is a successful SSO sign-in insufficient evidence that provisioning worked?
2. When would you use KCD with Application Proxy?
3. What is the difference between admin consent and user assignment?

Source: https://learn.microsoft.com/en-us/training/modules/implement-monitor-integration-of-enterprise-apps-for-sso/
