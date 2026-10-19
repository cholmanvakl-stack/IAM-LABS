# Work with data in Microsoft Sentinel using Kusto Query Language

## Main concept
Security logs often contain nested or unstructured strings. KQL parsing and extraction functions turn these into fields suitable for filtering, correlation and reusable analysis.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/work-with-data-kusto-query-language/

## Core knowledge
- Extract fields from unstructured strings with `extract()` and `parse`
- Work with JSON-like strings using `parse_json()`
- Handle `dynamic` values and type conversions
- Integrate external reference data where supported
- Create reusable parsers and functions for normalized analysis

## How concepts connect
Raw logs may store useful indicators in message text or JSON. Parsing exposes consistent fields, and functions make that logic repeatable across investigations.

## SC-200 exam decisions
Choose regex extraction for text patterns, `parse` for known message formats, and `parse_json()` for JSON content. Verify data types before comparing or joining fields.

## Troubleshooting
Inspect raw field → identify string/JSON format → test extraction → check nulls and types → validate on sample events → reuse in function.

## Practical KQL example
```kusto
datatable(Raw:string)
[
  '{"user":"alex@example.com","ip":"192.0.2.10"}',
  '{"user":"sam@example.com","ip":"198.51.100.25"}'
]
| extend Parsed=parse_json(Raw)
| project User=tostring(Parsed.user), IPAddress=tostring(Parsed.ip)
```

> Examples are illustrative. Microsoft Sentinel tables, schemas, data availability, and permissions depend on connected data sources and your workspace configuration.

## Check understanding
1. A log contains a JSON-formatted field with an IP address. How would you extract and use it?
2. What would you verify if the query returned no rows?
3. How could you use the query output during a security investigation?

**Study tip:** Think `table → time range → filter → transform/aggregate → correlate → validate evidence`.
