# Build multi-table statements using KQL

## Main concept
`union` combines rows from multiple compatible event sources; `join` matches rows from two tables on shared keys to correlate evidence.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/build-multi-table-statements-kusto-query-language/

## Core knowledge
- `union` for combining datasets into one result set
- `join` for relating two datasets on matching values
- Common join kinds such as `inner` and `leftouter`
- Schema mismatches, duplicate matches and field naming
- Selecting correlation keys and constraining time windows

## How concepts connect
Different security logs provide partial views of activity. Combining tables expands coverage; joining tables connects related entities or events to support a timeline.

## SC-200 exam decisions
Use `union` when stacking events and `join` when matching related records. Understand how join kinds affect missing and duplicate matches.

## Troubleshooting
Check each source table separately → timestamp windows → join key normalization → join kind → row multiplication → final projections.

## Practical KQL example
```kusto
let Failed = SecurityEvent
| where TimeGenerated > ago(1d) and EventID == 4625
| summarize Failures=count() by Account;
let Successful = SecurityEvent
| where TimeGenerated > ago(1d) and EventID == 4624
| summarize Successes=count() by Account;
Failed
| join kind=inner Successful on Account
| project Account, Failures, Successes
```

> Examples are illustrative. Microsoft Sentinel tables, schemas, data availability, and permissions depend on connected data sources and your workspace configuration.

## Check understanding
1. Would you use `union` or `join` to correlate two tables by an account identifier, and why?
2. What would you verify if the query returned no rows?
3. How could you use the query output during a security investigation?

**Study tip:** Think `table → time range → filter → transform/aggregate → correlate → validate evidence`.
