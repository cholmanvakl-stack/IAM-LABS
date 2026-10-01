# IAM Labs — Week 1
# Day 2 — Users, Groups & Licensing
# Script: Get User Properties

$User = Get-MgUser -UserId "YOUR-UPN-HERE" -Property `
    DisplayName,
    UserPrincipalName,
    GivenName,
    Surname,
    JobTitle,
    Department,
    Mail,
    AccountEnabled

$User |
    Select-Object `
        DisplayName,
        UserPrincipalName,
        GivenName,
        Surname,
        JobTitle,
        Department,
        Mail,
        AccountEnabled
