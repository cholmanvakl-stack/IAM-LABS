# IAM Labs — Day 1 PowerShell

## Entra Identity Administration Foundation

### Purpose

This PowerShell work supports **IAM Labs — Week 1, Day 1**.

The goal is to begin translating manual Microsoft Entra administration into repeatable PowerShell and Microsoft Graph operations.

The Day 1 focus is **inspection and information gathering**, not destructive administration.

### Environment

- Microsoft Entra ID
- Microsoft Graph PowerShell
- PowerShell
- IAM Labs tenant

---

## Scripts

### 01 — Connect to Microsoft Graph

**File:** `01-Connect-MgGraph.ps1`

Connects PowerShell to Microsoft Graph and displays the active Graph session.

**Skills:**
- Microsoft Graph authentication
- Permission scopes
- Checking the current Graph context

---

### 02 — Get Tenant Information

**File:** `02-Get-TenantInfo.ps1`

Retrieves basic information about the Microsoft Entra tenant.

**Skills:**
- Querying tenant information
- Variables
- Selecting object properties

---

### 03 — Get Entra Users

**File:** `03-Get-EntraUsers.ps1`

Retrieves users from Microsoft Entra ID and displays selected identity properties.

**Skills:**
- Microsoft Graph user queries
- Retrieving directory objects
- Selecting properties

---

### 04 — Get Entra Groups

**File:** `04-Get-EntraGroups.ps1`

Retrieves groups from Microsoft Entra ID and displays selected group properties.

**Skills:**
- Microsoft Graph group queries
- Group property inspection
- Security-enabled group identification

---

### 05 — Get Entra Roles

**File:** `05-Get-EntraRoles.ps1`

Retrieves Microsoft Entra directory roles.

**Skills:**
- Querying directory roles
- Understanding administrative roles
- Inspecting role assignments through Graph

---

### 06 — Get Administrative Units

**File:** `06-Get-AdministrativeUnits.ps1`

Retrieves Administrative Units configured in the tenant.

**Skills:**
- Querying Administrative Units
- Understanding scoped administration
- Inspecting directory structure

---

### 07 — Get Custom Domains

**File:** `07-Get-CustomDomains.ps1`

Retrieves the domains configured in the Microsoft Entra tenant.

**Skills:**
- Querying organization domains
- Inspecting verified domains
- Understanding tenant domain configuration

---

# Day 1 Learning Progression

The Day 1 scripting progression is:

**Connect → Inspect → Retrieve → Display**

The scripts correspond to the manual administration and tenant inspection performed during the Day 1 Entra Foundation lab.

### Manual Administration

Microsoft Entra portal

↓

Inspect tenant configuration

↓

Identify users, groups, roles, Administrative Units, and domains

### PowerShell Administration

Microsoft Graph PowerShell

↓

Query the same directory information

↓

Display and work with the results

---

# Skills Developed

By completing the Day 1 scripts, the following foundational skills are being developed:

- PowerShell command execution
- Microsoft Graph authentication
- Permission scopes
- Variables
- Object properties
- `Select-Object`
- Microsoft Graph queries
- Microsoft Entra directory inspection
- Basic PowerShell automation concepts

---

# Portfolio Connection

The Day 1 PowerShell work complements the corresponding Entra administration labs.

The portal labs demonstrate the ability to **perform identity administration manually**.

The PowerShell scripts demonstrate the ability to **retrieve and inspect the same identity information programmatically**.

This establishes the foundation for future automation.

---

# Future Development

Future IAM Labs will expand these scripts from information gathering into administrative automation.

Planned areas include:

- User management
- Group management
- Group membership
- Licensing
- External identities
- Microsoft Graph automation
- Reporting
- Identity security
- Automated administrative tasks

The scripting track will continue throughout the IAM and cybersecurity roadmap, eventually expanding into:

**PowerShell → Microsoft Graph → KQL → Python → Azure CLI → Security Automation**
