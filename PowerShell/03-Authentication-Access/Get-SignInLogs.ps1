[CmdletBinding()] param([int]$Days=7)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "AuditLog.Read.All" | Out-Null }
$since=(Get-Date).ToUniversalTime().AddDays(-$Days).ToString("o")
Get-MgAuditLogSignIn -Filter "createdDateTime ge $since" -All |
Select CreatedDateTime,UserDisplayName,UserPrincipalName,AppDisplayName,ClientAppUsed,Status,ConditionalAccessStatus,IPAddress |
Sort CreatedDateTime -Descending | Format-Table -AutoSize