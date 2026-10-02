```powershell
# IAM Labs — Week 1
# Day 3 — External Identities
# Script: Get Guest User Properties

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.Read.All"

# Retrieve guest users
$GuestUsers = Get-MgUser -All |
    Where-Object { $_.UserType -eq "Guest" }

# Display important guest user properties
$GuestUsers |
    Select-Object DisplayName,
                  UserPrincipalName,
                  Mail,
                  UserType,
                  AccountEnabled,
                  CreatedDateTime,
                  Id |
    Format-List
```
