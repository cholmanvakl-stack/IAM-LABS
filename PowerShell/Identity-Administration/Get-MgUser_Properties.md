# Dynamic Wildcard Entra ID User Search

```powershell
function Search-EntraUser {

    param(
        [Parameter(Mandatory)]
        [string]$Search
    )

    # Automatically add wildcards to the search term
    $WildcardSearch = "*$Search*"

    Get-MgUser -All -Property DisplayName,UserPrincipalName,Mail,JobTitle,Department,UserType,AccountEnabled |
        Where-Object {
            $_.DisplayName -like $WildcardSearch -or
            $_.UserPrincipalName -like $WildcardSearch -or
            $_.Mail -like $WildcardSearch -or
            $_.JobTitle -like $WildcardSearch -or
            $_.Department -like $WildcardSearch
        } |
        Select-Object DisplayName,UserPrincipalName,Mail,JobTitle,Department,UserType,AccountEnabled |
        Format-Table -AutoSize
}
```

## Run the Search

You only enter the value you want to search for:

```powershell
Search-EntraUser -Search "alex"
```

The function automatically searches as:

```powershell
*alex*
```

### Examples

```powershell
Search-EntraUser -Search "alex"
```

Searches for `alex` anywhere in:

- Display name
- UPN
- Email
- Job title
- Department

```powershell
Search-EntraUser -Search "help"
```

Can find users with `help` anywhere in their job title or other searchable properties.

```powershell
Search-EntraUser -Search "contoso"
```

Can find users whose UPN or email contains `contoso`.

### How they connect:

`$Search` → administrator's input

`*$Search*` → automatically converts the input into a wildcard search

`Get-MgUser -All` → retrieves the tenant's users

`Where-Object` → checks multiple user properties

`Select-Object` → displays only the relevant identity information

`Format-Table` → presents the results in a readable format
