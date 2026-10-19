# Safeguard your environment with Microsoft Defender for Identity

## Main concept
`Microsoft Defender for Identity` analyzes identity infrastructure signals to identify suspicious activity and identity attacks, especially in hybrid environments.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/m365-threat-safeguard/

## Core knowledge
- `Defender for Identity sensors`
- `domain controller telemetry`
- `suspicious identity activity`
- `compromised accounts`
- `lateral movement indicators`
- `integration with Defender XDR`

## How concepts connect
Directory signals add identity context to XDR incidents. Sensor health and coverage determine what the analyst can see.

## SC-200 exam decisions
Differentiate Defender for Identity from Entra ID Protection; understand sensor deployment and health; investigate identity attack alerts in context.

## Troubleshooting
Check directory/source → sensor deployment and health → telemetry/alerts → correlated incidents → affected accounts → remediation.

## Check understanding
1. An expected identity alert never appears. What sensor and telemetry checks come before concluding there was no attack?
2. Which Defender product or portal view would you start with, and why?
3. What evidence would prove the response worked?

**Study tip:** Explain the answer in terms of `signal → scope → investigation → response → validation`, not just feature definitions.
