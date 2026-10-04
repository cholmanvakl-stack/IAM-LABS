# ============================================================
# IAM-LABS - Get Entra User Assignments
# ============================================================
# Purpose:
# Search for an Entra user by Display Name and view:
# - Role Assignments
# - Group Assignments
# - License Assignments
# ============================================================

# -----------------------------
# Connect to Microsoft Graph
# -----------------------------

$RequiredScopes = @(
    "User.Read.All",
    "Group.Read.All",
    "Directory.Read.All",
    "RoleManagement.Read.Directory"
)

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "       ENTRA USER ASSIGNMENT LOOKUP" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Connecting to Microsoft Graph..." -ForegroundColor Yellow

try {
    Connect-MgGraph -Scopes $RequiredScopes -NoWelcome -ErrorAction Stop
}
catch {
    Write-Host ""
    Write-Host "ERROR: Could not connect to Microsoft Graph." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    return
}

Write-Host "Connected to Microsoft Graph." -ForegroundColor Green

# ============================================================
# Main Search Loop
# ============================================================

while ($true) {

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "              USER SEARCH" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""

    $DisplayName = Read-Host "Enter Display Name"

    if ([string]::IsNullOrWhiteSpace($DisplayName)) {
        Write-Host ""
        Write-Host "Please enter a Display Name." -ForegroundColor Yellow
        continue
    }

    # Automatically apply wildcard
    $SearchTerm = "*$DisplayName*"

    Write-Host ""
    Write-Host "Searching for: $SearchTerm" -ForegroundColor Yellow
    Write-Host ""

    try {

        $Users = @(
            Get-MgUser `
                -All `
                -Property Id,DisplayName,UserPrincipalName,Mail,AccountEnabled `
                -ErrorAction Stop |
            Where-Object {
                $_.DisplayName -like $SearchTerm
            }
        )

    }
    catch {

        Write-Host ""
        Write-Host "ERROR: Unable to retrieve users." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        continue
    }

    # ========================================================
    # No Results
    # ========================================================

    if ($Users.Count -eq 0) {

        Write-Host "No users found matching '$DisplayName'." -ForegroundColor Yellow
        continue
    }

    # ========================================================
    # Display Possible Targets
    # ========================================================

    Write-Host "Possible targets:" -ForegroundColor Green
    Write-Host ""

    for ($i = 0; $i -lt $Users.Count; $i++) {

        $Number = $i + 1

        Write-Host "$Number. $($Users[$i].DisplayName)" -ForegroundColor White
        Write-Host "   UPN: $($Users[$i].UserPrincipalName)" -ForegroundColor DarkGray
        Write-Host "   ID : $($Users[$i].Id)" -ForegroundColor DarkGray
        Write-Host ""
    }

    Write-Host "B. Back / New Search" -ForegroundColor Yellow
    Write-Host ""

    $Selection = Read-Host "Select a user"

    if ($Selection -eq "B" -or $Selection -eq "b") {
        continue
    }

    # ========================================================
    # Validate Selection
    # ========================================================

    $SelectedNumber = 0

    if (-not [int]::TryParse($Selection, [ref]$SelectedNumber)) {

        Write-Host ""
        Write-Host "Invalid selection." -ForegroundColor Red
        continue
    }

    if (
        $SelectedNumber -lt 1 -or
        $SelectedNumber -gt $Users.Count
    ) {

        Write-Host ""
        Write-Host "Invalid selection." -ForegroundColor Red
        continue
    }

    $SelectedUser = $Users[$SelectedNumber - 1]

    # ========================================================
    # Confirm Target
    # ========================================================

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "              SELECTED USER" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""

    Write-Host "Display Name      : $($SelectedUser.DisplayName)"
    Write-Host "User Principal    : $($SelectedUser.UserPrincipalName)"
    Write-Host "Email             : $($SelectedUser.Mail)"
    Write-Host "Account Enabled   : $($SelectedUser.AccountEnabled)"
    Write-Host "Object ID         : $($SelectedUser.Id)"

    Write-Host ""

    $Confirm = Read-Host "View assignments for this user? (Y/N)"

    if ($Confirm -notmatch "^[Yy]$") {
        continue
    }

    # ========================================================
    # ROLE ASSIGNMENTS
    # ========================================================

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "              ROLE ASSIGNMENTS" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""

    try {

        $RoleAssignments = @(
            Get-MgRoleManagementDirectoryRoleAssignment `
                -Filter "principalId eq '$($SelectedUser.Id)'" `
                -ExpandProperty RoleDefinition `
                -ErrorAction Stop
        )

        if ($RoleAssignments.Count -eq 0) {

            Write-Host "No directory role assignments found." -ForegroundColor Yellow

        }
        else {

            foreach ($Assignment in $RoleAssignments) {

                $RoleName = $Assignment.RoleDefinition.DisplayName

                Write-Host "Role:" -ForegroundColor Green
                Write-Host "  $RoleName"

                Write-Host "Role Definition ID:"
                Write-Host "  $($Assignment.RoleDefinitionId)"

                Write-Host "Assignment ID:"
                Write-Host "  $($Assignment.Id)"

                Write-Host ""
            }
        }

    }
    catch {

        Write-Host "Unable to retrieve role assignments." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }

    # ========================================================
    # GROUP ASSIGNMENTS
    # ========================================================

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "              GROUP ASSIGNMENTS" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""

    try {

        $Groups = @(
            Get-MgUserMemberOf `
                -UserId $SelectedUser.Id `
                -All `
                -ErrorAction Stop
        )

        $GroupResults = @(
            $Groups | Where-Object {
                $_.AdditionalProperties["@odata.type"] -eq "#microsoft.graph.group"
            }
        )

        if ($GroupResults.Count -eq 0) {

            Write-Host "No group memberships found." -ForegroundColor Yellow

        }
        else {

            foreach ($Group in $GroupResults) {

                $GroupName = $Group.AdditionalProperties["displayName"]
                $GroupId = $Group.Id

                Write-Host "Group:" -ForegroundColor Green
                Write-Host "  $GroupName"

                Write-Host "Group ID:"
                Write-Host "  $GroupId"

                Write-Host ""
            }
        }

    }
    catch {

        Write-Host "Unable to retrieve group memberships." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }

    # ========================================================
    # LICENSE ASSIGNMENTS
    # ========================================================

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "              LICENSE ASSIGNMENTS" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""

    try {

        $LicenseDetails = @(
            Get-MgUserLicenseDetail `
                -UserId $SelectedUser.Id `
                -All `
                -ErrorAction Stop
        )

        if ($LicenseDetails.Count -eq 0) {

            Write-Host "No licenses assigned." -ForegroundColor Yellow

        }
        else {

            foreach ($License in $LicenseDetails) {

                Write-Host "License:" -ForegroundColor Green
                Write-Host "  $($License.SkuPartNumber)"

                Write-Host "SKU ID:"
                Write-Host "  $($License.SkuId)"

                if ($License.ServicePlans) {

                    Write-Host "Service Plans: $($License.ServicePlans.Count)"
                }

                Write-Host ""
            }
        }

    }
    catch {

        Write-Host "Unable to retrieve license assignments." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }

    # ========================================================
    # ACTION MENU
    # ========================================================

    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "                  ACTIONS" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""

    Write-Host "1. View this user again"
    Write-Host "2. Search another user"
    Write-Host "Q. Quit"
    Write-Host ""

    $Action = Read-Host "Select an option"

    switch ($Action) {

        "1" {
            # Intentionally leave the current results visible.
            # The user can review the same selected user again.
            continue
        }

        "2" {
            continue
        }

        "Q" {
            Write-Host ""
            Write-Host "Exiting..." -ForegroundColor Yellow
            Disconnect-MgGraph | Out-Null
            return
        }

        "q" {
            Write-Host ""
            Write-Host "Exiting..." -ForegroundColor Yellow
            Disconnect-MgGraph | Out-Null
            return
        }

        default {
            Write-Host ""
            Write-Host "Returning to user search..." -ForegroundColor Yellow
            continue
        }
    }
}
