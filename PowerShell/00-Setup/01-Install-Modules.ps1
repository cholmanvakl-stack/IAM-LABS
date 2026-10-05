# ============================================
# IAM-LABS - MODULE INSTALLATION
# File: Install-Modules.ps1
# ============================================

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "           IAM-LABS MODULE SETUP" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Required PowerShell modules
$RequiredModules = @(
    "Microsoft.Graph"
)

# --------------------------------------------
# Check PowerShell Version
# --------------------------------------------

Write-Host "[1] PowerShell Version" -ForegroundColor Yellow

Write-Host "    $($PSVersionTable.PSVersion)" -ForegroundColor Gray

Write-Host ""

# --------------------------------------------
# Check PowerShell Gallery
# --------------------------------------------

Write-Host "[2] Checking PowerShell Gallery..." -ForegroundColor Yellow

try {
    $PSGallery = Get-PSRepository -Name "PSGallery" -ErrorAction Stop

    Write-Host "    PSGallery found." -ForegroundColor Green
}
catch {
    Write-Host "    PSGallery not found. Registering..." -ForegroundColor Yellow

    try {
        Register-PSRepository -Default -ErrorAction Stop

        Write-Host "    PSGallery registered successfully." -ForegroundColor Green
    }
    catch {
        Write-Host "    Failed to register PSGallery." -ForegroundColor Red
        Write-Host "    $($_.Exception.Message)" -ForegroundColor Red

        exit 1
    }
}

Write-Host ""

# --------------------------------------------
# Install / Verify Modules
# --------------------------------------------

Write-Host "[3] Checking Required Modules..." -ForegroundColor Yellow
Write-Host ""

foreach ($Module in $RequiredModules) {

    Write-Host "    Module: $Module" -ForegroundColor Cyan

    $InstalledModule = Get-Module `
        -ListAvailable `
        -Name $Module |
        Sort-Object Version -Descending |
        Select-Object -First 1

    if ($InstalledModule) {

        Write-Host "    Status : INSTALLED" -ForegroundColor Green
        Write-Host "    Version: $($InstalledModule.Version)" -ForegroundColor Gray

    }
    else {

        Write-Host "    Status : NOT INSTALLED" -ForegroundColor Yellow
        Write-Host "    Installing..." -ForegroundColor Yellow

        try {

            Install-Module `
                -Name $Module `
                -Scope CurrentUser `
                -Repository PSGallery `
                -Force `
                -AllowClobber `
                -ErrorAction Stop

            Write-Host "    Installation successful." -ForegroundColor Green

        }
        catch {

            Write-Host "    Installation FAILED." -ForegroundColor Red
            Write-Host "    $($_.Exception.Message)" -ForegroundColor Red
        }
    }

    Write-Host ""
}

# --------------------------------------------
# Final Verification
# --------------------------------------------

Write-Host "[4] Final Verification" -ForegroundColor Yellow
Write-Host ""

$SetupSuccessful = $true

foreach ($Module in $RequiredModules) {

    $InstalledModule = Get-Module `
        -ListAvailable `
        -Name $Module |
        Sort-Object Version -Descending |
        Select-Object -First 1

    if ($InstalledModule) {

        Write-Host "[OK] $Module - Version $($InstalledModule.Version)" `
            -ForegroundColor Green

    }
    else {

        Write-Host "[FAILED] $Module" `
            -ForegroundColor Red

        $SetupSuccessful = $false
    }
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan

if ($SetupSuccessful) {

    Write-Host "        MODULE SETUP COMPLETE" `
        -ForegroundColor Green

}
else {

    Write-Host "        MODULE SETUP INCOMPLETE" `
        -ForegroundColor Red
}

Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

Read-Host "Press Enter to exit"
