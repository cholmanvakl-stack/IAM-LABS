[CmdletBinding()] param([string]$DisplayName)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "User.Read.All" | Out-Null }
$term = if ($DisplayName) { $DisplayName } else { Read-Host "DisplayName search" }
$term = $term.Replace("'","''")
Get-MgUser -Filter "startsWith(displayName,'$term')" -All -Property DisplayName,UserPrincipalName,UserType,AccountEnabled,Mail,MobilePhone,JobTitle,Department |
Select DisplayName,UserPrincipalName,UserType,AccountEnabled,Mail,MobilePhone,JobTitle,Department |
Format-Table -AutoSize