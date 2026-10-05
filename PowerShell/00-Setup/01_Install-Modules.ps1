#Requires -Version 5.1

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "           IAM-LABS MODULE INSTALLER" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$Modules = @(
    "Microsoft.Graph",
    "Microsoft.Entra",
    "ActiveDirectory"
)

foreach ($Module in $Modules) {

    Write-Host "Checking: $Module" -ForegroundColor Yellow

    $Installed = Get-Module -Name $Module -ListAvailable

    if ($Installed) {

        $Version = ($Installed |
            Sort-Object Version -Descending |
            Select-Object -First 1).Version

        Write-Host "  Installed: $Version" -ForegroundColor Green
        Write-Host ""

        continue
    }

    Write-Host "  Module not found. Installing..." -ForegroundColor Yellow

    try {

        if ($Module -eq "ActiveDirectory") {

            Write-Host "  ActiveDirectory is normally installed through" -ForegroundColor Gray
            Write-Host "  Windows RSAT/AD DS tools rather than PSGallery." -ForegroundColor Gray
            Write-Host ""

            continue
        }

        Install-Module `
            -Name $Module `
            -Repository PSGallery `
            -Scope CurrentUser `
            -Force `
            -AllowClobber `
            -ErrorAction Stop

        Write-Host "  Installation successful." -ForegroundColor Green
    }
    catch {

        Write-Host "  Installation failed." -ForegroundColor Red
        Write-Host "  $($_.Exception.Message)" -ForegroundColor Red
    }

    Write-Host ""
}

Write-Host "============================================" -ForegroundColor Green
Write-Host "             INSTALLATION CHECK" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

foreach ($Module in $Modules) {

    $Installed = Get-Module -Name $Module -ListAvailable

    if ($Installed) {
        $Version = ($Installed |
            Sort-Object Version -Descending |
            Select-Object -First 1).Version

        Write-Host "[OK] $Module - $Version" -ForegroundColor Green
    }
    else {
        Write-Host "[--] $Module - Not installed" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Setup check complete." -ForegroundColor Cyan
