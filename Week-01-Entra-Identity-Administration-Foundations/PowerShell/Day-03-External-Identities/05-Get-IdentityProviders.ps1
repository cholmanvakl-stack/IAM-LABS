```powershell id="h2q6ws"
# IAM Labs — Week 1
# Day 3 — External Identities
# Script: Get External Identity Providers

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "IdentityProvider.Read.All"

# Retrieve external identity providers
$IdentityProviders = Get-MgIdentityIdentityProvider

# Display configured identity providers
$IdentityProviders |
    Select-Object DisplayName,
                  Id,
                  Type |
    Format-List
```
