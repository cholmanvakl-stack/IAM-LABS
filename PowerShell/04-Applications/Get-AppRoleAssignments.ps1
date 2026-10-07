[CmdletBinding()] param([Parameter(Mandatory)][string]$ServicePrincipalId)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "Application.Read.All" | Out-Null }
Get-MgServicePrincipalAppRoleAssignedTo -ServicePrincipalId $ServicePrincipalId -All |
Select PrincipalDisplayName,PrincipalId,AppRoleId,ResourceDisplayName | Format-Table -AutoSize