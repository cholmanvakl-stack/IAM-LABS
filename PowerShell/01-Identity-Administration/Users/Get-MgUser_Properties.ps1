[CmdletBinding()] param([Parameter(Mandatory)][string]$UserPrincipalName)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "User.Read.All" | Out-Null }
Get-MgUser -UserId $UserPrincipalName -Property DisplayName,UserPrincipalName,UserType,AccountEnabled,Mail,MobilePhone,BusinessPhones,JobTitle,Department,CreatedDateTime |
Format-List