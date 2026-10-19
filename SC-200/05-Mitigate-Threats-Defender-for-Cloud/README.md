# SC-200 — Mitigate threats using Microsoft Defender for Cloud

## Main concept
`Microsoft Defender for Cloud` helps security operations teams secure Azure, hybrid, and multicloud resources through `Cloud Security Posture Management (CSPM)`, `Cloud Workload Protection (CWPP)`, security alerts, and remediation workflows.

**Official Microsoft Learn learning path:** https://learn.microsoft.com/en-us/training/paths/sc-200-mitigate-threats-using-azure-defender/

**Certification:** [Microsoft Certified: Security Operations Analyst Associate](https://learn.microsoft.com/en-us/credentials/certifications/security-operations-analyst/)

## The mental model
`Discover cloud resources → Connect/onboard → Enable appropriate plans → Evaluate posture → Detect workload threats → Investigate alerts → Remediate → Verify`. `CSPM` identifies configuration weaknesses; `CWPP` provides workload-focused threat protection. Security analysts must confirm both visibility and protection coverage before interpreting an absence of alerts.

## How these modules connect
1. **Plan cloud workload protections** — Understand Defender for Cloud, CSPM/CWPP, and enablement.
2. **Connect Azure assets** — Inventory and provision telemetry for Azure resources.
3. **Connect non-Azure resources** — Extend visibility to hybrid systems, AWS, and GCP.
4. **Manage cloud security posture** — Prioritize recommendations, Secure Score, and compliance.
5. **Explain cloud workload protections** — Map threat protection to servers, data, apps, secrets, containers, and infrastructure.
6. **Remediate security alerts** — Investigate cloud threats, take action, and validate outcomes.

## Modules
1. [Plan for cloud workload protections using Microsoft Defender for Cloud](01-Plan-Cloud-Workload-Protections.md)
2. [Connect Azure assets to Microsoft Defender for Cloud](02-Connect-Azure-Assets.md)
3. [Connect non-Azure resources to Microsoft Defender for Cloud](03-Connect-Non-Azure-Resources.md)
4. [Manage your cloud security posture management](04-Cloud-Security-Posture-Management.md)
5. [Explain cloud workload protections in Microsoft Defender for Cloud](05-Cloud-Workload-Protections.md)
6. [Remediate security alerts using Microsoft Defender for Cloud](06-Remediate-Security-Alerts.md)

Each module follows: Main concept → Core knowledge → How concepts connect → SC-200 exam decisions → Troubleshooting → Check understanding.

> These are six Microsoft Learn modules within the fifth SC-200 learning path, not six domains of the full SC-200 exam. Consult the current exam study guide for the complete exam outline.
