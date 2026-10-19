# Investigate and respond to Microsoft Purview Data Loss Prevention alerts

## Main concept
`Microsoft Purview Data Loss Prevention (DLP)` identifies sensitive-data handling that matches configured policies; analysts investigate related alerts in Purview and Microsoft Defender XDR, respond, and document findings.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/purview-data-loss-prevention-alerts/

## Core knowledge
- DLP alerts, policy matches, matched events and alert lifecycle
- DLP policy configuration and alert generation
- Investigate DLP alerts in Purview and Defender XDR
- Security Copilot and AI-assisted DLP investigations
- Remediation, incident status, assignment, ownership and documentation
- Policy tuning after investigation

## How concepts connect
`Sensitive information` and `DLP policies` define what to protect; policy matches create alerts; investigation reconstructs who did what with the data; remediation and policy tuning close the loop.

## SC-200 exam decisions
Choose Purview for detailed DLP evidence and policy context, Defender XDR for correlated security incidents; distinguish policy alert from confirmed data exfiltration; choose appropriate response and ownership.

## Troubleshooting
Verify data location and policy scope → rule conditions and alert settings → matching activity → alert/incident correlation → remediation status → documentation and tuning.

## Check understanding
1. A DLP alert fires after a file is shared externally. What would establish whether sensitive data was actually exposed?
2. When should an analyst review DLP policy conditions instead of simply closing repeated alerts?
3. Where would you inspect correlated incident context for a DLP event?

**Study tip:** Explain scenarios using `source → scope → evidence → investigation → decision → remediation or case action → validation`. Follow organizational authorization and privacy requirements.
