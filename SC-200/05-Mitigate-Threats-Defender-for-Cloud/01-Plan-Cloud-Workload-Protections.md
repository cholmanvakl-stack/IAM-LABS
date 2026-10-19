# Plan for cloud workload protections using Microsoft Defender for Cloud

## Main concept
`Microsoft Defender for Cloud` combines cloud security posture management (CSPM) with cloud workload protection (CWPP) to help analysts find misconfigurations, detect attacks, and improve cloud security.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/what-is-azure-defender/

## Core knowledge
- Purpose and capabilities of Defender for Cloud
- Differences between security posture management and workload threat protection
- Supported Azure, hybrid, and multicloud resource coverage
- Enabling Defender for Cloud and selecting protection plans
- Subscription scope, permissions, cost and telemetry prerequisites

## How concepts connect
`CSPM` helps prevent exposure by identifying configuration risks; `CWPP` detects and protects workload-specific threats. A security operations analyst uses both to prioritize and investigate cloud risk.

## SC-200 exam decisions
Distinguish posture recommendations from security alerts; recognize which subscription, resource, and protection plan need enablement.

## Troubleshooting
Check subscription and resource scope → enabled plans → permissions → supported workload → telemetry → recommendations and alerts.

## Check understanding
1. A cloud resource appears in Azure but has no Defender workload alerts. What prerequisites would you check?
2. What Azure resource, security plan, connector, or investigation view would you check first, and why?
3. How would you validate the resulting remediation or security improvement?

**Study tip:** Use `source → scope → plan/connector → telemetry → alert or recommendation → response → verification`. Check licensing and product support before relying on a feature in production.
