#Requires -Modules Microsoft.Graph.Authentication

Import-Module Microsoft.Graph.Authentication

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "       MICROSOFT GRAPH CONNECTION STATUS" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$Context = Get-MgContext

if (-not $Context) {

    Write-Host "STATUS: NOT CONNECTED" -ForegroundColor Red
    Write-Host ""
    Write-Host "No Microsoft Graph session is currently active." -ForegroundColor Yellow
    exit
}

Write-Host "STATUS: CONNECTED" -ForegroundColor Green
Write-Host ""

Write-Host "Account : $($Context.Account)"
Write-Host "Tenant  : $($Context.TenantId)"
Write-Host "App ID  : $($Context.ClientId)"
Write-Host ""

Write-Host "Scopes:" -ForegroundColor Cyan

if ($Context.Scopes) {

    foreach ($Scope in $Context.Scopes) {
        Write-Host "  $Scope"
    }
}
else {

    Write-Host "  No delegated scopes reported." -ForegroundColor Yellow
}

Write-Host ""
