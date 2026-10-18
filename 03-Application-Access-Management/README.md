# Learning Path 03 — Implement Access Management for Apps

## Main concept
**Manage how applications integrate with Microsoft Entra ID: discover and configure enterprise applications, establish single sign-on, control permissions and consent, register applications, and monitor access.**

**Application discovery → Enterprise app integration → SSO and provisioning → App registration → API permissions and consent → Access governance**

Official learning path: https://learn.microsoft.com/en-us/training/paths/implement-access-management-for-apps/

## How these modules connect

- `Plan enterprise app SSO` identifies applications, selects integration methods, and establishes administrative ownership and access requirements.
- `Implement and monitor enterprise app SSO` configures authentication trust, consent, provisioning, and monitoring for application access.
- `Implement app registration` defines application identities, API permissions, consent, and authorization for custom and line-of-business applications.
- `Register apps using Microsoft Entra ID` applies the application object, service principal, tenant audience, authentication flow, and app-role concepts in practice.

Together: **Application discovery → SSO integration → Provisioning and monitoring → App registration → API permissions and authorization.**

Each module follows: Main concept → Core knowledge → How concepts connect → SC-300 exam decisions → Troubleshooting → Check understanding.

## Modules
1. [Plan and design enterprise app SSO integration](01-Plan-Enterprise-App-SSO.md)
2. [Implement and monitor enterprise app SSO](02-Implement-Monitor-Enterprise-App-SSO.md)
3. [Implement app registration](03-Implement-App-Registration.md)
4. [Register apps using Microsoft Entra ID](04-Register-Apps-Entra-ID.md)

## The mental model

`App registration` describes an application's identity configuration. `Service principal` is its local identity instance in a tenant. `Enterprise application` is the administration surface for that service principal. `SSO` authenticates a user to an application; `assignment` and app authorization determine who can use it; `API permissions and consent` govern what an application can access.


