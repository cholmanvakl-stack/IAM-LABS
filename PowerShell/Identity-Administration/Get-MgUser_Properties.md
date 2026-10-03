# ============================================
# Dynamic Entra ID User Search
# Microsoft Graph PowerShell
# ============================================

# Ask for a search string
$Search = Read-Host "Enter part of the user's display name"

# Automatically add wildcards
$WildcardSearch = "*$Search*"

# Get users and required properties
$Users = Get-MgUser -All -Property Id,DisplayName,UserPrincipalName,UserType,AccountEnabled,BusinessPhones,MobilePhone |
    Where-Object {
        $_.DisplayName -like $WildcardSearch
    }

# Check if users were found
if (-not $Users) {

    Write-Host ""
    Write-Host "No users found matching: $Search" -ForegroundColor Yellow
    Write-Host ""

}
else {

    Write-Host ""
    Write-Host "Found $($Users.Count) user(s) matching: $Search" -ForegroundColor Green
    Write-Host ""

    foreach ($User in $Users) {

        Write-Host "============================================" -ForegroundColor Cyan
        Write-Host "Display Name:   $($User.DisplayName)"
        Write-Host "UPN:            $($User.UserPrincipalName)"
        Write-Host "User Type:      $($User.UserType)"

        if ($User.AccountEnabled) {
            Write-Host "User Status:    Enabled" -ForegroundColor Green
        }
        else {
            Write-Host "User Status:    Disabled" -ForegroundColor Red
        }

        Write-Host "Business Phone: $($User.BusinessPhones -join ', ')"
        Write-Host "Mobile Phone:   $($User.MobilePhone)"
        Write-Host "============================================" -ForegroundColor Cyan
        Write-Host ""
    }
}
