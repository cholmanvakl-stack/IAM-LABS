```powershell id="v3q8km"
# IAM Labs — Week 1
# Day 3 — External Identities
# Script: Get Cross-Tenant Access Settings

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Policy.Read.All"

# Retrieve the default cross-tenant access policy
$DefaultPolicy = Get-MgPolicyCrossTenantAccessPolicyDefault

# Display default cross-tenant access settings
$DefaultPolicy |
    Select-Object InboundTrust, B2bCollaborationOutbound, B2bCollaborationInbound, 
                  B2bDirectConnectOutbound, B2bDirectConnectInbound |
    Format-List
```
