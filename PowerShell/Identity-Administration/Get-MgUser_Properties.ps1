Connect-MgGraph -Scopes "Organization.Read.All", "User.Read.All", "Group.Read.All", "Directory.Read.All"

$Search = Read-Host "Enter part of the user display name"

$Wildcard = "*$Search*"

$Users = Get-MgUser -All -Property DisplayName,UserPrincipalName,UserType,AccountEnabled,BusinessPhones,MobilePhone,Mail,JobTitle,Department

$Results = $Users | Where-Object { $_.DisplayName -like $Wildcard }

if ($Results) {
    Write-Host ""
    Write-Host "Users found matching '$Search':" -ForegroundColor Green
    Write-Host ""

    $Results | Select-Object `
        DisplayName,
        UserPrincipalName,
        UserType,
        @{Name="AccountStatus";Expression={if ($_.AccountEnabled) {"Enabled"} else {"Disabled"}}},
        Mail,
        BusinessPhones,
        MobilePhone,
        JobTitle,
        Department |
        Format-List
}
else {
    Write-Host ""
    Write-Host "No users found matching '$Search'." -ForegroundColor Yellow
}
