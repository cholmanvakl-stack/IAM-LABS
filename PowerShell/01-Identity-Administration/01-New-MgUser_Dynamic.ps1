```powershell
#Requires -Modules Microsoft.Graph.Users, Microsoft.Graph.Identity.DirectoryManagement

<#
.SYNOPSIS
    Dynamically creates a Microsoft Entra ID user using Microsoft Graph.

.DESCRIPTION
    Prompts for:
        - First Name
        - Last Name
        - UPN format

    Automatically:
        - Creates Display Name
        - Generates the UPN prefix
        - Detects the tenant's default domain
        - Builds the complete UPN
        - Generates a temporary password
        - Creates the user
        - Displays SUCCESS or FAILED
#>

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "        MICROSOFT GRAPH USER CREATOR" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# ==================================================
# CONNECT TO MICROSOFT GRAPH
# ==================================================

try {

    Connect-MgGraph `
        -Scopes "User.ReadWrite.All", "Domain.Read.All" `
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
# GET TENANT PRIMARY DOMAIN
# ==================================================

Write-Host "[*] Detecting tenant primary domain..." -ForegroundColor Yellow

try {

    $PrimaryDomain = Get-MgDomain -ErrorAction Stop |
        Where-Object { $_.IsDefault -eq $true } |
        Select-Object -First 1

    if (-not $PrimaryDomain) {
        throw "No default domain was found."
    }

    $DomainName = $PrimaryDomain.Id

    Write-Host "[+] Primary domain: $DomainName" -ForegroundColor Green

}
catch {

    Write-Host ""
    Write-Host "[-] FAILED: Could not determine the tenant primary domain." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit
}

Write-Host ""

# ==================================================
# GET FIRST AND LAST NAME
# ==================================================

$FirstName = Read-Host "Enter First Name"
$LastName  = Read-Host "Enter Last Name"

# ==================================================
# VALIDATE NAME INPUT
# ==================================================

if ([string]::IsNullOrWhiteSpace($FirstName)) {

    Write-Host ""
    Write-Host "[-] FAILED: First Name cannot be empty." -ForegroundColor Red
    exit
}

if ([string]::IsNullOrWhiteSpace($LastName)) {

    Write-Host ""
    Write-Host "[-] FAILED: Last Name cannot be empty." -ForegroundColor Red
    exit
}

# ==================================================
# CREATE DISPLAY NAME
# ==================================================

$DisplayName = "$FirstName $LastName"

# ==================================================
# UPN FORMAT MENU
# ==================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "              SELECT UPN FORMAT" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "1. First Initial + Last Name"
Write-Host "   Example: John Smith -> jsmith"

Write-Host ""

Write-Host "2. First Name + Last Name"
Write-Host "   Example: John Smith -> johnsmith"

Write-Host ""

Write-Host "3. First Name + '.' + Last Name"
Write-Host "   Example: John Smith -> john.smith"

Write-Host ""

Write-Host "4. First Initial + '.' + Last Name"
Write-Host "   Example: John Smith -> j.smith"

Write-Host ""

$FormatChoice = Read-Host "Select UPN format (1-4)"

# ==================================================
# GENERATE UPN PREFIX
# ==================================================

$FirstNameClean = $FirstName.Trim().ToLower()
$LastNameClean  = $LastName.Trim().ToLower()

switch ($FormatChoice) {

    "1" {
        # jsmith
        $UPNPrefix = $FirstNameClean.Substring(0,1) + $LastNameClean
        $FormatName = "First Initial + Last Name"
    }

    "2" {
        # johnsmith
        $UPNPrefix = $FirstNameClean + $LastNameClean
        $FormatName = "First Name + Last Name"
    }

    "3" {
        # john.smith
        $UPNPrefix = "$FirstNameClean.$LastNameClean"
        $FormatName = "First Name + '.' + Last Name"
    }

    "4" {
        # j.smith
        $UPNPrefix = "$($FirstNameClean.Substring(0,1)).$LastNameClean"
        $FormatName = "First Initial + '.' + Last Name"
    }

    default {

        Write-Host ""
        Write-Host "[-] FAILED: Invalid UPN format selected." -ForegroundColor Red
        exit
    }
}

# ==================================================
# BUILD COMPLETE UPN
# ==================================================

$UPN = "$UPNPrefix@$DomainName"

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "              GENERATED USER" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "First Name   : $FirstName"
Write-Host "Last Name    : $LastName"
Write-Host "Display Name : $DisplayName"
Write-Host "UPN Format   : $FormatName"
Write-Host "UPN          : $UPN"

# ==================================================
# CHECK IF USER ALREADY EXISTS
# ==================================================

Write-Host ""
Write-Host "[*] Checking whether the UPN already exists..." -ForegroundColor Yellow

try {

    $ExistingUser = Get-MgUser `
        -UserId $UPN `
        -ErrorAction SilentlyContinue

}
catch {

    $ExistingUser = $null
}

if ($ExistingUser) {

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Red
    Write-Host "          USER ALREADY EXISTS" -ForegroundColor Red
    Write-Host "============================================" -ForegroundColor Red

    Write-Host ""
    Write-Host "Display Name : $($ExistingUser.DisplayName)"
    Write-Host "UPN          : $($ExistingUser.UserPrincipalName)"
    Write-Host "Object ID    : $($ExistingUser.Id)"

    exit
}

# ==================================================
# GENERATE TEMPORARY PASSWORD
# ==================================================

$TempPassword = "Temp$(Get-Random -Minimum 100000 -Maximum 999999)!Aa"

$PasswordProfile = @{
    Password = $TempPassword
    ForceChangePasswordNextSignIn = $true
}

# ==================================================
# CREATE USER
# ==================================================

Write-Host ""
Write-Host "[*] Creating user..." -ForegroundColor Yellow

try {

    $NewUser = New-MgUser `
        -DisplayName $DisplayName `
        -GivenName $FirstName `
        -Surname $LastName `
        -UserPrincipalName $UPN `
        -MailNickname $UPNPrefix `
        -AccountEnabled:$true `
        -PasswordProfile $PasswordProfile `
        -ErrorAction Stop

    # ==================================================
    # SUCCESS
    # ==================================================

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "              USER CREATED" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green

    Write-Host ""
    Write-Host "SUCCESS" -ForegroundColor Green
    Write-Host ""

    Write-Host "Display Name : $($NewUser.DisplayName)"
    Write-Host "First Name   : $($NewUser.GivenName)"
    Write-Host "Last Name    : $($NewUser.Surname)"
    Write-Host "UPN          : $($NewUser.UserPrincipalName)"
    Write-Host "Object ID    : $($NewUser.Id)"
    Write-Host "Enabled      : $($NewUser.AccountEnabled)"

    Write-Host ""
    Write-Host "Temporary Password:" -ForegroundColor Yellow
    Write-Host $TempPassword -ForegroundColor Yellow

    Write-Host ""
    Write-Host "The user must change the password at the next sign-in." -ForegroundColor Cyan

}
catch {

    # ==================================================
    # FAILURE
    # ==================================================

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Red
    Write-Host "          USER CREATION FAILED" -ForegroundColor Red
    Write-Host "============================================" -ForegroundColor Red

    Write-Host ""
    Write-Host "FAILED" -ForegroundColor Red
    Write-Host ""

    Write-Host "Display Name : $DisplayName"
    Write-Host "UPN          : $UPN"

    Write-Host ""
    Write-Host "Error:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

Write-Host ""
Read-Host "Press Enter to exit"
```
