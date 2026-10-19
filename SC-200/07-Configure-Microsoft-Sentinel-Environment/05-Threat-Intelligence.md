# Utilize threat intelligence in Microsoft Sentinel

## Main concept
`Threat intelligence` adds context about suspicious indicators and adversary activity. Sentinel can manage threat indicators and query them alongside security events.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/utilize-threat-intelligence-azure-sentinel/

## Core knowledge
- Threat intelligence versus raw alerts and telemetry
- Indicator types: IP address, domain, URL, and file hash
- Manage threat indicators in Sentinel and supported Microsoft Defender experiences
- Indicator confidence, validity, expiration, and false positives
- Use KQL to access threat indicator data and correlate with activity
- Apply indicators to investigation and threat detection without assuming a match proves compromise

## How concepts connect
Threat intelligence identifies potentially suspicious artifacts; security telemetry reveals whether those artifacts appeared in the environment; correlation and context guide investigation.

## SC-200 exam decisions
Distinguish indicator management from observed events; verify indicator age, confidence, and context before escalating or blocking.

## Troubleshooting
Check intelligence source → indicator ingestion → indicator status/expiry → relevant TI table/schema → telemetry join key → event timing → investigation.

## Check understanding
1. Why is a threat indicator match not necessarily proof of compromise?
2. What could explain why a known indicator is missing from a query?
3. How can an analyst reduce false positives from stale indicators?

**Study tip:** Work through `source → scope → connector/workspace → data → detection/investigation → result`. Verify permissions and ingestion before assuming a missing alert means no suspicious activity.
