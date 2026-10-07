if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "Application.Read.All" | Out-Null }
Get-MgApplication -All -Property DisplayName,AppId,Id,SignInAudience,PublisherDomain,CreatedDateTime |
Select DisplayName,AppId,Id,SignInAudience,PublisherDomain,CreatedDateTime | Sort DisplayName | Format-Table -AutoSize