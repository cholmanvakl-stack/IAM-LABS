if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "Policy.Read.All" | Out-Null }
Get-MgPolicyCrossTenantAccessPolicyDefault | Format-List
Get-MgPolicyCrossTenantAccessPolicyPartner -All | Select TenantId,B2BSetting,B2BDirectConnectSetting | Format-Table -AutoSize