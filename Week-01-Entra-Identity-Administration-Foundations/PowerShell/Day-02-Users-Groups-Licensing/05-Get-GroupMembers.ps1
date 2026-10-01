# IAM Labs — Week 1
# Day 2 — Users, Groups & Licensing
# Script: Get Group Members

$Group = Get-MgGroup -Filter "displayName eq 'YOUR-GROUP-NAME'"

$Members = Get-MgGroupMember -GroupId $Group.Id -All

$Members |
    Select-Object Id, AdditionalProperties
