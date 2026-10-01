# IAM Labs — Week 1
# Day 1 — Entra Foundation
# Script: Get Entra Users

$Users = Get-MgUser -All -Property `
    DisplayName,
    UserPrincipalName,
    AccountEnabled

$Users |
    Select-Object DisplayName, UserPrincipalName, AccountEnabled
