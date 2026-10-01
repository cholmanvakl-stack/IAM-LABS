# IAM Labs — Week 1
# Day 1 — Entra Foundation
# Script: Get Entra Directory Roles

$Roles = Get-MgDirectoryRole

$Roles |
    Select-Object DisplayName, Id, Description
