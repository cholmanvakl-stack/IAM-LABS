if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "Group.Read.All" | Out-Null }
Get-MgGroup -All -Property DisplayName,SecurityEnabled,MailEnabled,GroupTypes,MembershipRule |
Select DisplayName,SecurityEnabled,MailEnabled,GroupTypes,MembershipRule |
Sort DisplayName | Format-Table -AutoSize