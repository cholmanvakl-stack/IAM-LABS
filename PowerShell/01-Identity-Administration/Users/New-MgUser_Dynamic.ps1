[CmdletBinding()] param([Parameter(Mandatory)][string]$UserName,[Parameter(Mandatory)][string]$Domain)
if (-not (Get-MgContext)) { Connect-MgGraph -Scopes "User.ReadWrite.All" | Out-Null }
$upn=if($UserName -match '@'){ $UserName } else { "$UserName@$Domain" }
$pwd=Read-Host "Temporary password" -AsSecureString
$plain=[System.Net.NetworkCredential]::new("",$pwd).Password
$params=@{accountEnabled=$true;displayName=$UserName;mailNickname=($UserName -replace '[^a-zA-Z0-9]','');userPrincipalName=$upn;passwordProfile=@{password=$plain;forceChangePasswordNextSignIn=$true}}
New-MgUser -BodyParameter $params | Select DisplayName,UserPrincipalName,Id