[CmdletBinding()] param([Parameter(Mandatory)][string]$GroupId)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "GroupMember.Read.All" | Out-Null }
Get-MgGroupMember -GroupId $GroupId -All |
Select Id,@{n="DisplayName";e={$_.AdditionalProperties.displayName}},@{n="Type";e={$_.AdditionalProperties.'@odata.type'}} |
Format-Table -AutoSize