# IAM-LABS PowerShell

PowerShell automation for Microsoft Entra ID and Microsoft Graph administration.

## Structure

- `00-Setup` — modules and connections
- `01-Identity-Administration` — users, groups, licenses, roles
- `02-External-Identities` — guests and cross-tenant reporting
- `03-Authentication-Access` — authentication, Conditional Access, sign-in evidence
- `04-Applications` — enterprise apps, service principals, app registrations
- `05-Governance` — audit, access reviews, privileged access
- `06-Hybrid-Identity` — synchronization/health reporting when hybrid infrastructure exists

## Script standard

Scripts prefer read-only discovery. Change operations are clearly named and parameterized.

Never commit credentials, tokens, secrets, or certificates.

## Graph permissions

Microsoft Entra portal roles and Microsoft Graph API permissions are separate controls. A directory role does not automatically grant every Graph permission.

## Portfolio standard

Every useful script should be:
- reusable
- parameterized
- least-privilege
- readable
- safe to demonstrate in an interview
- tied to a real IAM administrative task
