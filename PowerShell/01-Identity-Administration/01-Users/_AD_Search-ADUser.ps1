#Requires -Modules ActiveDirectory

Import-Module ActiveDirectory

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "          SEARCH ACTIVE DIRECTORY USER" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# ------------------------------------------------------------
# SEARCH INPUT
# ------------------------------------------------------------

$SearchName = Read-Host "Enter user's Display Name"

if ([string]::IsNullOrWhiteSpace($SearchName)) {

    Write-Host ""
    Write-Host "ERROR: Display Name is required." -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# SEARCH ACTIVE DIRECTORY
# ------------------------------------------------------------

Write-Host ""
Write-Host "Searching Active Directory..." -ForegroundColor Yellow

try {

    $Users = Get-ADUser `
        -Filter "DisplayName -like '*$SearchName*'" `
        -Properties DisplayName,GivenName,Surname,
                    UserPrincipalName,SamAccountName,
                    UserAccountControl,Enabled,UserType `
        -ErrorAction Stop |
        Sort-Object DisplayName

}
catch {

    Write-Host ""
    Write-Host "ERROR: Unable to search Active Directory." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# NO RESULTS
# ------------------------------------------------------------

if (-not $Users) {

    Write-Host ""
    Write-Host "No users found matching: $SearchName" -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# DISPLAY RESULTS
# ------------------------------------------------------------

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "              SEARCH RESULTS" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$Index = 1

foreach ($User in $Users) {

    Write-Host "[$Index] $($User.DisplayName)" -ForegroundColor Yellow
    Write-Host "    Username : $($User.SamAccountName)"
    Write-Host "    UPN      : $($User.UserPrincipalName)"
    Write-Host "    Enabled  : $($User.Enabled)"
    Write-Host ""

    $Index++
}

# ------------------------------------------------------------
# SELECT USER
# ------------------------------------------------------------

$Selection = Read-Host "Select user number"

if (-not ($Selection -as [int])) {

    Write-Host ""
    Write-Host "ERROR: Invalid selection." -ForegroundColor Red
    exit
}

$Selection = [int]$Selection

if ($Selection -lt 1 -or $Selection -gt $Users.Count) {

    Write-Host ""
    Write-Host "ERROR: Selection is outside the available range." -ForegroundColor Red
    exit
}

$SelectedUser = $Users[$Selection - 1]

# ------------------------------------------------------------
# DISPLAY SELECTED USER
# ------------------------------------------------------------

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "             SELECTED USER" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Display Name : $($SelectedUser.DisplayName)"
Write-Host "First Name   : $($SelectedUser.GivenName)"
Write-Host "Last Name    : $($SelectedUser.Surname)"
Write-Host "Username     : $($SelectedUser.SamAccountName)"
Write-Host "UPN          : $($SelectedUser.UserPrincipalName)"
Write-Host "Enabled      : $($SelectedUser.Enabled)"
Write-Host "Distinguished Name:"
Write-Host "  $($SelectedUser.DistinguishedName)"

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "              SEARCH COMPLETE" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
