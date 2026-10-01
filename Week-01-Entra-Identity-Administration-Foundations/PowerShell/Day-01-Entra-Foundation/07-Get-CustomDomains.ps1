# IAM Labs — Week 1
# Day 1 — Entra Foundation
# Script: Get Custom Domains

$Organization = Get-MgOrganization

$Organization.VerifiedDomains |
    Select-Object Name, IsDefault, IsInitial
