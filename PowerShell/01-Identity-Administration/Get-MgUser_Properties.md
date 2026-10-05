```powershell
#Requires -Modules Microsoft.Graph.Users

<#
.SYNOPSIS
    Search for a Microsoft Entra user by Display Name and view their properties.

.DESCRIPTION
    - Connects to Microsoft Graph
    - Prompts for a Display Name search
    - Automatically applies wildcards
    - Displays matching users
    - Allows the administrator to select a user
    - Displays important user properties
#>

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "       MICROSOFT GRAPH USER PROPERTIES" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# ==================================================
# CONNECT TO MICROSOFT GRAPH
# ==================================================

try {

    Connect-MgGraph `
        -Scopes "User.Read.All" `
        -NoWelcome `
        -ErrorAction Stop

    Write-Host "[+] Connected to Microsoft Graph" -ForegroundColor Green

}
catch {

    Write-Host ""
    Write-Host "[-] FAILED: Could not connect to Microsoft Graph." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit
}

Write-Host ""

# ==================================================
# SEARCH INPUT
# ==================================================

$SearchName = Read-Host "Enter the user's Display Name"

if ([string]::IsNullOrWhiteSpace($SearchName)) {

    Write-Host ""
    Write-Host "[-] FAILED: Display Name cannot be empty." -ForegroundColor Red
    exit
}

# ==================================================
# SEARCH FOR USERS
# ==================================================

Write-Host ""
Write-Host "[*] Searching for users..." -ForegroundColor Yellow

try {

    $Users = Get-MgUser `
        -Filter "startsWith(displayName,'$SearchName')" `
        -Property Id,DisplayName,GivenName,Surname,UserPrincipalName,Mail,UserType,AccountEnabled,JobTitle,Department,CompanyName,OfficeLocation,City,State,Country,MobilePhone,BusinessPhones,CreatedDateTime `
        -All `
        -ErrorAction Stop

}
catch {

    Write-Host ""
    Write-Host "[-] FAILED: User search failed." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit
}

# ==================================================
# NO RESULTS
# ==================================================

if (-not $Users) {

    Write-Host ""
    Write-Host "[-] No users found matching '$SearchName'." -ForegroundColor Red
    exit
}

# ==================================================
# DISPLAY RESULTS
# ==================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "             SEARCH RESULTS" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$Index = 1

foreach ($User in $Users) {

    Write-Host "[$Index] $($User.DisplayName)" -ForegroundColor Yellow
    Write-Host "    UPN      : $($User.UserPrincipalName)"
    Write-Host "    User Type: $($User.UserType)"
    Write-Host "    Object ID: $($User.Id)"
    Write-Host ""

    $Index++
}

# ==================================================
# USER SELECTION
# ==================================================

$Selection = Read-Host "Select the user number"

# Validate selection

if (-not ($Selection -as [int])) {

    Write-Host ""
    Write-Host "[-] FAILED: Invalid selection." -ForegroundColor Red
    exit
}

$SelectionNumber = [int]$Selection

if ($SelectionNumber -lt 1 -or $SelectionNumber -gt $Users.Count) {

    Write-Host ""
    Write-Host "[-] FAILED: Selection is outside the available range." -ForegroundColor Red
    exit
}

# Get selected user

$SelectedUser = $Users[$SelectionNumber - 1]

# ==================================================
# DISPLAY USER PROPERTIES
# ==================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "             USER PROPERTIES" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

Write-Host "IDENTITY" -ForegroundColor Cyan
Write-Host "--------------------------------------------"

Write-Host "Display Name       : $($SelectedUser.DisplayName)"
Write-Host "First Name         : $($SelectedUser.GivenName)"
Write-Host "Last Name          : $($SelectedUser.Surname)"
Write-Host "UPN                : $($SelectedUser.UserPrincipalName)"
Write-Host "Mail               : $($SelectedUser.Mail)"
Write-Host "User Type          : $($SelectedUser.UserType)"
Write-Host "Object ID          : $($SelectedUser.Id)"

Write-Host ""

Write-Host "ACCOUNT" -ForegroundColor Cyan
Write-Host "--------------------------------------------"

if ($SelectedUser.AccountEnabled -eq $true) {
    Write-Host "Account Status     : Enabled" -ForegroundColor Green
}
else {
    Write-Host "Account Status     : Disabled" -ForegroundColor Red
}

Write-Host "Created            : $($SelectedUser.CreatedDateTime)"

Write-Host ""

Write-Host "ORGANIZATION" -ForegroundColor Cyan
Write-Host "--------------------------------------------"

Write-Host "Job Title          : $($SelectedUser.JobTitle)"
Write-Host "Department         : $($SelectedUser.Department)"
Write-Host "Company            : $($SelectedUser.CompanyName)"
Write-Host "Office             : $($SelectedUser.OfficeLocation)"

Write-Host ""

Write-Host "LOCATION" -ForegroundColor Cyan
Write-Host "--------------------------------------------"

Write-Host "City               : $($SelectedUser.City)"
Write-Host "State              : $($SelectedUser.State)"
Write-Host "Country            : $($SelectedUser.Country)"

Write-Host ""

Write-Host "CONTACT" -ForegroundColor Cyan
Write-Host "--------------------------------------------"

Write-Host "Mobile Phone       : $($SelectedUser.MobilePhone)"

if ($SelectedUser.BusinessPhones) {

    Write-Host "Business Phone(s)  : $($SelectedUser.BusinessPhones -join ', ')"

}
else {

    Write-Host "Business Phone(s)  :"

}

Write-Host ""

Write-Host "============================================" -ForegroundColor Green
Write-Host "             END USER PROPERTIES" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green

Write-Host ""
Read-Host "Press Enter to exit"
```
