[CmdletBinding()] param([Parameter(Mandatory)][string]$UserPrincipalName)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "User.Read.All" | Out-Null }
Get-MgUserLicenseDetail -UserId $UserPrincipalName | Select SkuPartNumber,SkuId | Format-Table -AutoSize