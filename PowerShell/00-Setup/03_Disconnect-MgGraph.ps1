#Requires -Modules Microsoft.Graph.Authentication

Import-Module Microsoft.Graph.Authentication

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "         DISCONNECT MICROSOFT GRAPH" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$Context = Get-MgContext

if (-not $Context) {

    Write-Host "No Microsoft Graph session is currently active." -ForegroundColor Yellow
    exit
}

Write-Host "Connected account: $($Context.Account)" -ForegroundColor Yellow
Write-Host ""

$Confirm = Read-Host "Disconnect from Microsoft Graph? (Y/N)"

if ($Confirm -notmatch "^[Yy]$") {

    Write-Host ""
    Write-Host "Disconnect cancelled." -ForegroundColor Yellow
    exit
}

try {

    Disconnect-MgGraph -ErrorAction Stop

    Write-Host ""
    Write-Host "Microsoft Graph session disconnected." -ForegroundColor Green
}
catch {

    Write-Host ""
    Write-Host "ERROR: Unable to disconnect." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}
