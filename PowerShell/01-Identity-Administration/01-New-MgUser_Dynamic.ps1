```powershell
#Requires -Modules Microsoft.Graph.Users

<#
.SYNOPSIS
    Dynamically creates a Microsoft Entra ID user using Microsoft Graph.

.DESCRIPTION
    - Connects to Microsoft Graph
    - Prompts for Display Name
    - Prompts for UPN
    - Checks whether the UPN already exists
    - Generates a temporary password
    - Creates the user
    - Displays SUCCESS or FAILED
#>

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "        MICROSOFT GRAPH USER CREATOR" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --------------------------------------------------
# Connect to Microsoft Graph
# --------------------------------------------------

try {
    Connect-MgGraph -Scopes "User.ReadWrite.All" -NoWelcome -ErrorAction Stop

    Write-Host "[+] Connected to Microsoft Graph" -ForegroundColor Green
}
catch {
    Write-Host "[-] FAILED: Could not connect to Microsoft Graph." -ForegroundColor Red
    Write-Host "    $($_.Exception.Message)" -ForegroundColor Red
    exit
}

Write-Host ""

# --------------------------------------------------
# Get user input
# --------------------------------------------------

$DisplayName = Read-Host "Enter the user's Display Name"
$UPN = Read-Host "Enter the user's UPN"

# --------------------------------------------------
# Validate input
# --------------------------------------------------

if ([string]::IsNullOrWhiteSpace($DisplayName)) {
    Write-Host ""
    Write-Host "[-] FAILED: Display Name cannot be empty." -ForegroundColor Red
    exit
}

if ([string]::IsNullOrWhiteSpace($UPN)) {
    Write-Host ""
    Write-Host "[-] FAILED: UPN cannot be empty." -ForegroundColor Red
    exit
}

# --------------------------------------------------
# Check whether UPN already exists
# --------------------------------------------------

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
    Write-Host "[-] FAILED: A user with this UPN already exists." -ForegroundColor Red
    Write-Host ""
    Write-Host "    Display Name : $($ExistingUser.DisplayName)"
    Write-Host "    UPN          : $($ExistingUser.UserPrincipalName)"
    Write-Host "    Object ID    : $($ExistingUser.Id)"
    exit
}

# --------------------------------------------------
# Generate temporary password
# --------------------------------------------------

$TempPassword = "Temp$(Get-Random -Minimum 100000 -Maximum 999999)!Aa"

# --------------------------------------------------
# Create password profile
# --------------------------------------------------

$PasswordProfile = @{
    Password = $TempPassword
    ForceChangePasswordNextSignIn = $true
}

# --------------------------------------------------
# Create the user
# --------------------------------------------------

Write-Host "[*] Creating user..." -ForegroundColor Yellow

try {

    $NewUser = New-MgUser `
        -DisplayName $DisplayName `
        -UserPrincipalName $UPN `
        -AccountEnabled:$true `
        -MailNickname (($UPN -split "@")[0]) `
        -PasswordProfile $PasswordProfile `
        -ErrorAction Stop

    # --------------------------------------------------
    # Success
    # --------------------------------------------------

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "              USER CREATED" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green

    Write-Host ""
    Write-Host "SUCCESS" -ForegroundColor Green
    Write-Host ""
    Write-Host "Display Name : $($NewUser.DisplayName)"
    Write-Host "UPN          : $($NewUser.UserPrincipalName)"
    Write-Host "Object ID    : $($NewUser.Id)"
    Write-Host "Enabled      : $($NewUser.AccountEnabled)"
    Write-Host ""
    Write-Host "Temporary Password:" -ForegroundColor Yellow
    Write-Host "$TempPassword" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "The user must change the password at the next sign-in." -ForegroundColor Cyan
}
catch {

    # --------------------------------------------------
    # Failure
    # --------------------------------------------------

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Red
    Write-Host "              USER CREATION FAILED" -ForegroundColor Red
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
