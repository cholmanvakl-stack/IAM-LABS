# Learning Path 03 — Implement Access Management for Apps

## Main concept
`Discover applications → Integrate SSO → Define permissions → Assign access → Provision users → Monitor and govern`

Official learning path: https://learn.microsoft.com/en-us/training/paths/implement-access-management-for-apps/

## Four modules
1. [Plan and design enterprise app SSO integration](01-Plan-Enterprise-App-SSO.md)
2. [Implement and monitor enterprise app SSO](02-Implement-Monitor-Enterprise-App-SSO.md)
3. [Implement app registration](03-Implement-App-Registration.md)
4. [Register apps using Microsoft Entra ID](04-Register-Apps-Entra-ID.md)

## The mental model
`App registration` describes an application's identity configuration. `Service principal` is its local identity instance in a tenant. `Enterprise application` is the administration surface for that service principal. `SSO` authenticates a user to an application; `assignment` and app authorization determine who can use it; `API permissions and consent` govern what an application can access.

All four documents focus on core ideas, how features connect, SC-300 decisions, troubleshooting and knowledge checks.
