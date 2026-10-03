# 🔐 IAM Labs — Week 1

## 🟦 Day 1 — Entra Foundation

### 📜 Script: Connect to Microsoft Graph

**Purpose:**  
Connect PowerShell to **Microsoft Graph** so we can manage and retrieve information from our Microsoft Entra tenant.

---

## 💻 The Script

```powershell
# Connect to Microsoft Graph

Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "Directory.Read.All", "Organization.Read.All"


# Show information about our current Microsoft Graph connection

Get-MgContext
```

---

## 🧠 Let's Break It Down

### 🔹 `Connect-MgGraph`

```powershell
Connect-MgGraph
```

**Connect** → tells PowerShell we want to connect to something.

**Mg** → Microsoft Graph.

**Graph** → the Microsoft Graph service.

> 💡 **In plain English:**  
> `Connect-MgGraph` means **"Connect me to Microsoft Graph."**

---

### 🔹 `-Scopes`

```powershell
-Scopes
```

**`-Scopes`** tells Microsoft Graph what **permissions** we want our session to have.

Think of it as:

> 🗣️ **"These are the permissions I need for this connection."**

---

### 🔹 `User.Read.All`

```powershell
"User.Read.All"
```

Allows the session to **read users**.

---

### 🔹 `Group.Read.All`

```powershell
"Group.Read.All"
```

Allows the session to **read groups**.

---

### 🔹 `Directory.Read.All`

```powershell
"Directory.Read.All"
```

Allows the session to **read directory information**.

---

### 🔹 `Organization.Read.All`

```powershell
"Organization.Read.All"
```

Allows the session to **read organization/tenant information**.

---

## 🔎 `Get-MgContext`

```powershell
Get-MgContext
```

Break it down:

| Part | Meaning |
|---|---|
| `Get` | Retrieve/show something |
| `Mg` | Microsoft Graph |
| `Context` | Information about our current Graph connection |

> 💡 **In plain English:**  
> `Get-MgContext` means **"Show me information about my current Microsoft Graph connection."**

It can show information such as:

- **Account**
- **Tenant ID**
- **Scopes**
- **Authentication information**

---

## 🧩 PowerShell Pattern to Remember

You'll see this pattern throughout the IAM labs:

```text
Verb-Noun
```

Examples:

```powershell
Get-MgUser
Get-MgGroup
Get-MgDirectoryRole
Get-MgOrganization
```

Think:

> **Get** = What am I doing?  
> **Mg** = Microsoft Graph  
> **User / Group / DirectoryRole** = What am I working with?

---

> [!TIP]
> ### 🚀 Beginner PowerShell Rule
> Don't worry about memorizing every command yet.
>
> Start recognizing the **Verb-Noun pattern**. Once you understand what `Get`, `New`, `Set`, `Remove`, and `Connect` generally mean, PowerShell commands become much easier to read.

---

### 🔗 Next Step

After connecting to Microsoft Graph, we'll start using PowerShell to **retrieve and inspect Entra objects** such as:

```text
Users
Groups
Directory Roles
Organizations
```
