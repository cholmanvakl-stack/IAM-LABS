# IAM Labs — Day 2 PowerShell

## Users, Groups & Licensing

### Purpose

This PowerShell work supports **IAM Labs — Week 1, Day 2**.

The goal is to build on the Microsoft Graph and PowerShell skills introduced on Day 1 and begin working with common identity administration tasks involving users, groups, group membership, and licensing.

Day 2 focuses on **retrieving, inspecting, and reporting on identity objects**.

### Environment

- Microsoft Entra ID
- Microsoft Graph PowerShell
- PowerShell
- IAM Labs tenant

---

## Scripts

### 01 — Get Users

**File:** `01-Get-Users.ps1`

Retrieves users from Microsoft Entra ID.

**Skills:**
- User queries
- Microsoft Graph
- Directory object retrieval
- Object properties

---

### 02 — Get User Properties

**File:** `02-Get-UserProperties.ps1`

Retrieves selected properties for individual users.

**Skills:**
- User property inspection
- User identity information
- Variables
- Microsoft Graph user queries

---

### 03 — Get Deleted Users

**File:** `03-Get-DeletedUsers.ps1`

Retrieves users currently in the deleted-user container.

**Skills:**
- Deleted object management
- Microsoft Graph directory queries
- Understanding the deleted-user lifecycle

---

### 04 — Get Groups

**File:** `04-Get-Groups.ps1`

Retrieves groups from Microsoft Entra ID and displays selected group properties.

**Skills:**
- Group queries
- Security groups
- Microsoft 365 groups
- Group property inspection

---

### 05 — Get Group Members

**File:** `05-Get-GroupMembers.ps1`

Retrieves the members of a selected Microsoft Entra group.

**Skills:**
- Group membership queries
- Group IDs
- Directory relationships
- Microsoft Graph group administration

---

### 06 — Get Licenses

**File:** `06-Get-Licenses.ps1`

Retrieves the licenses available in the tenant.

**Skills:**
- License inspection
- SKU identification
- Microsoft Graph licensing information

---

### 07 — Get Dynamic Groups

**File:** `07-Get-DynamicGroups.ps1`

Identifies groups configured with dynamic membership and displays their membership rules.

**Skills:**
- Dynamic group identification
- Membership rules
- Group configuration inspection

---

### 08 — Export User Report

**File:** `08-Export-UserReport.ps1`

Retrieves user information and exports selected properties to a CSV report.

**Skills:**
- Data collection
- Object selection
- CSV export
- Basic PowerShell reporting

---

# Day 2 Learning Progression

The Day 2 scripting progression is:

**Retrieve → Inspect → Relate → Report**

The scripts build on the Microsoft Graph connection established on Day 1.

### Day 1

**Connect to Graph**

↓

**Inspect the directory**

### Day 2

**Retrieve users and groups**

↓

**Inspect properties**

↓

**Inspect relationships**

↓

**Inspect licensing**

↓

**Generate a report**

---

# Skills Developed

By completing the Day 2 scripts, the following skills are being developed:

- PowerShell variables
- Microsoft Graph queries
- User administration
- Group administration
- Group membership
- Deleted-user management
- License inspection
- Dynamic group inspection
- Object properties
- CSV reporting
- Basic PowerShell automation

---

# Portfolio Connection

The Day 2 PowerShell work complements the corresponding Entra administration labs.

The portal labs demonstrate the ability to manage users, groups, licenses, and membership through the Microsoft Entra admin center.

The PowerShell scripts demonstrate the ability to retrieve and inspect the same identity information programmatically.

This begins the transition from **manual administration to repeatable identity administration**.

---

# Future Development

Future IAM Labs will expand these scripts into administrative automation.

Planned areas include:

- Creating users
- Updating users
- Creating groups
- Managing group membership
- Assigning licenses
- Automating identity administration
- Microsoft Graph automation
- Identity reporting
- Identity security

The scripting track will continue throughout the IAM and cybersecurity roadmap.
