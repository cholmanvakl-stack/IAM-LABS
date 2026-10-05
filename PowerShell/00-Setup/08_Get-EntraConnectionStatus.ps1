#Requires -Modules Microsoft.Entra.Authentication

Import-Module Microsoft.Entra.Authentication

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "        ENTRA CONNECTION STATUS" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$Context = Get-MgContext

if (-not $Context) {

    Write-Host "STATUS: NOT CONNECTED" -ForegroundColor Red
    Write-Host ""
    Write-Host "No Microsoft Entra authentication session is active." -ForegroundColor Yellow
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
