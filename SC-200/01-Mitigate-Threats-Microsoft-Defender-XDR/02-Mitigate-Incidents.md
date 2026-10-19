# Mitigate incidents using Microsoft Defender

## Main concept
The `Microsoft Defender portal` supports incident triage, investigation, hunting, automated investigation, and response tracking.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/mitigate-incidents-microsoft-365-defender/

## Core knowledge
- `Incidents versus alerts`
- `incident severity/status/assignment`
- `evidence and entities`
- `automated investigation and response`
- `Action center`
- `advanced hunting and KQL`
- `Entra sign-in logs`
- `Secure Score`
- `threat analytics and reports`

## How concepts connect
Start with an incident, validate its alerts and evidence, identify impacted entities, decide containment actions, then document results. Hunting searches raw telemetry for activity that might not have raised an alert.

## SC-200 exam decisions
Differentiate investigation from remediation; know when an automated action requires approval; interpret sign-in activity; use advanced hunting to pivot from an indicator.

## Troubleshooting
Check incident permissions → workload telemetry → alert/incident grouping → automation status → Action center pending/completed actions → outcome.

## Check understanding
1. An incident shows a completed automated investigation but an action remains pending. Where do you check and why?
2. Which Defender product or portal view would you start with, and why?
3. What evidence would prove the response worked?

**Study tip:** Explain the answer in terms of `signal → scope → investigation → response → validation`, not just feature definitions.
