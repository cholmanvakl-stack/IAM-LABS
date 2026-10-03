# Dynamic Entra User Lookup

```powershell
# Ask for search input
$Search = Read-Host "Enter part of the user's display name"

# Automatically create wildcard search
$WildcardSearch = "*$Search*"

# Find users whose DisplayName contains the search string
$Users = Get-MgUser -All -Property Id,DisplayName |
    Where-Object {
        $_.DisplayName -like $WildcardSearch
    }

# Check whether any users were found
if ($Users.Count -eq 0) {
    Write-Host "No users found matching '$Search'."
}
else {
    Write-Host "`nFound $($Users.Count) user(s):`n"

    # Retrieve all properties for each matching user
    foreach ($User in $Users) {

        Write-Host "==============================" -ForegroundColor Cyan
        Write-Host "User: $($User.DisplayName)" -ForegroundColor Green
        Write-Host "==============================" -ForegroundColor Cyan

        Get-MgUser -UserId $User.Id -Property * |
            Format-List *
    }
}
```

### Example

When you run:

```powershell
.\Search-EntraUser.ps1
```

You will be prompted:

```text
Enter part of the user's display name: alex
```

If the tenant contains:

```text
Alex Johnson
Alex Smith
Alexander Brown
```

the script finds all three because the search automatically becomes:

```text
*alex*
```

It then performs:

```powershell
Get-MgUser -UserId <UserId> -Property *
```

for **each matching user**, giving you their full Microsoft Graph user properties.

### How they connect:

`Read-Host` → collects the administrator's search string

`*$Search*` → automatically creates the wildcard

`Get-MgUser -All` → searches the tenant's users

`Where-Object` → matches the wildcard against `DisplayName`

`$User.Id` → identifies each matching Entra user

`Get-MgUser -UserId ... -Property *` → retrieves the properties for each matching user

`Format-List *` → displays the returned properties
