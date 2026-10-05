#Requires -Modules Microsoft.Entra.Authentication

Import-Module Microsoft.Entra.Authentication

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "          DISCONNECT MICROSOFT ENTRA" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$Context = Get-MgContext

if (-not $Context) {

    Write-Host "No Entra/Graph session is currently active." -ForegroundColor Yellow
    exit
}

Write-Host "Connected account: $($Context.Account)" -ForegroundColor Yellow
Write-Host ""

$Confirm = Read-Host "Disconnect from Microsoft Entra? (Y/N)"

if ($Confirm -notmatch "^[Yy]$") {

    Write-Host ""
    Write-Host "Disconnect cancelled." -ForegroundColor Yellow
    exit
}

try {

    Disconnect-Entra

    Write-Host ""
    Write-Host "Microsoft Entra session disconnected." -ForegroundColor Green
}
catch {

    Write-Host ""
    Write-Host "ERROR: Unable to disconnect." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}
