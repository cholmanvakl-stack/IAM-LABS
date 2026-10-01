# IAM Labs — Week 1
# Day 1 — Entra Foundation
# Script: Get Entra Groups

$Groups = Get-MgGroup -All -Property `
    DisplayName,
    GroupTypes,
    SecurityEnabled,
    MailEnabled

$Groups |
    Select-Object DisplayName, GroupTypes, SecurityEnabled, MailEnabled
