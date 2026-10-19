# 01 — Plan and Design the Integration of Enterprise Apps for SSO

## Main concept
`Discover apps → Choose integration → Decide who administers them → Configure SSO → Govern permissions.`

An organization cannot secure applications it does not know about. This module starts with discovering existing app usage and ends with selecting a manageable, least-privilege integration.

## Discover applications
- `Microsoft Defender for Cloud Apps (Defender for Cloud Apps)`: discovers cloud services through supported network/cloud traffic data, identifies shadow IT, and evaluates app risk. Discovery does not automatically integrate apps into Entra.
- `AD FS application activity/report`: identifies applications relying on AD FS, helping prioritize migration to Entra SSO. Review protocol, claims, dependencies, user impact and sign-in activity.
- `App inventory`: capture owner, users, authentication protocol, provisioning method, business criticality, risk and migration readiness.

**How they connect:** Discovery reveals which apps exist; assessment determines how each should be integrated and secured.

## Plan SSO and app access
- `Single sign-on (SSO)`: user authenticates through a trusted identity system to access an application without maintaining an independent password for each app.
- `SAML`: browser federation using signed assertions; common with SaaS gallery integrations.
- `OpenID Connect (OIDC)`: modern authentication built on OAuth 2.0; uses ID tokens.
- `OAuth 2.0`: delegated/authorized API access, not an authentication protocol by itself.
- `Password-based SSO`: Entra can support vaulting/replaying app credentials in supported scenarios; does not give the same federation guarantees as SAML/OIDC.
- `Linked SSO`: exposes an app launch link; authentication occurs at the linked destination.
- `User assignment required`: when enabled for a supported enterprise app, only assigned users/groups may sign in to that app; separate from Conditional Access and the app's internal permissions.
- `Group assignment`: simplifies access management; group-based app assignment and nested group behavior have licensing/feature constraints.

**How they connect:** Authentication protocol establishes sign-in trust; assignments and app authorization decide whether a person may use the application.

## Configure app connectors and integrations
- `Gallery application`: Microsoft-provided integration template, often with SSO/provisioning documentation.
- `Non-gallery enterprise app`: manually configured integration for apps without a suitable gallery template.
- `Connectors`: supported mechanisms for linking services, app discovery, provisioning or on-prem access. Choose by purpose rather than assuming one connector handles every function.
- `SCIM`: standards-based user provisioning for supported SaaS apps; different from SAML SSO.

**How they connect:** SSO authenticates; provisioning creates/updates/removes accounts; a connector may support one or both depending on the app.

## App management roles
- `Global Administrator`: broad directory privileges; rarely necessary for routine app administration.
- `Cloud Application Administrator`: manages many enterprise application and app registration settings, subject to permission-specific limitations.
- `Application Administrator`: manages supported app registrations and enterprise apps, with important differences in credential-related capabilities.
- `Application owner`: can manage supported settings for owned apps, without being a tenant-wide admin.
- `Custom Entra role`: grants selected supported application management permissions, potentially at an application scope.
- Distinguish `directory role` (administer app configuration) from `app role` (what a user or client may do inside the app).

**How they connect:** Role permissions define administrative actions; ownership and supported scope constrain where those actions apply.

## Configure gallery SaaS SSO
1. Add an enterprise application from the gallery.
2. Select the supported SSO method; exchange metadata, entity ID, reply URL and certificates as applicable.
3. Configure app-specific claims and identifiers.
4. Assign a pilot group if assignment is required.
5. Test SP-initiated and/or IdP-initiated flows as supported; validate access in the app.
6. Configure provisioning separately if required and monitor results.

## OAuth app policies and governance
- `OAuth consent grant`: authorizes an application to access specified APIs under delegated or application permission models.
- `Defender for Cloud Apps OAuth app governance`: review app permissions, consent, publisher, activity and risk; investigate or restrict risky apps through supported controls.
- A suspicious app may have valid consent but excessive privileges. Audit granted permissions, app owners and usage before approving continued access.

## SC-300 exam decisions
| Scenario | Main concept |
|---|---|
| Unknown SaaS usage | Defender for Cloud Apps discovery |
| Migrate federation-dependent apps | AD FS app activity/report and protocol assessment |
| Prebuilt SaaS integration | Gallery enterprise app |
| Users sign in but should be blocked unless assigned | Assignment-required setting plus access controls |
| Admin should manage only one app | App ownership or scoped supported custom role |
| Automatically create SaaS accounts | Provisioning/SCIM, not SSO alone |
| Risky third-party OAuth app | Consent review and app governance |

## Troubleshooting
`Discovery → App type/protocol → Metadata/certificates → Assignment → Entra sign-in → Claims → App authorization → Provisioning → Audit logs`

## Check understanding
1. Why does SAML SSO not automatically create an account in every SaaS app?
2. What is the difference between an app role and an Entra application administrator role?
3. How would you identify AD FS applications before migration?

Source: https://learn.microsoft.com/en-us/training/modules/plan-design-integration-of-enterprise-apps-for-sso/
