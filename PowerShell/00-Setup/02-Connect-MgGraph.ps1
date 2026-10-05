# ============================================
# IAM-LABS - MICROSOFT GRAPH CONNECTION
# File: Connect-MgGraph.ps1
# ============================================

Clear-Host

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "        IAM-LABS MICROSOFT GRAPH" -ForegroundColor Cyan
Write-Host "             CONNECTION TOOL" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --------------------------------------------
# Required Microsoft Graph Module
# --------------------------------------------

Write-Host "[1] Checking Microsoft Graph module..." -ForegroundColor Yellow

$GraphModule = Get-Module `
    -ListAvailable `
    -Name Microsoft.Graph |
    Sort-Object Version -Descending |
    Select-Object -First 1

if (-not $GraphModule) {

    Write-Host "    Microsoft.Graph is not installed." -ForegroundColor Red
    Write-Host ""
    Write-Host "    Run Install-Modules.ps1 first." -ForegroundColor Yellow
    Write-Host ""

    Read-Host "Press Enter to exit"
    exit
}

Write-Host "    Microsoft.Graph $($GraphModule.Version) found." `
    -ForegroundColor Green

Write-Host ""

# --------------------------------------------
# Import Microsoft Graph
# --------------------------------------------

Write-Host "[2] Loading Microsoft Graph..." -ForegroundColor Yellow

try {

    Import-Module Microsoft.Graph -ErrorAction Stop

    Write-Host "    Microsoft Graph loaded successfully." `
        -ForegroundColor Green

}
catch {

    Write-Host "    Failed to load Microsoft Graph." `
        -ForegroundColor Red

    Write-Host "    $($_.Exception.Message)" `
        -ForegroundColor Red

    Read-Host "Press Enter to exit"
    exit
}

Write-Host ""

# --------------------------------------------
# Required Permissions
# --------------------------------------------

$Scopes = @(
    "User.Read.All"
    "Group.Read.All"
    "Directory.Read.All"
    "RoleManagement.Read.Directory"
    "Application.Read.All"
    "Device.Read.All"
)

# --------------------------------------------
# Check Existing Connection
# --------------------------------------------

Write-Host "[3] Checking existing Graph connection..." `
    -ForegroundColor Yellow

$Context = Get-MgContext

if ($Context) {

    Write-Host "    Existing connection detected." `
        -ForegroundColor Green

    Write-Host "    Account : $($Context.Account)" `
        -ForegroundColor Gray

    Write-Host "    Tenant  : $($Context.TenantId)" `
        -ForegroundColor Gray

    Write-Host ""

    $Reconnect = Read-Host "Reconnect to Microsoft Graph? (Y/N)"

    if ($Reconnect -notmatch "^[Yy]$") {

        Write-Host ""
        Write-Host "Keeping existing Graph connection." `
            -ForegroundColor Green

        Write-Host ""
        Read-Host "Press Enter to exit"
        exit
    }

    Disconnect-MgGraph | Out-Null
}

# --------------------------------------------
# Connect to Microsoft Graph
# --------------------------------------------

Write-Host "[4] Connecting to Microsoft Graph..." `
    -ForegroundColor Yellow

Write-Host ""
Write-Host "A Microsoft sign-in window will appear." `
    -ForegroundColor Gray

Write-Host ""

try {

    Connect-MgGraph `
        -Scopes $Scopes `
        -NoWelcome `
        -ErrorAction Stop

}
catch {

    Write-Host ""
    Write-Host "Microsoft Graph connection failed." `
        -ForegroundColor Red

    Write-Host ""
    Write-Host "Error:" -ForegroundColor Yellow
    Write-Host $_.Exception.Message -ForegroundColor Red

    Write-Host ""
    Read-Host "Press Enter to exit"
    exit
}

# --------------------------------------------
# Verify Connection
# --------------------------------------------

Write-Host ""
Write-Host "[5] Verifying connection..." `
    -ForegroundColor Yellow

$Context = Get-MgContext

if (-not $Context) {

    Write-Host "    Connection verification FAILED." `
        -ForegroundColor Red

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

Write-Host "        GRAPH CONNECTION SUCCESSFUL" `
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

Write-Host "Scopes:" -ForegroundColor Cyan

foreach ($Scope in $Context.Scopes) {

    Write-Host "    [OK] $Scope" -ForegroundColor Green
}

Write-Host ""

# --------------------------------------------
# Test Graph Query
# --------------------------------------------

Write-Host "[6] Testing Microsoft Graph..." `
    -ForegroundColor Yellow

try {

    $TestUser = Get-MgUser `
        -Top 1 `
        -ErrorAction Stop

    Write-Host "    Graph query successful." `
        -ForegroundColor Green

}
catch {

    Write-Host "    Graph query failed." `
        -ForegroundColor Red

    Write-Host "    $($_.Exception.Message)" `
        -ForegroundColor Red

    Write-Host ""
    Read-Host "Press Enter to exit"
    exit
}

# --------------------------------------------
# Final Status
# --------------------------------------------

Write-Host ""
Write-Host "============================================" `
    -ForegroundColor Cyan

Write-Host "             READY FOR IAM-LABS" `
    -ForegroundColor Green

Write-Host "============================================" `
    -ForegroundColor Cyan

Write-Host ""
Write-Host "Microsoft Graph is connected and ready." `
    -ForegroundColor Green

Write-Host ""

Read-Host "Press Enter to exit"
