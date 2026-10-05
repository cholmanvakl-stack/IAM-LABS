# ============================================
# IAM-LABS - MICROSOFT GRAPH DISCONNECT
# File: Disconnect-MgGraph.ps1
# ============================================

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "       IAM-LABS MICROSOFT GRAPH" -ForegroundColor Cyan
Write-Host "             DISCONNECT TOOL" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --------------------------------------------
# Check Current Graph Connection
# --------------------------------------------

Write-Host "[1] Checking Microsoft Graph connection..." `
    -ForegroundColor Yellow

$Context = Get-MgContext

if (-not $Context) {

    Write-Host ""
    Write-Host "No Microsoft Graph connection is currently active." `
        -ForegroundColor Yellow

    Write-Host ""
    Read-Host "Press Enter to exit"
    exit
}

# --------------------------------------------
# Display Current Connection
# --------------------------------------------

Write-Host ""
Write-Host "Current Graph Connection:" -ForegroundColor Cyan

Write-Host "    Account : $($Context.Account)" `
    -ForegroundColor White

Write-Host "    Tenant  : $($Context.TenantId)" `
    -ForegroundColor White

Write-Host ""

# --------------------------------------------
# Confirm Disconnect
# --------------------------------------------

$Confirmation = Read-Host "Disconnect from Microsoft Graph? (Y/N)"

if ($Confirmation -notmatch "^[Yy]$") {

    Write-Host ""
    Write-Host "Disconnect cancelled." `
        -ForegroundColor Yellow

    Write-Host ""
    Read-Host "Press Enter to exit"
    exit
}

# --------------------------------------------
# Disconnect
# --------------------------------------------

Write-Host ""
Write-Host "[2] Disconnecting from Microsoft Graph..." `
    -ForegroundColor Yellow

try {

    Disconnect-MgGraph -ErrorAction Stop | Out-Null

    Write-Host ""
    Write-Host "Microsoft Graph disconnected successfully." `
        -ForegroundColor Green

}
catch {

    Write-Host ""
    Write-Host "Failed to disconnect from Microsoft Graph." `
        -ForegroundColor Red

    Write-Host ""
    Write-Host "Error:" -ForegroundColor Yellow
    Write-Host $_.Exception.Message -ForegroundColor Red

    Write-Host ""
    Read-Host "Press Enter to exit"
    exit
}

# --------------------------------------------
# Verify Disconnect
# --------------------------------------------

Write-Host ""
Write-Host "[3] Verifying disconnect..." `
    -ForegroundColor Yellow

$Context = Get-MgContext

if (-not $Context) {

    Write-Host ""
    Write-Host "[OK] No active Microsoft Graph connection." `
        -ForegroundColor Green

}
else {

    Write-Host ""
    Write-Host "[WARNING] A Graph connection is still active." `
        -ForegroundColor Yellow
}

# --------------------------------------------
# Final Status
# --------------------------------------------

Write-Host ""
Write-Host "============================================" `
    -ForegroundColor Cyan

Write-Host "          GRAPH DISCONNECT COMPLETE" `
    -ForegroundColor Green

Write-Host "============================================" `
    -ForegroundColor Cyan

Write-Host ""

Read-Host "Press Enter to exit"
