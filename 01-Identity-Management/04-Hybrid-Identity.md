# 04 — Implement and Manage Hybrid Identity

## Main concept
**Connect on-premises Active Directory identities to Microsoft Entra ID while distinguishing synchronization from authentication.** Synchronizing an identity does not by itself determine how that user signs in.

### Hybrid identity
- <span style="color:#58a6ff"><strong>On-premises AD DS:</strong></span> local directory and, commonly, authoritative source for synced user attributes.
- <span style="color:#58a6ff"><strong>Microsoft Entra ID:</strong></span> cloud directory and identity control plane.
- <span style="color:#58a6ff"><strong>Hybrid identity:</strong></span> the same workforce identity is represented across on-prem and cloud environments.
- <span style="color:#58a6ff"><strong>Source of authority:</strong></span> determines where supported attributes must be changed.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> AD object → sync scope and mapping → cloud identity → authentication method → cloud resource access.

### Microsoft Entra Connect Sync
- Traditional synchronization engine installed on a supported server.
- Synchronizes selected objects/attributes from AD to Entra using configured connectors, rules, and scope.
- Common concepts: connector space, metaverse, import, synchronization, export, scheduler, OU filtering, attribute filtering, matching.
- Not every attribute or writeback scenario is supported.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Source AD → connector/import → synchronization rules → export to Entra.

### Microsoft Entra Cloud Sync
- Cloud-managed synchronization configuration with lightweight on-prem provisioning agents.
- Compare supported capabilities and topology with Connect Sync before selecting.
- Not simply another authentication method.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Cloud orchestration + on-prem agent → directory provisioning/synchronization.

### Password Hash Synchronization (PHS)
- Synchronizes a derived hash of the on-prem password hash to Entra; <span style="color:#58a6ff"><strong>not</strong></span> plaintext passwords.
- Entra performs cloud authentication for supported sign-ins.
- On-prem AD availability is generally not required at every cloud sign-in.
- Password changes must synchronize; sync failures can cause cloud password mismatch.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> AD password change → hash synchronization → Entra cloud authentication.

### Pass-through Authentication (PTA)
- Entra receives cloud sign-in request and validates password through on-prem PTA agents against AD.
- Requires healthy agents and connectivity to on-prem AD for password validation.
- Deploy multiple agents for resilience.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Cloud sign-in → Entra → PTA agent → AD password validation → result.

### Federation
- A trusted federation provider such as AD FS performs authentication in a federated domain.
- Adds infrastructure and certificate/trust dependencies.
- Understand migration from federation to managed authentication (PHS/PTA), including staged rollout where supported.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Cloud app → Entra → federation redirect → IdP authentication → token/trust validation.

### Seamless Single Sign-On
- Improves sign-in experience for supported domain-joined devices on corporate networks.
- Uses Kerberos-based mechanisms under supported conditions.
- Not itself PHS, PTA, or federation; it complements compatible managed authentication approaches.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Device/network context + Seamless SSO → fewer prompts; underlying authentication still matters.

### Compare the mechanisms
| Mechanism | Primary job | Key dependency |
|---|---|---|
| Connect Sync | Synchronize identities | Sync server/configuration |
| Cloud Sync | Synchronize identities | Provisioning agents/cloud configuration |
| PHS | Authenticate in cloud | Synced password hash |
| PTA | Validate passwords on-prem | Healthy PTA agents and AD |
| Federation | Delegate authentication | Federation provider/trust |
| Seamless SSO | Improve sign-in experience | Supported Kerberos/device/network configuration |
| Connect Health | Monitor hybrid identity | Monitoring configuration/agents |

### Synchronization troubleshooting
- <span style="color:#58a6ff"><strong>Source:</strong></span> verify AD object exists, enabled state, attributes.
- <span style="color:#58a6ff"><strong>Scope:</strong></span> OU/group/attribute filtering; accidental exclusion.
- <span style="color:#58a6ff"><strong>Engine/agent:</strong></span> service status, scheduler, provisioning agent health.
- <span style="color:#58a6ff"><strong>Errors:</strong></span> duplicate UPN/proxyAddresses, attribute conflicts, permission/export errors.
- <span style="color:#58a6ff"><strong>Connectivity:</strong></span> DNS, TLS, proxy, required endpoints, AD reachability.
- <span style="color:#58a6ff"><strong>Target:</strong></span> verify Entra object, source match, updated attributes, provisioning status.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Every stage must succeed for source changes to reach the cloud.

### Microsoft Entra Connect Health
- Monitoring for supported hybrid components such as sync, AD FS, and AD DS.
- Use health alerts, performance/usage information, and agent status to identify issues.
- Health monitoring is <span style="color:#58a6ff"><strong>not</strong></span> the sync engine and does not itself repair every failure.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Monitoring provides evidence about sync/auth infrastructure so admins can diagnose root cause.

## Exam essentials
- <span style="color:#58a6ff"><strong>Sync vs authentication vs SSO:</strong></span> three different jobs.
- <span style="color:#58a6ff"><strong>PHS vs PTA vs federation:</strong></span> cloud hash validation vs on-prem agent validation vs external federation provider.
- <span style="color:#58a6ff"><strong>Connect Sync vs Cloud Sync:</strong></span> choose based on required capabilities and topology.
- <span style="color:#58a6ff"><strong>Duplicate attribute errors:</strong></span> check UPN/proxyAddresses and matching.
- <span style="color:#58a6ff"><strong>Cloud password mismatch:</strong></span> check password sync and auth method before resetting randomly.
- <span style="color:#58a6ff"><strong>PTA outage:</strong></span> agent/AD/connectivity; <span style="color:#58a6ff"><strong>federation outage:</strong></span> IdP/trust/certificates.

## Troubleshooting
**AD source → Sync scope → Engine/agent → Attribute/matching errors → Connectivity → Entra object → Authentication path → Sign-in result**

## Check understanding
1. If on-prem AD is offline, which managed authentication method is generally more resilient for cloud sign-in?
2. A user is missing from Entra but exists in AD. Which stage do you inspect first?
3. Why does enabling Seamless SSO not replace the need to choose PHS or PTA?

[Microsoft Learn module](https://learn.microsoft.com/en-us/training/modules/implement-manage-hybrid-identity/)
