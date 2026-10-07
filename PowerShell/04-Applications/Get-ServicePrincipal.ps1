[CmdletBinding()] param([Parameter(Mandatory)][string]$AppId)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "Application.Read.All" | Out-Null }
Get-MgServicePrincipal -Filter "appId eq '$AppId'" -Property DisplayName,AppId,Id,AccountEnabled,AppRoleAssignmentRequired,ServicePrincipalType | Format-List