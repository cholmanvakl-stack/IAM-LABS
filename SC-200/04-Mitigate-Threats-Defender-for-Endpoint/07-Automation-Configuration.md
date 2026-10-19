# Configure and manage automation using Microsoft Defender for Endpoint

## Main concept
`Automated investigation and remediation (AIR)` can investigate alerts and carry out or propose response actions according to configured automation settings.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/configure-manage-automation-microsoft-defender-for-endpoint/

## Core knowledge
- Advanced Defender for Endpoint features
- automated sample submission and folder settings
- automated investigation and remediation levels
- device-group automation
- blocking at-risk devices

## How concepts connect
Automation accelerates repetitive investigations, but scope, confidence, permissions, and approval settings govern safe remediation.

## SC-200 exam decisions
Distinguish full from semi-automated remediation; recognize actions pending approval; understand device-group scoping and operational impact.

## Troubleshooting
Check advanced features → automation level and device group → investigation state → Action center approvals → remediation result.

## Check understanding
1. An automated investigation finishes but a threat remains. What settings and pending actions would you inspect?
2. Which Defender portal page, setting, or endpoint artifact would you examine first, and why?
3. How would you validate the result before closing the case?

**Study tip:** Think `source → scope → sensor/engine → evidence → response → verification`. Only perform response actions on systems you administer or are authorized to investigate.
