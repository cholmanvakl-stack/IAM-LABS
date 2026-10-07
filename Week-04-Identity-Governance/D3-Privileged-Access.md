# Week 4 Day 3 — Plan and Implement Privileged Access

## Microsoft Learn Alignment

**Module:** Plan and implement privileged access

### Privileged Access Strategy

**Privileged access** → Access capable of making high-impact administrative or security changes.

Principles:

- least privilege
- just-in-time access
- separation of duties
- approval
- monitoring

**How they connect:** Privileged access strategy reduces the risk created by powerful administrative permissions.

### Privileged Identity Management

**Microsoft Entra PIM** → Controls and monitors privileged access to Microsoft Entra roles and Azure resources.

Capabilities include:

- eligible access
- activation
- approval
- MFA
- time limits
- notifications
- audit history

**How they connect:** PIM reduces standing privileged access.

### PIM for Microsoft Entra Roles

Use PIM to make administrative roles:

- eligible instead of permanently active
- activated only when needed
- time-bound
- auditable

### PIM for Azure Resources

PIM can also manage privileged Azure resource roles.

**How they connect:** PIM applies just-in-time principles to both directory and Azure resource administration.

### Privileged Access Groups

**Privileged Access Group** → Group that can provide controlled access to privileged permissions.

Use governance and activation controls around membership.

### PIM Audit History

**PIM audit history** → Evidence of privileged role changes and activations.

Use it to investigate:

- who activated access
- when
- which role
- duration
- approval

### Emergency Access / Break-Glass Accounts

**Emergency access account** → Highly protected account used when normal administrative access is unavailable.

Best practices:

- keep credentials protected
- monitor usage
- limit use to emergencies
- test recovery procedures

## Troubleshooting

**Role → Eligibility → Activation → MFA/Approval → Scope → Action → Audit**

## Scenario

A help desk administrator needs Global Administrator access for only one emergency task.

Prefer:

**PIM eligible access + activation controls**

instead of permanent Global Administrator assignment.

## Interview Skill

Strong answer:

> I reduce standing privilege by using PIM eligibility, time-bound activation, MFA, approval where appropriate, and audit monitoring.
