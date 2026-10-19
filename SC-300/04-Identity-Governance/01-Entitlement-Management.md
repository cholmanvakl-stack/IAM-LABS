# 01 — Plan and Implement Entitlement Management

## Main concept
**Provide the right access to the right people through a controlled request, approval, assignment, expiration, and removal process.**

**Catalog → Access package → Policy → Request and approval → Assignment → Expiration and lifecycle**

## Core knowledge

### Catalogs and resources
- `Entitlement management` is an Entra ID Governance capability that automates access lifecycle processes for internal and external users.
- `Catalog` is a governed collection of resources and access packages, with delegated catalog owners.
- `Resources` may include supported groups, applications and SharePoint Online sites. The exact resource roles are configured in the access package.
- `Resource role` specifies the level of access granted for a particular resource.
- `Access package` bundles one or more resource roles into a requestable assignment. One package can grant several resources together.

**How they connect:** Catalog organizes resources → access package defines the bundle → assignment grants resource roles.

### Access package policies
- `Request policy` controls who can request a package: supported internal users, connected organizations, or eligible external users.
- `Approval` defines approvers, stages, justification, deadlines and escalation/alternate handling as supported.
- `Assignment duration` sets expiration; policies may allow extension or renewal.
- `Direct assignment` can be used by authorized administrators where appropriate.
- `Separation of duties` can be supported by policy and incompatible access-package configuration, depending on feature support.
- `Automatic assignment` policies can grant or remove package assignments based on supported user attribute rules.
- `Lifecycle workflows` complement entitlement management for joiner/mover/leaver automation; they are not identical to access packages.

**How they connect:** Policy decides eligibility, approval and duration; the assignment engine provisions and later removes access.

### Terms of use
- `Terms of use` requires acceptance of organizational terms before access under supported Conditional Access policy enforcement.
- Acceptance records and reports provide evidence of who accepted and when.
- Terms of use are not a replacement for authorization, access reviews or approval workflows.

### External user lifecycle
- `Connected organization` identifies an external organization whose users may be eligible to request access.
- An eligible external user can be invited through a supported access package request process.
- `Guest lifecycle settings` can govern removal of external users after they lose their final access package assignment, subject to configured policy and other considerations.
- External identities may have access outside entitlement management; inspect other assignments before assuming package expiration removes every permission.
- `Per-user entitlements` show a user's access package assignments and help investigate why access exists.

## Exam decision table
| Scenario | Best concept |
|---|---|
| New contractors need several resources together | Access package |
| Department delegates who manages access bundles | Catalog ownership |
| Manager approval required for requests | Access package policy |
| Contractor access must expire | Assignment expiration |
| Partner employees should request access | Connected organizations + external user policy |
| User must accept legal terms | Terms of use + Conditional Access |
| Determine why a user has packaged access | Per-user entitlements and assignments |

## Troubleshooting
`Requester eligibility → Catalog/resource → Package policy → Approval → Assignment state → Provisioning result → Expiration/removal → Audit`

Typical causes: requester not in allowed scope; wrong approver; unavailable resource role; failed assignment; conflicting external lifecycle settings.

## Check understanding
1. What is the difference between a catalog and an access package?
2. Which configuration decides who can request and who must approve?
3. Why might an expired package not eliminate all access held by a guest?

Official module: https://learn.microsoft.com/en-us/training/modules/plan-implement-entitlement-management/
