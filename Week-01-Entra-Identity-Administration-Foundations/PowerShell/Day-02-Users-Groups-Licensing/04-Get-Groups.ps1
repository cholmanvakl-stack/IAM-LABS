# IAM Labs — Week 1
# Day 2 — Users, Groups & Licensing
# Script: Get Entra Groups

$Groups = Get-MgGroup -All -Property `
    DisplayName,
    Description,
    GroupTypes,
    SecurityEnabled,
    MailEnabled

$Groups |
    Select-Object `
        DisplayName,
        Description,
        GroupTypes,
        SecurityEnabled,
        MailEnabled
