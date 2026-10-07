[CmdletBinding()] param([Parameter(Mandatory)][string]$GroupId)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "Group.Read.All" | Out-Null }
Get-MgGroupOwner -GroupId $GroupId -All | Select @{n="DisplayName";e={$_.AdditionalProperties.displayName}},Id | Format-Table -AutoSize