# IAM Labs — Week 1
# Day 1 — Entra Foundation
# Script: Get Administrative Units

$AdministrativeUnits = Get-MgDirectoryAdministrativeUnit -All

$AdministrativeUnits |
    Select-Object DisplayName, Id, Description
