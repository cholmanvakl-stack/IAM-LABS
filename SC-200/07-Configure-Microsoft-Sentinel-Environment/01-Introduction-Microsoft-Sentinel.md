# Introduction to Microsoft Sentinel

## Main concept
`Microsoft Sentinel` is a cloud-native SIEM and SOAR platform for collecting security telemetry, detecting suspicious activity, investigating incidents, hunting threats, and orchestrating response.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/intro-to-azure-sentinel/

## Core knowledge
- SIEM versus SOAR: monitoring and correlation versus orchestrated response
- Microsoft Sentinel architecture: data connectors, Log Analytics, analytics rules, incidents, hunting, workbooks, automation
- Cloud and on-premises security data sources
- When to use Microsoft Sentinel versus Microsoft Defender solutions
- Security operations workflow from data ingestion to investigation and response

## How concepts connect
Defender products generate workload-specific signals; Sentinel aggregates signals across sources, runs detections, and supports broader SOC workflows.

## SC-200 exam decisions
Choose Sentinel when the scenario requires multi-source SIEM analytics, hunting, correlation, or SOAR; choose workload-specific Defender controls when the task is protection or response within that product.

## Troubleshooting
Check source system → data connector → Log Analytics workspace → ingested events → analytics rule → incident → response workflow.

## Check understanding
1. Why does a SOC use both Microsoft Sentinel and Microsoft Defender XDR?
2. What must exist before an analytics rule can reliably detect suspicious activity?
3. Which Sentinel feature supports orchestrated response?

**Study tip:** Work through `source → scope → connector/workspace → data → detection/investigation → result`. Verify permissions and ingestion before assuming a missing alert means no suspicious activity.
