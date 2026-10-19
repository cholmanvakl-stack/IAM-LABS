# SC-200 — Mitigate threats using Microsoft Purview

## Main concept
`Microsoft Purview` helps security operations analysts investigate sensitive-data exposure, insider risk, audit activity and discoverable organizational content. It complements `Microsoft Defender XDR` by adding data-protection and compliance evidence to security investigations.

**Official Microsoft Learn learning path:** https://learn.microsoft.com/en-us/training/paths/sc-200-mitigate-threats-using-microsoft-purview/

**Certification:** [Microsoft Certified: Security Operations Analyst Associate](https://learn.microsoft.com/en-us/credentials/certifications/security-operations-analyst/)

## The mental model
`Sensitive data and user activity → DLP/insider-risk signals → Alert or investigation → Audit evidence and content search → Authorized response and case documentation`. `DLP` focuses on policy-defined sensitive-data handling, `Insider Risk Management` on potentially risky behavior, `Audit` on recorded activities, and `eDiscovery` on finding content. These tools answer different questions and should not be confused.

## How these modules connect
1. **DLP alerts** — Detect and investigate sensitive-data policy matches, then respond.
2. **Insider risk alerts** — Evaluate behavioral risk, investigate user activity, and manage cases.
3. **Purview Audit** — Establish an evidence-backed timeline of user, admin, and AI-app activity.
4. **Purview eDiscovery** — Find relevant messages and files in an authorized case.

## Modules
1. [Investigate and respond to Microsoft Purview Data Loss Prevention alerts](01-Investigate-DLP-Alerts.md)
2. [Investigate insider risk alerts and related activity](02-Investigate-Insider-Risk.md)
3. [Conduct investigations with Microsoft Purview Audit](03-Purview-Audit-Investigations.md)
4. [Search for content with Microsoft Purview eDiscovery](04-Purview-eDiscovery-Content-Search.md)

Each module follows: Main concept → Core knowledge → How concepts connect → SC-200 exam decisions → Troubleshooting → Check understanding.

> These are four Microsoft Learn modules in the third SC-200 learning path, not four separate domains of the full SC-200 exam. Confirm the complete exam objectives in Microsoft's current SC-200 study guide.
