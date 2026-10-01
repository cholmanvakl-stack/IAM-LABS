# IAM Labs — Week 1
# Day 1 — Entra Foundation
# Script: Get Tenant Information

$Tenant = Get-MgOrganization

$Tenant |
    Select-Object DisplayName, Id, VerifiedDomains
