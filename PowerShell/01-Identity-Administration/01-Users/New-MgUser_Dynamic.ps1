<#
.SYNOPSIS
    Dynamically creates a Microsoft Entra ID user.

.DESCRIPTION
    Prompts for user information and creates the account
    using Microsoft Graph PowerShell.

    IAM-LABS
    Identity Administration -> Users

.REQUIRED PERMISSIONS
    User.ReadWrite.All
#>

# ============================================
# CONFIGURATION
# ============================================

$RequiredScope = "User.ReadWrite.All"

# ============================================
# CONNECT TO MICROSOFT GRAPH
# ============================================

if (-not (Get-MgContext)) {

    Write-Host ""
    Write-Host "Connecting to Microsoft Graph..." -ForegroundColor Yellow

    Connect-MgGraph -Scopes $RequiredScope -NoWelcome

    Write-Host "Connected." -ForegroundColor Green
}

# ============================================
# GET USER INFORMATION
# ============================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "          CREATE NEW ENTRA USER" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$FirstName = Read-Host "First Name"
$LastName  = Read-Host "Last Name"

# ============================================
# GENERATE DISPLAY NAME
# ============================================

$DisplayName = "$FirstName $LastName"

Write-Host ""
Write-Host "Display Name: $DisplayName" -ForegroundColor Gray

# ============================================
# GENERATE MAIL NICKNAME
# ============================================

$MailNickname = "$FirstName.$LastName"

$MailNickname = $MailNickname `
    -replace '[^a-zA-Z0-9.]', ''

# ============================================
# GET UPN
# ============================================

Write-Host ""
$UserPrincipalName = Read-Host "User Principal Name"

# ============================================
# PASSWORD
# ============================================

Write-Host ""
Write-Host "Enter temporary password." -ForegroundColor Yellow

$Password = Read-Host "Temporary Password" -AsSecureString

$PasswordText = [System.Net.NetworkCredential]::new(
    "",
    $Password
).Password

$PasswordProfile = @{
    Password = $PasswordText
    ForceChangePasswordNextSignIn = $true
}

# ============================================
# ACCOUNT STATUS
# ============================================

Write-Host ""
$AccountStatus = Read-Host "Enable account? (Y/N)"

if ($AccountStatus -match "^Y$") {
    $AccountEnabled = $true
}
else {
    $AccountEnabled = $false
}

# ============================================
# OPTIONAL ATTRIBUTES
# ============================================

Write-Host ""
Write-Host "Optional Attributes" -ForegroundColor Cyan
Write-Host "Press ENTER to skip."
Write-Host ""

$JobTitle   = Read-Host "Job Title"
$Department = Read-Host "Department"
$Office     = Read-Host "Office Location"

# ============================================
# REVIEW
# ============================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Yellow
Write-Host "              USER REVIEW" -ForegroundColor Yellow
Write-Host "============================================" -ForegroundColor Yellow
Write-Host ""

Write-Host "First Name        : $FirstName"
Write-Host "Last Name         : $LastName"
Write-Host "Display Name      : $DisplayName"
Write-Host "UPN               : $UserPrincipalName"
Write-Host "Mail Nickname     : $MailNickname"
Write-Host "Account Enabled   : $AccountEnabled"
Write-Host "Job Title         : $JobTitle"
Write-Host "Department        : $Department"
Write-Host "Office            : $Office"
Write-Host ""

$Confirm = Read-Host "Create this user? (Y/N)"

if ($Confirm -notmatch "^Y$") {

    Write-Host ""
    Write-Host "User creation cancelled." -ForegroundColor Yellow
    return
}

# ============================================
# CREATE USER
# ============================================

Write-Host ""
Write-Host "Creating user..." -ForegroundColor Yellow

try {

    $NewUser = New-MgUser `
        -AccountEnabled:$AccountEnabled `
        -DisplayName $DisplayName `
        -GivenName $FirstName `
        -Surname $LastName `
        -UserPrincipalName $UserPrincipalName `
        -MailNickname $MailNickname `
        -PasswordProfile $PasswordProfile `
        -JobTitle $JobTitle `
        -Department $Department `
        -OfficeLocation $Office `
        -ErrorAction Stop

    # ========================================
    # SUCCESS
    # ========================================

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "          USER CREATED SUCCESSFULLY" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""

    Write-Host "User ID       : $($NewUser.Id)"
    Write-Host "Display Name  : $($NewUser.DisplayName)"
    Write-Host "UPN           : $($NewUser.UserPrincipalName)"
    Write-Host "Enabled       : $($NewUser.AccountEnabled)"
    Write-Host "Department    : $($NewUser.Department)"
    Write-Host ""

}
catch {

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Red
    Write-Host "           USER CREATION FAILED" -ForegroundColor Red
    Write-Host "============================================" -ForegroundColor Red
    Write-Host ""

    Write-Host $_.Exception.Message -ForegroundColor Red
}
