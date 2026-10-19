# Conduct investigations with Microsoft Purview Audit

## Main concept
`Microsoft Purview Audit` records supported Microsoft 365 and AI-app activity so investigators can search, correlate, retain, and report on user and administrator actions.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/purview-audit-search-investigate/

## Core knowledge
- Audit event collection, searchable activity and retention
- Audit (Standard) versus Audit (Premium) capabilities
- Configuring auditing and Premium retention
- Audit searches in Purview and PowerShell
- Premium events including MailItemsAccessed
- Copilot and AI application activity records
- Exporting, parsing, correlating and reporting audit results

## How concepts connect
Workloads emit audit records; permissions, availability and retention affect what can be searched; investigators filter events by user, time, operation and workload; correlated records build a defensible timeline.

## SC-200 exam decisions
Select appropriate audit capability and retention, understand when Premium-only records are needed, and choose search criteria that narrow the investigation without excluding relevant evidence.

## Troubleshooting
Check workload/event support → audit configuration and permissions → retention window → search filters and timestamps → record availability → exported evidence.

## Check understanding
1. An investigator needs message-level mailbox access evidence. Which audit capability should they evaluate?
2. Why might a valid audit search return no results?
3. How would you combine multiple audit event types into a single incident timeline?

**Study tip:** Explain scenarios using `source → scope → evidence → investigation → decision → remediation or case action → validation`. Follow organizational authorization and privacy requirements.
