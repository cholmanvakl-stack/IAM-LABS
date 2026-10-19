# Perform actions on a device using Microsoft Defender for Endpoint

## Main concept
Defender for Endpoint response actions allow authorized analysts to contain threats and collect evidence remotely.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/perform-actions-device-microsoft-defender-for-endpoint/

## Core knowledge
- Device isolation and containment considerations
- antivirus scan
- investigation package collection
- live response sessions
- authorization and auditability

## How concepts connect
Investigation identifies risk; device actions contain activity or collect evidence; verification confirms the action completed and the threat is addressed.

## SC-200 exam decisions
Choose isolation versus scan versus investigation package versus live response; understand access requirements and potential operational impact.

## Troubleshooting
Check analyst permissions → device support/connectivity → action eligibility → request status → collected evidence → containment verification.

## Check understanding
1. When is device isolation preferable to running a scan, and what should be validated afterward?
2. Which Defender portal page, setting, or endpoint artifact would you examine first, and why?
3. How would you validate the result before closing the case?

**Study tip:** Think `source → scope → sensor/engine → evidence → response → verification`. Only perform response actions on systems you administer or are authorized to investigate.
