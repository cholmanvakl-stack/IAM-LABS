if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "AccessReview.Read.All" | Out-Null }
Get-MgIdentityGovernanceAccessReviewDefinition -All |
Select Id,DisplayName,Status,CreatedDateTime,LastModifiedDateTime | Sort DisplayName | Format-Table -AutoSize