# ============================================
# IAM-LABS - MICROSOFT GRAPH STATUS
# File: Get-GraphConnectionStatus.ps1
# ============================================

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "       IAM-LABS MICROSOFT GRAPH" -ForegroundColor Cyan
Write-Host "          CONNECTION STATUS" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --------------------------------------------
# Check Microsoft Graph Module
# --------------------------------------------

Write-Host "[1] Checking Microsoft Graph module..." `
    -ForegroundColor Yellow

$GraphModule = Get-Module `
    -ListAvailable `
    -Name Microsoft.Graph |
    Sort-Object Version -Descending |
    Select-Object -First 1

if (-not $GraphModule) {

    Write-Host ""
    Write-Host "[FAILED] Microsoft.Graph is not installed." `
        -ForegroundColor Red

    Write-Host ""
    Read-Host "Press Enter to exit"
    exit
}

Write-Host "[OK] Microsoft.Graph $($GraphModule.Version)" `
    -ForegroundColor Green

Write-Host ""

# --------------------------------------------
# Check Graph Connection
# --------------------------------------------

Write-Host "[2] Checking Microsoft Graph connection..." `
    -ForegroundColor Yellow

$Context = Get-MgContext

if (-not $Context) {

    Write-Host ""
    Write-Host "============================================" `
        -ForegroundColor Yellow

    Write-Host "          GRAPH NOT CONNECTED" `
        -ForegroundColor Yellow

    Write-Host "============================================" `
        -ForegroundColor Yellow

    Write-Host ""
    Write-Host "No active Microsoft Graph connection was found." `
        -ForegroundColor Gray

    Write-Host ""
    Write-Host "Run:" -ForegroundColor Cyan
    Write-Host "    Connect-MgGraph.ps1" -ForegroundColor White

    Write-Host ""
    Read-Host "Press Enter to exit"
    exit
}

# --------------------------------------------
# Display Connection Information
# --------------------------------------------

Write-Host ""
Write-Host "============================================" `
    -ForegroundColor Green

Write-Host "           GRAPH CONNECTED" `
    -ForegroundColor Green

Write-Host "============================================" `
    -ForegroundColor Green

Write-Host ""

Write-Host "Account:" -ForegroundColor Cyan
Write-Host "    $($Context.Account)" -ForegroundColor White

Write-Host ""

Write-Host "Tenant ID:" -ForegroundColor Cyan
Write-Host "    $($Context.TenantId)" -ForegroundColor White

Write-Host ""

Write-Host "Authentication Type:" -ForegroundColor Cyan
Write-Host "    $($Context.AuthType)" -ForegroundColor White

Write-Host ""

Write-Host "App Name:" -ForegroundColor Cyan
Write-Host "    $($Context.AppName)" -ForegroundColor White

Write-Host ""

Write-Host "Scopes:" -ForegroundColor Cyan

if ($Context.Scopes) {

    foreach ($Scope in $Context.Scopes) {

        Write-Host "    [OK] $Scope" -ForegroundColor Green
    }

}
else {

    Write-Host "    No delegated scopes reported." `
        -ForegroundColor Yellow
}

Write-Host ""

# --------------------------------------------
# Test Graph Connectivity
# --------------------------------------------

Write-Host "[3] Testing Graph API access..." `
    -ForegroundColor Yellow

try {

    $TestUser = Get-MgUser `
        -Top 1 `
        -ErrorAction Stop

    Write-Host ""
    Write-Host "[OK] Microsoft Graph API is responding." `
        -ForegroundColor Green

}
catch {

    Write-Host ""
    Write-Host "[FAILED] Microsoft Graph API test failed." `
        -ForegroundColor Red

    Write-Host ""
    Write-Host "Error:" -ForegroundColor Yellow
    Write-Host $_.Exception.Message -ForegroundColor Red
}

# --------------------------------------------
# Final Status
# --------------------------------------------

Write-Host ""
Write-Host "============================================" `
    -ForegroundColor Cyan

Write-Host "             STATUS CHECK COMPLETE" `
    -ForegroundColor Green

Write-Host "============================================" `
    -ForegroundColor Cyan

Write-Host ""

Read-Host "Press Enter to exit"
