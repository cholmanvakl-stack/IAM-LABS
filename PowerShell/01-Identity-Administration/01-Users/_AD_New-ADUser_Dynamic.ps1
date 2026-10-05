#Requires -Modules ActiveDirectory

Import-Module ActiveDirectory

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "        NEW ON-PREM AD USER" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Get domain information
$Domain = Get-ADDomain
$DomainDNS = $Domain.DNSRoot

Write-Host "Domain: $DomainDNS" -ForegroundColor Gray
Write-Host ""

# ------------------------------------------------------------
# USER INFORMATION
# ------------------------------------------------------------

$FirstName = Read-Host "Enter first name"
$LastName  = Read-Host "Enter last name"

if ([string]::IsNullOrWhiteSpace($FirstName) -or
    [string]::IsNullOrWhiteSpace($LastName)) {

    Write-Host ""
    Write-Host "ERROR: First name and last name are required." -ForegroundColor Red
    exit
}

$DisplayName = "$FirstName $LastName"

Write-Host ""
Write-Host "Select username format:" -ForegroundColor Yellow
Write-Host "1. First Initial + Last Name     (jsmith)"
Write-Host "2. First Name + Last Name        (johnsmith)"
Write-Host "3. First Name.Last Name          (john.smith)"
Write-Host "4. First Initial.Last Name       (j.smith)"
Write-Host ""

$UsernameFormat = Read-Host "Enter selection (1-4)"

switch ($UsernameFormat) {

    "1" {
        $SamAccountName = (
            $FirstName.Substring(0,1) + $LastName
        ).ToLower()
    }

    "2" {
        $SamAccountName = (
            $FirstName + $LastName
        ).ToLower()
    }

    "3" {
        $SamAccountName = (
            $FirstName + "." + $LastName
        ).ToLower()
    }

    "4" {
        $SamAccountName = (
            $FirstName.Substring(0,1) + "." + $LastName
        ).ToLower()
    }

    default {
        Write-Host ""
        Write-Host "ERROR: Invalid username format." -ForegroundColor Red
        exit
    }
}

$UserPrincipalName = "$SamAccountName@$DomainDNS"

# ------------------------------------------------------------
# CHECK FOR EXISTING USER
# ------------------------------------------------------------

Write-Host ""
Write-Host "Checking whether the account already exists..." -ForegroundColor Yellow

$ExistingUser = Get-ADUser `
    -Filter "SamAccountName -eq '$SamAccountName'" `
    -ErrorAction SilentlyContinue

if ($ExistingUser) {

    Write-Host ""
    Write-Host "ERROR: User already exists." -ForegroundColor Red
    Write-Host "Username: $SamAccountName" -ForegroundColor Red
    Write-Host "UPN:      $UserPrincipalName" -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# PASSWORD
# ------------------------------------------------------------

Write-Host ""
$Password = Read-Host "Enter temporary password" -AsSecureString

# ------------------------------------------------------------
# OPTIONAL INFORMATION
# ------------------------------------------------------------

Write-Host ""
Write-Host "Optional user information" -ForegroundColor Yellow

$Department = Read-Host "Department"
$JobTitle   = Read-Host "Job title"
$Office     = Read-Host "Office"

# ------------------------------------------------------------
# CREATE USER
# ------------------------------------------------------------

Write-Host ""
Write-Host "Creating Active Directory account..." -ForegroundColor Yellow

try {

    New-ADUser `
        -Name $DisplayName `
        -GivenName $FirstName `
        -Surname $LastName `
        -DisplayName $DisplayName `
        -SamAccountName $SamAccountName `
        -UserPrincipalName $UserPrincipalName `
        -Department $Department `
        -Title $JobTitle `
        -Office $Office `
        -AccountPassword $Password `
        -Enabled $true `
        -ChangePasswordAtLogon $true `
        -PassThru `
        -ErrorAction Stop | Out-Null

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "              USER CREATED" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""

    Write-Host "Display Name : $DisplayName"
    Write-Host "Username     : $SamAccountName"
    Write-Host "UPN          : $UserPrincipalName"
    Write-Host "Domain       : $DomainDNS"
    Write-Host "Department   : $Department"
    Write-Host "Job Title    : $JobTitle"
    Write-Host ""

}
catch {

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Red
    Write-Host "              CREATION FAILED" -ForegroundColor Red
    Write-Host "============================================" -ForegroundColor Red
    Write-Host ""

    Write-Host $_.Exception.Message -ForegroundColor Red
}
