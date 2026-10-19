# SC-200 — Configure your Microsoft Sentinel environment

## Main concept
`Microsoft Sentinel` provides a cloud-native SIEM/SOAR platform for ingesting security data, querying logs, detecting threats, managing indicators, and integrating investigations with `Microsoft Defender XDR`.

**Official Microsoft Learn learning path:** https://learn.microsoft.com/en-us/training/paths/sc-200-configure-azure-sentinel-environment/

**Certification:** [Microsoft Certified: Security Operations Analyst Associate](https://learn.microsoft.com/en-us/credentials/certifications/security-operations-analyst/)

## The mental model
`Data sources → Connectors → Log Analytics workspace → KQL and reference data → Threat intelligence → Detections/incidents → Defender XDR investigation and response`.

A healthy SOC deployment starts with the right workspace, permissions, connectors, and telemetry. `Watchlists` add organization-specific context; `threat intelligence` provides external or curated indicators; `Defender XDR` integration brings investigations into a unified experience.

## How these modules connect
1. **Introduction to Microsoft Sentinel** — Learn the SIEM/SOAR capabilities and use cases.
2. **Create and manage workspaces** — Configure architecture, RBAC, logs, and portal onboarding.
3. **Query logs** — Explore tables and investigate ingested data with KQL.
4. **Use watchlists** — Enrich events with reference data and KQL lookups.
5. **Utilize threat intelligence** — Manage and correlate indicators with telemetry.
6. **Integrate Defender XDR** — Connect Sentinel to the Defender portal for unified security operations.

## Modules
1. [Introduction to Microsoft Sentinel](01-Introduction-Microsoft-Sentinel.md)
2. [Create and manage Microsoft Sentinel workspaces](02-Create-Manage-Workspaces.md)
3. [Query logs in Microsoft Sentinel](03-Query-Logs.md)
4. [Use watchlists in Microsoft Sentinel](04-Use-Watchlists.md)
5. [Utilize threat intelligence in Microsoft Sentinel](05-Threat-Intelligence.md)
6. [Integrate Microsoft Defender XDR with Microsoft Sentinel](06-Integrate-Defender-XDR.md)

Each module follows: Main concept → Core knowledge → How concepts connect → SC-200 exam decisions → Troubleshooting → Check understanding. KQL examples are included where useful.

> These are the six modules in the seventh Microsoft Learn learning path, not six separate domains of the complete SC-200 certification exam. Check the current exam study guide for full exam coverage.
