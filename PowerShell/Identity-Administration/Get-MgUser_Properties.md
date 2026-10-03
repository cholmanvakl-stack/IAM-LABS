# Dynamic Entra ID User Search

## Interactive User Search

```powershell
# Get all users with the properties needed for searching
$Users = Get-MgUser -All -Property DisplayName,UserPrincipalName,Mail,JobTitle,Department,UserType,AccountEnabled

# Ask for search input
$Search = Read-Host "Enter part of the user's name, UPN, email, department, or job title"

# Search user properties
$Results = $Users | Where-Object {
    $_.DisplayName -like "*$Search*" -or
    $_.UserPrincipalName -like "*$Search*" -or
    $_.Mail -like "*$Search*" -or
    $_.JobTitle -like "*$Search*" -or
    $_.Department -like "*$Search*" -or
    $_.UserType -like "*$Search*"
}

# Display results
$Results |
    Select-Object DisplayName,UserPrincipalName,Mail,JobTitle,Department,UserType,AccountEnabled |
    Format-Table -AutoSize
```

### Example

```text
Enter part of the user's name, UPN, email, department, or job title: helpdesk
```

Could return:

```text
DisplayName     UserPrincipalName       Mail                    JobTitle              Department
-----------     -----------------       ----                    --------              ----------
Alex Johnson    alex@contoso.com        alex@contoso.com        Help Desk Technician  IT
Sarah Miller    sarah@contoso.com       sarah@contoso.com       Help Desk Technician  IT
```

## Reusable Function

For repeated administrative work, turn it into a function:

```powershell
function Search-EntraUser {

    param(
        [Parameter(Mandatory)]
        [string]$Search
    )

    Get-MgUser -All -Property DisplayName,UserPrincipalName,Mail,JobTitle,Department,UserType,AccountEnabled |
        Where-Object {
            $_.DisplayName -like "*$Search*" -or
            $_.UserPrincipalName -like "*$Search*" -or
            $_.Mail -like "*$Search*" -or
            $_.JobTitle -like "*$Search*" -or
            $_.Department -like "*$Search*" -or
            $_.UserType -like "*$Search*"
        } |
        Select-Object DisplayName,UserPrincipalName,Mail,JobTitle,Department,UserType,AccountEnabled |
        Format-Table -AutoSize
}
```

Then you can simply run:

```powershell
Search-EntraUser -Search "Alex"
```

Or:

```powershell
Search-EntraUser -Search "Help Desk"
```

Or:

```powershell
Search-EntraUser -Search "HR"
```
