# 04 — Manage Microsoft Entra Identity Protection

## Main concept
`Identity Protection detects suspicious identity behavior, assigns risk, and enables investigation and risk-based response.` Risk is a signal; Conditional Access and remediation act on it.

### Understand identity risk
- `Sign-in risk:` probability a particular sign-in is unauthorized.
- `User risk:` probability an identity/account is compromised.
- Risk detections may involve suspicious IP, unfamiliar properties, leaked credentials, or other supported signals.
- Risk levels are typically `low, medium, high`; detections, detail, and automated response depend on licensing.
`How they connect:` Signals → risk detection → risk level → policy decision → remediation/investigation.

### User risk policy
- Targets identities assessed as compromised, not just a single suspicious sign-in.
- Supported remediation can require secure password change or other supported remediation through risk-based CA.
- Requires compatible registration/authentication and suitable licensing.
`How they connect:` User risk represents account-level concern and should trigger account recovery/investigation.

### Sign-in risk policy
- Evaluates the current authentication attempt.
- Common response: require MFA or stronger authentication based on risk level, or block when necessary.
- Prefer current risk-based Conditional Access policy patterns where available; know legacy Identity Protection policy terminology.
`How they connect:` Sign-in risk can challenge a suspicious attempt without treating every future sign-in as compromised.

### MFA registration policy
- Encourages/requires users in scope to register methods for MFA under supported settings.
- Registration readiness is distinct from enforcing MFA on a particular resource.
`How they connect:` Users need a registered method before they can satisfy many risk-based challenges.

### Investigate risky users and sign-ins
1. Review risky users, risky sign-ins, and individual detections.
2. Check time, IP, device, app, location, and authentication details.
3. Correlate sign-in/audit logs and other security telemetry.
4. Confirm compromise, dismiss false positives where justified, or require remediation.
5. Revoke sessions/reset credentials or disable accounts when incident response requires.
6. Document disposition and verify the risk state after remediation.
`How they connect:` Detection is not proof; investigation determines the correct response.

### Workload identity protection
- Service principals and managed identities are nonhuman identities with distinct credentials and risk surfaces.
- Protect app credentials, permissions, owners, and workload sign-ins; use workload identity risk capabilities where supported.
- User MFA challenges do not apply directly to unattended workloads.
`How they connect:` Risk management covers both human and nonhuman identities but uses different controls.

### Microsoft Defender for Identity
- Security detection and investigation focused on identity threats, especially signals from on-premises AD and hybrid environments.
- Complements Entra Identity Protection; not the same product or identical detection source.
`How they connect:` Hybrid identity telemetry broadens visibility beyond cloud sign-ins.

### Identity Risk Management Agent
- Agent-assisted risk investigation/remediation capabilities may be preview or license-dependent.
- Treat suggested actions as decision support requiring review and proper authorization.
`How they connect:` Automation can speed investigation, but risk decisions need evidence and governance.

## SC-300 exam essentials
- `Sign-in risk vs user risk:` event-specific vs account compromise likelihood.
- `Risk detection vs risk policy:` signal vs enforcement.
- `MFA registration vs risk challenge:` preparation vs runtime response.
- `Dismiss vs remediate:` false positive handling vs account recovery.
- `Defender for Identity vs Entra Identity Protection:` on-prem/hybrid threat detection vs Entra identity risk.

## Troubleshooting
`Detection → Risk level → Policy targeting → Registration/methods → CA result → Sign-in logs → Investigation → Remediation → Risk status`

## Check understanding
1. When would you use sign-in risk rather than user risk?
2. Why should a risky-user alert be investigated before being dismissed?
3. Why can't you protect a service principal by prompting it for MFA?

Source: https://learn.microsoft.com/en-us/training/modules/manage-azure-active-directory-identity-protection/
