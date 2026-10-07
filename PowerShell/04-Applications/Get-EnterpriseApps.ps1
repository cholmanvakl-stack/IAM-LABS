if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "Application.Read.All" | Out-Null }
Get-MgServicePrincipal -All -Property DisplayName,AppId,Id,AccountEnabled,AppRoleAssignmentRequired,ServicePrincipalType |
Select DisplayName,AppId,Id,AccountEnabled,AppRoleAssignmentRequired,ServicePrincipalType | Sort DisplayName | Format-Table -AutoSize