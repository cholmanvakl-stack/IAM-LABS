# Query logs in Microsoft Sentinel

## Main concept
The `Logs` experience and `Kusto Query Language (KQL)` let analysts inspect ingested data, understand table schemas, and investigate security activity.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/query-logs-azure-sentinel/

## Core knowledge
- Navigate Logs and inspect available tables and schemas
- Understand common Sentinel tables such as `SecurityEvent`, `SigninLogs`, and `AzureActivity` when connected
- Recognize data source-specific fields, timestamps, and event categories
- Explore Microsoft Defender XDR tables available through supported integrations
- Validate ingestion, table availability, and event freshness
- Apply basic KQL filters, projections, and sorting

## How concepts connect
A KQL query is only as useful as the telemetry present. Analysts identify the right table and time range before drawing conclusions from a search.

## SC-200 exam decisions
Choose a table based on source and event type; differentiate absence of a matching event from missing ingestion or an incorrect query.

## Troubleshooting
Check connector → workspace → table exists → ingestion delay → `TimeGenerated` range → field names/types → query results.

## Practical KQL example
```kusto
SigninLogs
| where TimeGenerated > ago(24h)
| summarize SignInCount=count() by ResultType, UserPrincipalName
| sort by SignInCount desc
```

> Requires Entra sign-in logs to be connected and ingested into the queried workspace.

## Check understanding
1. Which table would you investigate for Entra sign-in events if the connector provides `SigninLogs`?
2. Why could a correct KQL query return no results?
3. How would you verify the freshness of a security log table?

**Study tip:** Work through `source → scope → connector/workspace → data → detection/investigation → result`. Verify permissions and ingestion before assuming a missing alert means no suspicious activity.
