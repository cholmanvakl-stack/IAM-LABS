# 04 — Monitor and Maintain Microsoft Entra ID

## Main concept
**Use identity logs, reports, alerts and monitoring integrations to understand who signed in, what changed, what failed, and what security actions are needed.**

**Identity activity → Logs → Investigation → Diagnostic export → Reporting/alerts → Remediation**

## Core knowledge

### Sign-in logs
- `Sign-in logs`: authentication attempts and outcomes, applications, devices, client type, Conditional Access evaluation, risk details where available and error codes.
- `Interactive sign-ins`: user actively participates in authentication.
- `Non-interactive sign-ins`: token-based activity without a fresh interactive prompt.
- `Service principal sign-ins`: workload/application identity authentication.
- `Managed identity sign-ins`: sign-ins by managed identities.
- `Correlation ID`, request ID and timestamp help trace a failure.
- For Conditional Access failures, inspect applied policies and results rather than guessing from a single error message.

### Audit logs
- `Audit logs`: administrative and directory changes such as user/group updates, app changes, role assignments and policy modifications.
- Investigate `actor`, `target`, `activity`, `result` and timestamp.
- `Sign-in logs` answer 'what happened during authentication?' while `audit logs` answer 'what configuration or directory object changed?'
- Audit visibility, retention and supported events vary by log category and license.

### Diagnostic settings and export
- `Diagnostic settings` route supported Entra log categories to destinations such as:
  - `Log Analytics workspace`: query, correlate and visualize logs.
  - `Azure Storage`: retain/export log data.
  - `Event Hubs`: stream events to third-party SIEMs and other consumers.
- `Microsoft Sentinel` can ingest Entra data through supported data connectors and workspaces for security investigation.
- `Third-party SIEM` integration commonly uses supported export/streaming pipelines; verify schema, latency and permissions.
- Export configuration does not backfill all past logs automatically; plan retention and ingestion requirements.

### Workbooks, reporting and notifications
- `Microsoft Entra workbooks`: visual dashboards for sign-in trends, Conditional Access, authentication and other identity reporting.
- `Identity Secure Score`: measures adoption of recommended security improvements; prioritize by risk and organizational needs.
- `Alerts/notifications`: configure supported alert rules and operational notifications to surface failures or security changes.
- `Log Analytics`: supports investigation and reporting; familiarity with what it does matters even when KQL authoring is not a module objective.
- `Microsoft Sentinel`: security analytics, correlation, incidents and response on ingested signals.

### Practical investigation flow
1. Identify affected principal, resource/app, approximate time and error.
2. Inspect relevant sign-in log category and Conditional Access results.
3. Check audit logs for recent role, app, credential or policy changes.
4. Validate log export destination, workspace permissions and ingestion if the event is missing downstream.
5. Review workbook trends and security posture.
6. Record cause, remediation and evidence.

## Exam decision table
| Question | Best source |
|---|---|
| Why was a sign-in blocked? | Sign-in logs and Conditional Access details |
| Who changed a role assignment? | Audit logs |
| Which service principal is failing authentication? | Service principal sign-in logs |
| Centralize identity log analysis | Log Analytics / Sentinel |
| Stream identity logs to external SIEM | Diagnostic settings / Event Hubs |
| Visualize sign-in trends | Entra workbooks |
| Prioritize identity posture improvements | Identity Secure Score |

## Troubleshooting
`Principal → Time/correlation ID → Sign-in category → Policy/error → Recent audit changes → Export pipeline → Destination ingestion → Alert/report result`

## Check understanding
1. Which log distinguishes an authentication failure from a configuration change?
2. How would you investigate a missing event in a third-party SIEM?
3. What is the difference between an Entra workbook and Identity Secure Score?

Official module: https://learn.microsoft.com/en-us/training/modules/monitor-maintain-azure-active-directory/
