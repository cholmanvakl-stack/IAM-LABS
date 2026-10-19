# Integrate Microsoft Defender XDR with Microsoft Sentinel

## Main concept
`Microsoft Defender XDR` and `Microsoft Sentinel` can be integrated to give analysts a unified security operations experience in the Microsoft Defender portal.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/integrate-microsoft-defender-xdr-with-microsoft-sentinel/

## Core knowledge
- Benefits of integrating Defender XDR and Sentinel
- Differences between Sentinel capabilities in Azure and Microsoft Defender portals
- Integration prerequisites and permissions
- Connect/onboard a Sentinel workspace to Defender XDR
- Understand incident, alert, and investigation experiences after integration
- Explore supported Sentinel features in the Defender portal
- Validate connected data and investigate integration issues

## How concepts connect
Defender XDR correlates signals from Microsoft security workloads; Sentinel adds SIEM coverage for broader data sources. Integration allows a more unified investigation workflow.

## SC-200 exam decisions
Recognize prerequisites and portal feature differences; know the role of workspace onboarding and permissions; avoid assuming every Sentinel capability behaves identically across portals.

## Troubleshooting
Check tenant and licensing → workspace enabled → roles and permissions → Defender XDR integration → onboarding status → incidents/data visibility → portal capability.

## Check understanding
1. What additional capability does Sentinel contribute when integrated with Defender XDR?
2. Why might a Sentinel feature be visible in one portal but not the other?
3. How would you validate successful workspace onboarding?

**Study tip:** Work through `source → scope → connector/workspace → data → detection/investigation → result`. Verify permissions and ingestion before assuming a missing alert means no suspicious activity.
