#Requires -Version 5.1

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "       MICROSOFT ENTRA MODULE INSTALLER" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$ModuleName = "Microsoft.Entra"

Write-Host "Checking for Microsoft.Entra..." -ForegroundColor Yellow

$Installed = Get-Module `
    -Name $ModuleName `
    -ListAvailable

if ($Installed) {

    $Version = ($Installed |
        Sort-Object Version -Descending |
        Select-Object -First 1).Version

    Write-Host ""
    Write-Host "Microsoft.Entra is already installed." -ForegroundColor Green
    Write-Host "Version: $Version"
    exit
}

Write-Host ""
Write-Host "Microsoft.Entra is not installed." -ForegroundColor Yellow
Write-Host "Installing from PSGallery..." -ForegroundColor Yellow
Write-Host ""

try {

    Install-Module `
        -Name $ModuleName `
        -Repository PSGallery `
        -Scope CurrentUser `
        -Force `
        -AllowClobber `
        -ErrorAction Stop

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "       ENTRA MODULE INSTALLED" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""

    $Installed = Get-Module `
        -Name $ModuleName `
        -ListAvailable

    $Version = ($Installed |
        Sort-Object Version -Descending |
        Select-Object -First 1).Version

    Write-Host "Version: $Version"

}
catch {

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Red
    Write-Host "       ENTRA INSTALLATION FAILED" -ForegroundColor Red
    Write-Host "============================================" -ForegroundColor Red
    Write-Host ""

    Write-Host $_.Exception.Message -ForegroundColor Red
}
