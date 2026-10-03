# Get Entra ID User Properties with Microsoft Graph

## Get a Specific User

```powershell
Get-MgUser -UserId "user@domain.com"
```

Returns the default properties for a specific Entra ID user.

## Get All User Properties

```powershell
Get-MgUser -UserId "user@domain.com" -Property *
```

Returns all available Microsoft Graph user properties.

## Get Specific Properties

```powershell
Get-MgUser -UserId "user@domain.com" -Property DisplayName,UserPrincipalName,Mail,JobTitle,Department,AccountEnabled
```

Retrieves only the properties needed for the task.

## Format the Output

```powershell
Get-MgUser -UserId "user@domain.com" -Property DisplayName,UserPrincipalName,Mail,JobTitle,Department,AccountEnabled |
    Select-Object DisplayName,UserPrincipalName,Mail,JobTitle,Department,AccountEnabled
```

## Get All Users

```powershell
Get-MgUser -All -Property DisplayName,UserPrincipalName,Mail,JobTitle,Department,AccountEnabled
```

Retrieves the selected properties for every user in the Entra ID tenant.

### Key Properties

- `DisplayName` → User's display name
- `UserPrincipalName` → User's sign-in name
- `Mail` → User's email address
- `JobTitle` → User's job title
- `Department` → User's department
- `AccountEnabled` → Whether the account is enabled
- `UserType` → `Member` or `Guest`
- `Id` → Unique Microsoft Graph user ID

### How they connect:

`Get-MgUser` retrieves Entra ID user objects through Microsoft Graph. The `-Property` parameter controls which properties are returned, while `Select-Object` controls how the results are displayed.
