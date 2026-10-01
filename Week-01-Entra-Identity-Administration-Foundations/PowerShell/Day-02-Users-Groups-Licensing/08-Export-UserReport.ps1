# IAM Labs — Week 1
# Day 2 — Users, Groups & Licensing
# Script: Export Entra User Report

$Users = Get-MgUser -All -Property `
    DisplayName,
    UserPrincipalName,
    GivenName,
    Surname,
    JobTitle,
    Department,
    Mail,
    AccountEnabled

$UserReport = $Users |
    Select-Object `
        DisplayName,
        UserPrincipalName,
        GivenName,
        Surname,
        JobTitle,
        Department,
        Mail,
        AccountEnabled

$UserReport |
    Export-Csv ".\Entra-User-Report.csv" -NoTypeInformation
