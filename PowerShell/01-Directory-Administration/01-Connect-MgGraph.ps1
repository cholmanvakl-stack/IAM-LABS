# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "Directory.Read.All", "Organization.Read.All"

# Show the current Graph connection
Get-MgContext
