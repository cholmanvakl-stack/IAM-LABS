# 03 — Plan and Implement Privileged Access

## Main concept
**Replace unnecessary permanent administrator access with eligible, time-limited, controlled privilege activation and emergency recovery procedures.**

**Role scope → Eligible assignment → Activation controls → Just-in-time access → Expiration → Audit**

## Core knowledge

### Privileged access strategy
- `Least privilege`: grant the smallest role and scope needed.
- `Just-in-time (JIT)`: activate privileges only when required.
- `Just-enough administration (JEA)`: constrain the actions/permissions granted.
- `Privileged Identity Management (PIM)`: governs privileged role assignment and activation.
- `Standing access`: persistent privilege that increases risk when not justified.
- Define role scope, approval authority, maximum activation duration, notifications and access review cadence.

### PIM role assignment types
- `Eligible`: user can activate a role after meeting activation requirements; role is not active by default.
- `Active`: role permissions are in effect during the assignment period.
- `Time-bound assignment`: assignment expires according to its schedule.
- `Permanent assignment`: no scheduled end date; avoid permanent active assignments where feasible.
- `Activation requirements`: supported combinations of MFA/authentication context, justification, ticket information and approval.
- `PIM approval`: approval of an activation request, not the same as entitlement management package approval.

### Microsoft Entra roles vs Azure resource roles
| Type | What it controls | Example |
|---|---|---|
| `Microsoft Entra role` | Directory administration | User Administrator |
| `Azure RBAC role` | Azure resource management at scope | Contributor on a resource group |

- PIM supports governance for both, but assignments, role definitions and scope are distinct.
- `Global Administrator` is not the same as `Owner` on an Azure subscription.
- Azure scope follows management group/subscription/resource group/resource hierarchy as supported.
- Use the least privileged built-in role and narrowest appropriate scope.

### Privileged Access Groups
- `Privileged Access Groups (PAG)` let PIM govern eligible/active membership or ownership of supported groups.
- A group's granted role/resource access may then depend on active group membership.
- Distinguish activation of `group membership` from activation of a `directory role`.
- Evaluate nested groups, group type, role-assignable constraints and target-resource behavior before designing.

### Manage requests, history and reports
- Administrators configure eligible/active assignments and role settings.
- Users activate eligible roles through PIM and satisfy the configured checks.
- Approvers evaluate requests; activation is denied or expires if requirements are not met.
- `PIM audit history` records assignments, activations and configuration changes.
- `Alerts/recommendations` can reveal risky standing assignments or configuration.

### Emergency access accounts
- `Emergency access (break-glass) accounts` provide recovery when normal admin access is disrupted.
- Maintain at least two cloud-only emergency accounts with highly privileged access according to Microsoft's guidance; secure credentials and store recovery information separately.
- Design exclusions from blocking Conditional Access controls carefully; monitor every use.
- Test accounts periodically and alert on any sign-in.
- Emergency accounts are not ordinary day-to-day admin identities.

## Exam decision table
| Scenario | Best concept |
|---|---|
| Admin needs role for 2 hours | Eligible PIM role + activation |
| Role activation requires approval | PIM activation policy |
| Admin can manage users but not Azure VMs | Entra directory role, not Azure RBAC |
| Admin needs temporary access via group | PIM for Groups |
| Determine who activated privilege | PIM audit history |
| Tenant lockout during policy failure | Emergency access account |

## Troubleshooting
`Role type → Scope → Eligibility → Activation requirements → Approval → Active status → Token/session refresh → Resource permissions → PIM audit`

## Check understanding
1. Why is eligible assignment safer than permanent active assignment?
2. How do PIM for Entra roles and PIM for Azure resources differ?
3. Why should emergency accounts be monitored even when exempted from some access policies?

Official module: https://learn.microsoft.com/en-us/training/modules/plan-implement-privileged-access/
