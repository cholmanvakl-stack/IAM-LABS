# Use watchlists in Microsoft Sentinel

## Main concept
`Microsoft Sentinel watchlists` store named reference data that analysts can use in KQL to enrich, filter, or compare security events.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/use-watchlists-azure-sentinel/

## Core knowledge
- Watchlist use cases: high-value assets, approved accounts, known exceptions, and investigation reference lists
- Plan watchlist columns and a stable `SearchKey`
- Create and import a watchlist from structured data
- Manage watchlist entries and update lifecycle
- Retrieve a watchlist in KQL using `_GetWatchlist()`
- Use watchlists in matching and enrichment queries

## How concepts connect
Raw events provide activity; watchlists provide organization-specific context. Joining them helps distinguish sensitive targets, expected exceptions, and items requiring extra scrutiny.

## SC-200 exam decisions
Choose watchlists for maintained reference data; recognize that a watchlist does not itself detect or block activity without queries or rules that use it.

## Troubleshooting
Check watchlist alias → import/schema → `SearchKey` → watchlist content → query function → join field normalization → matching results.

## Practical KQL example
```kusto
let HighValueAccounts = _GetWatchlist('high-value-accounts')
| project Account=tostring(SearchKey);
SecurityEvent
| where TimeGenerated > ago(24h) and EventID == 4625
| join kind=inner HighValueAccounts on Account
| project TimeGenerated, Computer, Account, EventID
```

> Illustrative example: create the `high-value-accounts` watchlist and normalize account formats before running. The workspace must ingest `SecurityEvent`.

## Check understanding
1. How is a watchlist different from an analytics rule?
2. Why should the `SearchKey` match the field used for lookups?
3. How would you identify failed logons involving high-value accounts?

**Study tip:** Work through `source → scope → connector/workspace → data → detection/investigation → result`. Verify permissions and ingestion before assuming a missing alert means no suspicious activity.
