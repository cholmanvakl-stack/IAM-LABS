if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "User.Read.All" | Out-Null }
Get-MgUser -Filter "userType eq 'Guest'" -All -Property DisplayName,UserPrincipalName,UserType,AccountEnabled,CreatedDateTime,Mail |
Select DisplayName,UserPrincipalName,UserType,AccountEnabled,CreatedDateTime,Mail | Format-Table -AutoSize