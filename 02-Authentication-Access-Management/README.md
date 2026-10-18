# Learning Path 02 — Authentication and Access Management

## Main concept
**An identity is not enough: verify who is signing in, evaluate risk and context, apply access policies, and grant only necessary permissions.**

**Identity → Authentication method → Sign-in signals → Conditional Access → Risk response → Resource authorization → Monitoring**

Official path: https://learn.microsoft.com/en-us/training/paths/implement-authentication-access-management-solution/

## The mental model

`Authentication methods` establish how users prove their identities, while `MFA` adds additional verification. `Conditional Access` evaluates sign-in context and applies policies that determine the requirements for accessing resources. `Identity Protection` identifies risky users and sign-ins and supports risk-based responses. `Azure RBAC` determines which actions an identity can perform on Azure resources at a defined scope. `Global Secure Access` extends identity-aware controls to supported network access scenarios. Authentication verifies identity; authorization determines permitted actions.

## How these modules connect

- `Multifactor authentication (MFA)` strengthens identity verification beyond passwords.
- `User authentication` manages authentication methods, passwordless sign-in, and self-service recovery.
- `Conditional Access` evaluates users, devices, locations, applications, and risk signals to enforce access requirements.
- `Identity Protection` detects and responds to risky users and sign-ins.
- `Azure resource access management` determines which authorized identities can perform actions on Azure resources through roles and scopes.
- `Global Secure Access` extends identity-aware access controls to supported internet and private network traffic.

Together: **Authentication methods → Access policy → Risk response → Resource authorization → Secure network access.**

Each module follows: Main concept → Core knowledge → How concepts connect → SC-300 exam decisions → Troubleshooting → Check understanding.

## Modules
1. [01 — Secure users with MFA](01-Multifactor-Authentication.md)
2. [02 — Manage user authentication](02-User-Authentication.md)
3. [03 — Conditional Access](03-Conditional-Access.md)
4. [04 — Identity Protection](04-Identity-Protection.md)
5. [05 — Azure resource access management](05-Azure-Resource-Access.md)
6. [06 — Global Secure Access](06-Global-Secure-Access.md)

