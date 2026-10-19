# Introduction to Microsoft Defender XDR threat protection

## Main concept
`Microsoft Defender XDR` correlates security signals across identities, endpoints, email, and cloud applications so analysts can investigate related activity as one incident.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/introduction-microsoft-365-threat-protection/

## Core knowledge
- `XDR versus individual Defender products`
- `unified incident and alert views`
- `cross-domain correlation`
- `security operations center workflow`
- `Microsoft Security Graph`

## How concepts connect
A suspicious sign-in, malicious email, and endpoint alert may describe one attack. Correlate entities, timestamps, evidence, and affected assets rather than treating each alert in isolation.

## SC-200 exam decisions
Which workload generated the evidence? Which incidents and alerts share users, devices, URLs, or IPs? What is the scope of the compromise?

## Troubleshooting
Confirm source workload → telemetry ingestion → alert creation → incident correlation → evidence and entity timeline → analyst disposition.

## Check understanding
1. An endpoint and an identity alert involve the same account. Why investigate them together?
2. Which Defender product or portal view would you start with, and why?
3. What evidence would prove the response worked?

**Study tip:** Explain the answer in terms of `signal → scope → investigation → response → validation`, not just feature definitions.
