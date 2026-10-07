if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "RoleManagement.Read.Directory" | Out-Null }
Get-MgRoleManagementDirectoryRoleEligibilityScheduleInstance -All |
Select PrincipalId,RoleDefinitionId,DirectoryScopeId,StartDateTime,EndDateTime | Format-Table -AutoSize