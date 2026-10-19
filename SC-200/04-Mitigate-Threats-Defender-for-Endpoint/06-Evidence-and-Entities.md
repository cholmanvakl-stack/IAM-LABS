# Perform evidence and entities investigations using Microsoft Defender for Endpoint

## Main concept
`Evidence and entities` investigation pivots between files, accounts, IP addresses, and domains to establish relationships and attack scope.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/perform-evidence-entities-investigations-microsoft-defender-for-endpoint/

## Core knowledge
- File investigation and hashes
- user-account investigation
- IP-address investigation
- domain investigation
- prevalence and related alerts

## How concepts connect
One indicator alone is rarely sufficient; pivot across artifacts, devices, users, and timestamps to build a corroborated incident picture.

## SC-200 exam decisions
Choose appropriate artifact investigation views; distinguish suspicious indicator reputation from proven compromise; assess prevalence and impact.

## Troubleshooting
Check artifact identity → event timestamp → related alerts → prevalence and context → associated users/devices → response decision.

## Check understanding
1. A suspicious file hash appears on several devices. What other evidence would you collect before blocking it?
2. Which Defender portal page, setting, or endpoint artifact would you examine first, and why?
3. How would you validate the result before closing the case?

**Study tip:** Think `source → scope → sensor/engine → evidence → response → verification`. Only perform response actions on systems you administer or are authorized to investigate.
