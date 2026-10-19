# Analyze query results using KQL

## Main concept
`summarize` groups and aggregates security events; `render` turns aggregated query output into a chart for trend analysis and reporting.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/analyze-results-kusto-query-language/

## Core knowledge
- `summarize` and aggregations such as `count()`, `dcount()` and `make_set()`
- Grouping with `by` and time bucketing with `bin()`
- `where` before and after aggregation for different questions
- `render` visualizations and their data-shape requirements
- Use aggregated results to identify spikes and repeated activity

## How concepts connect
Filtered raw events become grouped metrics; time bins reveal patterns; charts help an analyst spot changes that warrant investigation.

## SC-200 exam decisions
Choose the correct grouping dimensions and aggregate; recognize why `render` is applied to suitable aggregated data, not as a substitute for investigation.

## Troubleshooting
Check raw event count → group-by fields → time bins → aggregate logic → sorting → visualization shape.

## Practical KQL example
```kusto
SecurityEvent
| where TimeGenerated > ago(24h) and EventID == 4625
| summarize FailedLogons=count() by Account
| where FailedLogons >= 5
| sort by FailedLogons desc
```

> Examples are illustrative. Microsoft Sentinel tables, schemas, data availability, and permissions depend on connected data sources and your workspace configuration.

## Check understanding
1. How would you find the accounts with the highest number of failed logons in the last day?
2. What would you verify if the query returned no rows?
3. How could you use the query output during a security investigation?

**Study tip:** Think `table → time range → filter → transform/aggregate → correlate → validate evidence`.
