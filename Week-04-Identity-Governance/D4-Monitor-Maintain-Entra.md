# Week 4 Day 4 — Monitor and Maintain Microsoft Entra ID

## Microsoft Learn Alignment

**Module:** Monitor and maintain Microsoft Entra ID

### Sign-In Logs

**Sign-in log** → Records authentication attempts and their results.

Use for:

- access troubleshooting
- Conditional Access investigation
- authentication analysis
- risky sign-in investigation

**How they connect:** Sign-in logs provide evidence about authentication and access decisions.

### Microsoft Entra Audit Logs

**Audit log** → Records administrative and directory changes.

Examples:

- user changes
- group changes
- role assignments
- application changes
- policy changes

**How they connect:** Audit logs show what changed, who changed it, and when.

### Microsoft Sentinel

**Microsoft Sentinel** → Cloud-native SIEM used to collect, analyze, correlate, and respond to security data.

Microsoft Entra logs can be connected to Sentinel for broader security investigation.

**How they connect:** Entra provides identity telemetry; Sentinel correlates identity telemetry with other security signals.

### SIEM Export

**SIEM integration** → Sends identity logs to an external security monitoring platform.

Use for:

- centralized monitoring
- correlation
- alerting
- incident response
- retention

### Workbooks and Reporting

**Workbook** → Visualizes identity and security data for analysis.

Use for:

- trends
- authentication patterns
- security posture
- operational reporting

### Identity Secure Score

**Identity Secure Score** → Measures aspects of Microsoft Entra identity security posture and provides improvement guidance.

**How they connect:** Secure Score helps prioritize identity security improvements.

## Troubleshooting

**User → Sign-In Log → Conditional Access → Audit Log → Resource/Application → Correlation → Remediation**

### Example

A user cannot access an application:

1. Find the user's sign-in.
2. Identify the application.
3. Review the sign-in result.
4. Review Conditional Access.
5. Check authentication requirements.
6. Check application/resource authorization.
7. Review related audit events.
8. Remediate and retest.

## Scenario

An administrator claims they did not change a Conditional Access policy.

Use:

**Audit logs**

to identify the change, actor, timestamp, and affected configuration.

## Interview Skill

Explain:

> Sign-in logs tell me about authentication attempts and access decisions. Audit logs tell me about changes made to the directory and configuration.
