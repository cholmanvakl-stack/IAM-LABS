```powershell
#Requires -Modules Microsoft.Graph.Users

<#
.SYNOPSIS
    Searches Microsoft Entra ID users by Display Name.

.DESCRIPTION
    - Connects to Microsoft Graph
    - Prompts for a Display Name
    - Searches for matching users
    - Displays matching users
    - Allows the administrator to select a user
    - Displays a summary of the selected user
#>

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "              ENTRA USER SEARCH" -ForegroundColor Cyan
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
# GET SEARCH INPUT
# ==================================================

$SearchName = Read-Host "Enter Display Name to search"

if ([string]::IsNullOrWhiteSpace($SearchName)) {

    Write-Host ""
    Write-Host "[-] FAILED: Search value cannot be empty." -ForegroundColor Red
    exit
}

# Escape single quotes for OData
$SearchName = $SearchName.Replace("'", "''")

# ==================================================
# SEARCH USERS
# ==================================================

Write-Host ""
Write-Host "[*] Searching Microsoft Entra ID..." -ForegroundColor Yellow

try {

    $Users = Get-MgUser `
        -Filter "startsWith(displayName,'$SearchName')" `
        -Property Id,DisplayName,GivenName,Surname,UserPrincipalName,UserType,AccountEnabled `
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
    Write-Host "[-] No users found." -ForegroundColor Red
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
    Write-Host "    UPN       : $($User.UserPrincipalName)"
    Write-Host "    User Type : $($User.UserType)"
    Write-Host "    Enabled   : $($User.AccountEnabled)"
    Write-Host ""

    $Index++
}

# ==================================================
# SELECT USER
# ==================================================

$Selection = Read-Host "Select user number"

if (-not ($Selection -as [int])) {

    Write-Host ""
    Write-Host "[-] FAILED: Invalid selection." -ForegroundColor Red
    exit
}

$SelectionNumber = [int]$Selection

if (
    $SelectionNumber -lt 1 -or
    $SelectionNumber -gt $Users.Count
) {

    Write-Host ""
    Write-Host "[-] FAILED: Selection is outside the available range." -ForegroundColor Red
    exit
}

$SelectedUser = $Users[$SelectionNumber - 1]

# ==================================================
# DISPLAY SELECTED USER
# ==================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "              SELECTED USER" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Display Name : $($SelectedUser.DisplayName)"
Write-Host "First Name   : $($SelectedUser.GivenName)"
Write-Host "Last Name    : $($SelectedUser.Surname)"
Write-Host "UPN          : $($SelectedUser.UserPrincipalName)"
Write-Host "User Type    : $($SelectedUser.UserType)"
Write-Host "Enabled      : $($SelectedUser.AccountEnabled)"
Write-Host "Object ID    : $($SelectedUser.Id)"

Write-Host ""
Read-Host "Press Enter to exit"
```
