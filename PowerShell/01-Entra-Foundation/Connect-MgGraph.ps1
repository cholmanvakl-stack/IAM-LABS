# Connect to Microsoft Graph
# IAM Labs - Week 1


# Connect-MgGraph -> authenticates PowerShell to Microsoft Graph
# Scopes -> requests the permissions needed for the commands your going to run
Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "Directory.Read.All"

# Display the current Microsoft Graph connection and permissions
Get-MgContext
