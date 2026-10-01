# IAM Labs — Week 1
# Day 2 — Users, Groups & Licensing
# Script: Get Available Licenses

$Licenses = Get-MgSubscribedSku

$Licenses |
    Select-Object SkuPartNumber, SkuId, ConsumedUnits, PrepaidUnits
