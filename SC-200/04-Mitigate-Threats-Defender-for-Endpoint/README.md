# SC-200 — Mitigate threats using Microsoft Defender for Endpoint

## Main concept
`Microsoft Defender for Endpoint` provides endpoint protection, attack surface reduction, device telemetry, investigation, response automation, and vulnerability management to support Blue Team operations.

**Official Microsoft Learn learning path:** https://learn.microsoft.com/en-us/training/paths/sc-200-mitigate-threats-using-microsoft-defender-for-endpoint/

**Certification:** [Microsoft Certified: Security Operations Analyst Associate](https://learn.microsoft.com/en-us/credentials/certifications/security-operations-analyst/)

## The mental model
`Onboard device → Apply prevention controls → Collect telemetry → Detect alert → Investigate device and entities → Contain/remediate → Verify → Reduce exposure`. `Defender XDR` correlates endpoint evidence with other workloads; `Defender for Endpoint` provides the device-specific investigation and response capabilities.

## How these modules connect
1. **Protect against threats** — Learn the endpoint platform's protection and hunting capabilities.
2. **Deploy the environment** — Enable telemetry through onboarding, access controls, and settings.
3. **Implement Windows security enhancements** — Reduce exposure using ASR.
4. **Perform device investigations** — Inspect device inventory, timeline, and forensic evidence.
5. **Perform device actions** — Contain threats and collect investigation data.
6. **Investigate evidence and entities** — Pivot between files, accounts, IPs, and domains.
7. **Configure automation** — Manage investigation and remediation automation.
8. **Configure alerts and detections** — Control notifications, suppression, and indicators.
9. **Utilize Vulnerability Management** — Identify, prioritize, and verify exposure remediation.

## Modules
1. [Protect against threats with Microsoft Defender for Endpoint](01-Protect-Against-Threats.md)
2. [Deploy the Microsoft Defender for Endpoint environment](02-Deploy-Defender-Endpoint.md)
3. [Implement Windows security enhancements with Microsoft Defender for Endpoint](03-Windows-Security-Enhancements.md)
4. [Perform device investigations in Microsoft Defender for Endpoint](04-Device-Investigations.md)
5. [Perform actions on a device using Microsoft Defender for Endpoint](05-Device-Response-Actions.md)
6. [Perform evidence and entities investigations using Microsoft Defender for Endpoint](06-Evidence-and-Entities.md)
7. [Configure and manage automation using Microsoft Defender for Endpoint](07-Automation-Configuration.md)
8. [Configure for alerts and detections in Microsoft Defender for Endpoint](08-Alerts-and-Detections.md)
9. [Utilize Vulnerability Management in Microsoft Defender for Endpoint](09-Vulnerability-Management.md)

Each module follows: Main concept → Core knowledge → How concepts connect → SC-200 exam decisions → Troubleshooting → Check understanding.

> These are nine modules within the fourth Microsoft Learn SC-200 learning path, not nine separate domains of the full exam. Check the current Microsoft SC-200 study guide for full skills coverage.
