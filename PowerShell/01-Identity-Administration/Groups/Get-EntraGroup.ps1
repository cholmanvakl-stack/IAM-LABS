#Requires -Modules Microsoft.Entra.Groups

Import-Module Microsoft.Entra.Groups

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "             SEARCH ENTRA GROUP" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# ------------------------------------------------------------
# CONNECT TO ENTRA
# ------------------------------------------------------------

Write-Host "Connecting to Microsoft Entra ID..." -ForegroundColor Yellow

try {
    Connect-Entra -Scopes "Group.Read.All" -ErrorAction Stop
}
catch {
    Write-Host ""
    Write-Host "ERROR: Unable to connect to Microsoft Entra ID." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# SEARCH INPUT
# ------------------------------------------------------------

Write-Host ""

$SearchName = Read-Host "Enter group name"

if ([string]::IsNullOrWhiteSpace($SearchName)) {

    Write-Host ""
    Write-Host "ERROR: Group name is required." -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# SEARCH ENTRA GROUPS
# ------------------------------------------------------------

Write-Host ""
Write-Host "Searching Microsoft Entra ID..." -ForegroundColor Yellow

try {

    $Groups = Get-EntraGroup `
        -Filter "startsWith(displayName,'$SearchName')" `
        -All `
        -ErrorAction Stop |
        Sort-Object DisplayName

}
catch {

    Write-Host ""
    Write-Host "ERROR: Unable to search Microsoft Entra groups." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# NO RESULTS
# ------------------------------------------------------------

if (-not $Groups) {

    Write-Host ""
    Write-Host "No groups found matching: $SearchName" -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# DISPLAY SEARCH RESULTS
# ------------------------------------------------------------

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "              SEARCH RESULTS" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$Index = 1

foreach ($Group in $Groups) {

    Write-Host "[$Index] $($Group.DisplayName)" -ForegroundColor Yellow

    Write-Host "    Group ID : $($Group.Id)"

    if ($Group.Description) {
        Write-Host "    Description : $($Group.Description)"
    }

    Write-Host ""

    $Index++
}

# ------------------------------------------------------------
# SELECT GROUP
# ------------------------------------------------------------

$Selection = Read-Host "Select group number"

if (-not ($Selection -as [int])) {

    Write-Host ""
    Write-Host "ERROR: Invalid selection." -ForegroundColor Red
    exit
}

$Selection = [int]$Selection

if ($Selection -lt 1 -or $Selection -gt $Groups.Count) {

    Write-Host ""
    Write-Host "ERROR: Selection is outside the available range." -ForegroundColor Red
    exit
}

$SelectedGroup = $Groups[$Selection - 1]

# ------------------------------------------------------------
# GET SELECTED GROUP
# ------------------------------------------------------------

Write-Host ""
Write-Host "Retrieving group details..." -ForegroundColor Yellow

try {

    $GroupDetails = Get-EntraGroup `
        -GroupId $SelectedGroup.Id `
        -ErrorAction Stop

}
catch {

    Write-Host ""
    Write-Host "ERROR: Unable to retrieve group details." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# DISPLAY SELECTED GROUP
# ------------------------------------------------------------

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "             SELECTED GROUP" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Display Name : $($GroupDetails.DisplayName)"
Write-Host "Group ID     : $($GroupDetails.Id)"
Write-Host "Description  : $($GroupDetails.Description)"
Write-Host "Mail         : $($GroupDetails.Mail)"
Write-Host "Mail Nickname: $($GroupDetails.MailNickname)"
Write-Host ""

Write-Host "============================================" -ForegroundColor Green
Write-Host "              SEARCH COMPLETE" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
