```powershell
# IAM Labs — Week 1
# Day 3 — External Identities
# Script: Get Guest Users

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.Read.All"

# Retrieve guest users
$GuestUsers = Get-MgUser -All |
    Where-Object { $_.UserType -eq "Guest" }

# Display guest users
$GuestUsers |
    Select-Object DisplayName, UserPrincipalName, UserType, AccountEnabled |
    Format-Table -AutoSize
```
