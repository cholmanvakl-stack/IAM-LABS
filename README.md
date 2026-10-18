# IAM-LABS — SC-300 Identity Management

## Main idea
**Identity and Access Management (IAM) answers four questions: Who are you? How do we recognize you? What can you access? How is that access managed over time?**

Microsoft Entra ID is the cloud identity platform. This first learning path teaches how to establish the directory, manage internal identities, collaborate with external identities, and connect on-premises Active Directory.

## Learning path 01 — Implement an identity management solution

1. [01 — Initial Microsoft Entra Configuration](01-Initial-Entra-Configuration.md)
2. [02 — Create, Configure, and Manage Identities](02-Manage-Identities.md)
3. [03 — Implement and Manage External Identities](03-External-Identities.md)
4. [04 — Implement and Manage Hybrid Identity](04-Hybrid-Identity.md)

## Study method
For every concept, learn **what it is → why it exists → how it works → when to use it → how it connects**. Focus on decisions, scope, permissions, and troubleshooting rather than memorizing portal clicks.

## Core mental model
**Tenant → Identity → Attributes → Group/Role → Authentication → Authorization → Resource → Audit/Lifecycle**

- **Tenant:** boundary for identities, configuration, and policies.
- **Identity:** user, guest, device, or workload principal.
- **Attributes:** facts describing an identity.
- **Group/role:** organizes access or administrative permissions.
- **Authentication:** proves identity.
- **Authorization:** decides permitted actions.
- **Resource:** what is accessed.
- **Lifecycle/audit:** access changes, expires, and is reviewed.

## Source
[Microsoft Learn — Implement an identity management solution](https://learn.microsoft.com/en-us/training/paths/implement-identity-management-solution/)

> Scope: concise but conceptually complete study notes for the four Microsoft Learn modules. No labs or PowerShell in this clean restart.
