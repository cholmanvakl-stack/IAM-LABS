# SC-200 — Create queries for Microsoft Sentinel using Kusto Query Language (KQL)

## Main concept
`Kusto Query Language (KQL)` lets a Blue Team analyst search security events, analyze trends, correlate evidence, and prepare hunting and detection queries in `Microsoft Sentinel`.

**Official Microsoft Learn learning path:** https://learn.microsoft.com/en-us/training/paths/sc-200-utilize-kql-for-azure-sentinel/

**Certification:** [Microsoft Certified: Security Operations Analyst Associate](https://learn.microsoft.com/en-us/credentials/certifications/security-operations-analyst/)

## The mental model
`Ingested logs → Select table → Filter events → Transform fields → Aggregate/correlate → Validate findings → Investigate or report`. Begin with the right data source and time range before choosing operators. `where` filters rows, `summarize` groups evidence, `union` stacks results, `join` relates records, and parsing extracts fields from log messages.

## How these modules connect
1. **Construct KQL statements** — Query structure, search, filters, calculated fields and projections.
2. **Analyze query results** — Aggregations, grouping, time bins and charts.
3. **Build multi-table statements** — Combine and correlate events with unions and joins.
4. **Work with data** — Parse strings, handle structured data and create reusable functions.

## Modules
1. [Construct KQL statements for Microsoft Sentinel](01-Construct-KQL-Statements.md)
2. [Analyze query results using KQL](02-Analyze-Query-Results.md)
3. [Build multi-table statements using KQL](03-Multi-Table-Statements.md)
4. [Work with data in Microsoft Sentinel using Kusto Query Language](04-Work-with-Data-KQL.md)

Each module follows: Main concept → Core knowledge → How concepts connect → SC-200 exam decisions → Troubleshooting → Practical KQL example → Check understanding.

> These are the four Microsoft Learn modules in the sixth SC-200 learning path, not four separate domains of the complete certification exam. Validate queries against your actual Sentinel table schema and connected data sources.
