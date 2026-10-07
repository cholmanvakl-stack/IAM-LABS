[CmdletBinding()] param([int]$Days=7)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "AuditLog.Read.All" | Out-Null }
$since=(Get-Date).ToUniversalTime().AddDays(-$Days).ToString("o")
Get-MgAuditLogDirectoryAudit -Filter "activityDateTime ge $since" -All |
Select ActivityDateTime,ActivityDisplayName,Category,Result,InitiatedBy,TargetResources |
Sort ActivityDateTime -Descending | Format-List