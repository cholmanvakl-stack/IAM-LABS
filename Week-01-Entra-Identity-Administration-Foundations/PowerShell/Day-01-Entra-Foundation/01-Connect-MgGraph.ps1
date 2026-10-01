# IAM Labs — Week 1
# Day 1 — Entra Foundation
# Script: Connect to Microsoft Graph

Connect-MgGraph -Scopes `
    "User.Read.All",
    "Group.Read.All",
    "Directory.Read.All",
    "Organization.Read.All"

# Display the current Microsoft Graph session
Get-MgContext
