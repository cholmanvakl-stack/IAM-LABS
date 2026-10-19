# Manage your cloud security posture management

## Main concept
`Cloud Security Posture Management (CSPM)` identifies insecure configurations, prioritizes recommendations, and helps measure and improve cloud security posture.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/manage-cloud-security-posture-management/

## Core knowledge
- Secure Score and its interpretation
- Security recommendations and remediation guidance
- Regulatory compliance dashboard and standards
- Security posture and resource risk context
- Workbooks for analysis and reporting
- Prioritizing risk reduction versus chasing a score

## How concepts connect
Recommendations identify weaknesses; Secure Score summarizes selected controls; compliance views map posture to standards; workbooks help analyze and communicate progress.

## SC-200 exam decisions
Distinguish Secure Score, recommendations and compliance status; select the right view for risk, configuration, or reporting questions.

## Troubleshooting
Check policy/standard assignment → resource scope → assessment freshness → recommendation evidence → remediation owner → reassessment.

## Check understanding
1. A resource is compliant with a standard but still has a security recommendation. Why is that possible?
2. What Azure resource, security plan, connector, or investigation view would you check first, and why?
3. How would you validate the resulting remediation or security improvement?

**Study tip:** Use `source → scope → plan/connector → telemetry → alert or recommendation → response → verification`. Check licensing and product support before relying on a feature in production.
