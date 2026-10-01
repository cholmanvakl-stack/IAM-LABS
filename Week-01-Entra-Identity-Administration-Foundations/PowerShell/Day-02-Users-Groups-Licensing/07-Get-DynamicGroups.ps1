# IAM Labs — Week 1
# Day 2 — Users, Groups & Licensing
# Script: Get Dynamic Groups

$Groups = Get-MgGroup -All -Property `
    DisplayName,
    GroupTypes,
    MembershipRule,
    MembershipRuleProcessingState,
    MembershipRuleProcessingStatus

$DynamicGroups = $Groups |
    Where-Object {
        $_.GroupTypes -contains "DynamicMembership"
    }

$DynamicGroups |
    Select-Object `
        DisplayName,
        GroupTypes,
        MembershipRule,
        MembershipRuleProcessingState
