# Secure your cloud apps and services with Microsoft Defender for Cloud Apps

## Main concept
`Microsoft Defender for Cloud Apps` provides cloud application visibility, threat detection, data controls, and session-aware enforcement.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/microsoft-cloud-app-security/

## Core knowledge
- `Cloud Discovery`
- `sanctioned and unsanctioned apps`
- `cloud app governance`
- `Conditional Access App Control`
- `session policies`
- `sensitive information protection`
- `anomaly detection`

## How concepts connect
Discovery identifies cloud usage; governance evaluates app risk; access/session policies control behavior; detections help analysts investigate suspicious cloud activity.

## SC-200 exam decisions
Distinguish discovery from enforcement; identify when session controls apply; know the role of Conditional Access and connected app telemetry.

## Troubleshooting
Check discovery/log source → app connector and scope → Conditional Access routing → session policy → alerts and activity → outcome.

## Check understanding
1. A cloud application appears in discovery but session controls are not applied. Which dependencies would you check?
2. Which Defender product or portal view would you start with, and why?
3. What evidence would prove the response worked?

**Study tip:** Explain the answer in terms of `signal → scope → investigation → response → validation`, not just feature definitions.
