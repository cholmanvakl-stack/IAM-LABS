# IAM Labs — Week 1
# Day 2 — Users, Groups & Licensing
# Script: Get Deleted Users

$DeletedUsers = Get-MgDirectoryDeletedItemAsUser -All

$DeletedUsers |
    Select-Object Id, DisplayName, UserPrincipalName
