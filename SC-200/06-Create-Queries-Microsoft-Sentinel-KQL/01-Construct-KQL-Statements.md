# Construct KQL statements for Microsoft Sentinel

## Main concept
`Kusto Query Language (KQL)` queries security telemetry. Begin with a table, then pipe data through operators to filter, derive, sort and select fields.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/construct-kusto-query-language-statements/

## Core knowledge
- KQL statement structure and pipes (`|`)
- `search` for broad discovery and `where` for targeted filtering
- `let` for named expressions and reusable values
- `extend` for calculated columns
- `sort by` / `order by` for ordering
- `project`, `project-away` and related projection operators
- Time filters and field types

## How concepts connect
A query typically starts with a known log table, narrows time and events, derives useful context, and presents the columns needed to investigate.

## SC-200 exam decisions
Choose `where` to filter rows, `extend` to create a column, `project` to select columns, `let` to name expressions, and `sort by` to order results. `search` is useful for discovery but can be costly.

## Troubleshooting
Check workspace/table → ingestion and time range → column names and types → filter logic → output columns → expected event count.

## Practical KQL example
```kusto
SecurityEvent
| where TimeGenerated > ago(24h)
| where EventID == 4625
| project TimeGenerated, Computer, Account, EventID
| sort by TimeGenerated desc
```

> Examples are illustrative. Microsoft Sentinel tables, schemas, data availability, and permissions depend on connected data sources and your workspace configuration.

## Check understanding
1. Which operator would you use to restrict results to the last 24 hours, and which would you use to show only account and IP address?
2. What would you verify if the query returned no rows?
3. How could you use the query output during a security investigation?

**Study tip:** Think `table → time range → filter → transform/aggregate → correlate → validate evidence`.
