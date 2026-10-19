# Protect against threats with Microsoft Defender for Endpoint

## Main concept
`Microsoft Defender for Endpoint` is an endpoint detection and response (EDR) platform that combines prevention, detection, investigation, and response.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/m365-security-threat-protect/

## Core knowledge
- Endpoint protection versus EDR
- device telemetry and security alerts
- hunting threats in the network
- remediation and integration with Defender XDR

## How concepts connect
Endpoint sensors and security controls provide telemetry; detections create alerts; analysts investigate and take appropriate action.

## SC-200 exam decisions
Choose between prevention, hunting, investigation, and response; distinguish endpoint-specific evidence from cross-workload Defender XDR incidents.

## Troubleshooting
Check endpoint onboarded → sensor health → telemetry → alerts → incident correlation → remediation status.

## Check understanding
1. A device appears healthy but suspicious behavior is reported. Which endpoint signals and investigation views would you examine?
2. Which Defender portal page, setting, or endpoint artifact would you examine first, and why?
3. How would you validate the result before closing the case?

**Study tip:** Think `source → scope → sensor/engine → evidence → response → verification`. Only perform response actions on systems you administer or are authorized to investigate.
