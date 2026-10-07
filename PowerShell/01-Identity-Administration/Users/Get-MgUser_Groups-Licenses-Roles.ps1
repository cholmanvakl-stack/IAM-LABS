[CmdletBinding()] param([Parameter(Mandatory)][string]$UserPrincipalName)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "User.Read.All","Group.Read.All","Directory.Read.All","RoleManagement.Read.Directory" | Out-Null }
$u=Get-MgUser -UserId $UserPrincipalName
"=== GROUP/ROLE MEMBERSHIP ==="
Get-MgUserMemberOf -UserId $u.Id -All | Select @{n="DisplayName";e={$_.AdditionalProperties.displayName}},@{n="Type";e={$_.AdditionalProperties.'@odata.type'}} | Format-Table -AutoSize
"=== LICENSES ==="
Get-MgUserLicenseDetail -UserId $u.Id | Select SkuPartNumber,SkuId | Format-Table -AutoSize