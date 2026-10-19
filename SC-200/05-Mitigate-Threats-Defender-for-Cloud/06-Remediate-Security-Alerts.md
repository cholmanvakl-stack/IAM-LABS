# Remediate security alerts using Microsoft Defender for Cloud

## Main concept
Defender for Cloud alerts support triage, investigation, remediation, suppression, and response automation for suspicious cloud workload activity.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/remediate-azure-defender-security-alerts/

## Core knowledge
- Security alert severity, status and affected resources
- Investigating alert details and evidence
- Remediation steps and resource-owner coordination
- Workflow automation and automated response
- Alert suppression rules and false-positive handling
- Threat intelligence reporting
- Responding to alerts from Azure resources

## How concepts connect
Protection plans produce alerts; analysts validate evidence and scope; remediation contains or removes threats; suppression and automation require controlled conditions and post-action verification.

## SC-200 exam decisions
Distinguish suppressing an alert from remediating a threat; choose when to automate; understand what evidence supports escalation and closure.

## Troubleshooting
Check affected resource → enabled protection plan → alert evidence → correlated activity → action permissions → response status → verification.

## Check understanding
1. An alert repeatedly triggers for expected activity. What must you confirm before configuring suppression?
2. What Azure resource, security plan, connector, or investigation view would you check first, and why?
3. How would you validate the resulting remediation or security improvement?

**Study tip:** Use `source → scope → plan/connector → telemetry → alert or recommendation → response → verification`. Check licensing and product support before relying on a feature in production.
