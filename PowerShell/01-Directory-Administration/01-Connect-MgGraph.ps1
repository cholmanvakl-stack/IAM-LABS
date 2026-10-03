# IAM Labs — Week 1
# Day 1 — Entra Foundation
# Script: Connect to Microsoft Graph


# Connect to Microsoft Graph
#
# Connect = tells PowerShell we want to connect to something
# Mg = Microsoft Graph
# Graph = the Microsoft Graph service
#
# So "Connect-MgGraph" basically means:
# "Connect me to Microsoft Graph."

Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "Directory.Read.All", "Organization.Read.All"


# -Scopes tells Microsoft Graph what permissions we want
#
# User.Read.All
# = Allows this session to read users
#
# Group.Read.All
# = Allows this session to read groups
#
# Directory.Read.All
# = Allows this session to read directory information
#
# Organization.Read.All
# = Allows this session to read organization/tenant information
#
# Think of -Scopes as:
# "These are the permissions I need for this connection."


# Show information about our current Microsoft Graph connection
#
# Get = retrieve/show something
# Mg = Microsoft Graph
# Context = information about our current Graph connection
#
# So "Get-MgContext" basically means:
# "Show me information about my current Microsoft Graph connection."
#
# This can show things such as:
# - Account
# - Tenant ID
# - Permissions (Scopes)
# - Authentication information

Get-MgContext
