```powershell id="q7r4vn"
# IAM Labs — Week 1
# Day 3 — External Identities
# Script: Get Dynamic Guest Groups

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Group.Read.All"

# Retrieve groups with dynamic membership
$DynamicGroups = Get-MgGroup -All |
    Where-Object { $_.GroupTypes -contains "DynamicMembership" }

# Display dynamic groups
$DynamicGroups |
    Select-Object DisplayName,
                  Id,
                  Description,
                  MailEnabled,
                  SecurityEnabled,
                  MembershipRule,
                  MembershipRuleProcessingState |
    Format-List
```
