#Requires -Modules Microsoft.Entra.Authentication

Import-Module Microsoft.Entra.Authentication

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "       CONNECT TO MICROSOFT ENTRA ID" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Select permission level:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Read users"
Write-Host "2. Manage users"
Write-Host "3. Read groups"
Write-Host "4. Manage groups"
Write-Host "5. User + group administration"
Write-Host "6. Custom scopes"
Write-Host ""

$Selection = Read-Host "Select option"

switch ($Selection) {

    "1" {
        $Scopes = @(
            "User.Read.All"
        )
    }

    "2" {
        $Scopes = @(
            "User.ReadWrite.All"
        )
    }

    "3" {
        $Scopes = @(
            "Group.Read.All"
        )
    }

    "4" {
        $Scopes = @(
            "Group.ReadWrite.All"
        )
    }

    "5" {
        $Scopes = @(
            "User.ReadWrite.All",
            "Group.ReadWrite.All"
        )
    }

    "6" {

        $CustomScopes = Read-Host "Enter scopes separated by commas"

        $Scopes = $CustomScopes -split "," |
            ForEach-Object { $_.Trim() }
    }

    default {

        Write-Host ""
        Write-Host "ERROR: Invalid selection." -ForegroundColor Red
        exit
    }
}

Write-Host ""
Write-Host "Connecting to Microsoft Entra ID..." -ForegroundColor Yellow

try {

    Connect-Entra `
        -Scopes $Scopes `
        -ErrorAction Stop

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "       ENTRA CONNECTION SUCCESSFUL" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""

    Write-Host "Microsoft Entra PowerShell session established." -ForegroundColor Green

}
catch {

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Red
    Write-Host "         ENTRA CONNECTION FAILED" -ForegroundColor Red
    Write-Host "============================================" -ForegroundColor Red
    Write-Host ""

    Write-Host $_.Exception.Message -ForegroundColor Red
}
