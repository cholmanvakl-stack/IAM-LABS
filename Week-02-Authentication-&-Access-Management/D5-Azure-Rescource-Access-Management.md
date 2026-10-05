
# Week 2 Day 5 — Implement Access Management for Azure Resources

## Microsoft Learn Alignment

**Module:** Implement access management for Azure resources

**Focus:**
- Azure built-in roles
- Assign Azure roles
- Custom Azure roles
- Managed identities
- Assign managed identities to Azure resources
- Access Azure resources with managed identities
- Analyze Azure role permissions
- Azure RBAC
- Azure Key Vault RBAC
- Retrieve objects from Azure Key Vault

---

# Goal 1 — SC-300 Exam Preparation

The SC-300 exam expects you to understand how Microsoft Entra identities interact with **Azure resource authorization**.

The key concept is:

> **Identity authenticates → Azure RBAC authorizes → Resource performs the action**

---

## Azure RBAC

**Azure RBAC** → Azure's authorization system for controlling who can perform actions on Azure resources.

RBAC determines:

- **Who** has access
- **What** they can do
- **Where** they can do it

The three core components are:

**Security principal**
→ The identity receiving access.

Examples:
- User
- Group
- Service principal
- Managed identity

**Role definition**
→ Defines what actions the principal can perform.

**Scope**
→ Defines where the permissions apply.

Common scopes:

- Management group
- Subscription
- Resource group
- Resource

**How they connect:**  
**Principal + Role + Scope = Azure RBAC access**

---

# Azure Built-In Roles

**Built-in role** → A predefined Azure RBAC role created by Microsoft.

Common roles include:

### Owner

**Owner** → Full management access to Azure resources, including the ability to assign Azure RBAC roles.

### Contributor

**Contributor** → Can manage Azure resources but cannot normally assign Azure RBAC roles.

### Reader

**Reader** → Can view Azure resources but cannot make changes.

### User Access Administrator

**User Access Administrator** → Can manage user access to Azure resources through role assignments.

**How they connect:**  
Built-in roles provide predefined permission sets so administrators do not have to create permissions manually.

---

# Assign Azure Roles

**Role assignment** → Connects a security principal to a role at a specific scope.

Example:

```text
User
 ↓
Contributor
 ↓
Resource Group
```

The user receives Contributor permissions over that resource group and resources within its scope.

Role assignments can target:

- Users
- Groups
- Service principals
- Managed identities

**How they connect:**  
Role assignments apply a role definition to an identity at a specific Azure scope.

---

# Scope

**Scope** → The boundary where an Azure RBAC assignment applies.

Hierarchy:

```text
Management Group
        ↓
Subscription
        ↓
Resource Group
        ↓
Resource
```

A role assigned at a higher scope can inherit down to lower scopes.

Example:

```text
Subscription
    ↓
Resource Group
    ↓
Virtual Machine
```

A Reader assignment at the subscription level can provide Reader access to resources inside that subscription.

**How they connect:**  
Scope determines how broadly a role assignment applies.

---

# Custom Azure Roles

**Custom role** → An Azure RBAC role created by an organization when built-in roles do not provide the required permissions.

Custom roles can specify:

- `Actions`
- `NotActions`
- `DataActions`
- `NotDataActions`
- `AssignableScopes`

Example concept:

```text
Custom Role
    ↓
Read specific Azure resources
    +
Perform one required action
    -
No unnecessary permissions
```

Custom roles support **least privilege** when built-in roles are too broad.

**How they connect:**  
Custom roles provide precise authorization when built-in roles do not meet the organization's requirements.

---

# Analyze Azure Role Permissions

**Role permissions** → The specific Azure operations allowed or denied by a role.

Important permission categories:

**Actions**
→ Management-plane operations.

Example:

```text
Microsoft.Compute/virtualMachines/read
```

**DataActions**
→ Operations against data inside a resource.

Example:

```text
Microsoft.KeyVault/vaults/secrets/getSecret/action
```

**NotActions**
→ Excludes specific management-plane actions.

**NotDataActions**
→ Excludes specific data-plane actions.

**How they connect:**  
Analyzing role permissions tells you exactly what an identity can do rather than relying only on the role name.

---

# Azure Management Plane vs Data Plane

**Management plane** → Controls the Azure resource itself.

Examples:

- Create resource
- Delete resource
- Change configuration
- Assign permissions

**Data plane** → Controls the data stored inside the resource.

Example:

```text
Key Vault
    ↓
Secret
    ↓
Read secret value
```

A person may have permission to manage a Key Vault without having permission to read the secret values inside it.

**How they connect:**  
Management-plane access and data-plane access are separate permission concepts.

---

# Managed Identities

**Managed identity** → An identity provided and managed by Azure for an Azure resource.

Purpose:

> Allow an Azure resource or application to authenticate to another Azure service without storing credentials in code.

Examples:

```text
Virtual Machine
      ↓
Managed Identity
      ↓
Key Vault
```

The application does not need to store a password, client secret, or certificate for this authentication scenario.

Microsoft describes managed identities as a way for Azure resources to obtain tokens for services supporting Microsoft Entra authentication without embedding authentication information in application code.

**How they connect:**  
Managed identities provide an Azure-managed identity that can receive Azure RBAC permissions.

---

# System-Assigned Managed Identity

**System-assigned managed identity** → An identity created directly on an Azure resource.

Characteristics:

- Tied to the Azure resource
- Lifecycle follows the resource
- Deleted when the resource is deleted

Example:

```text
Virtual Machine
      ↓
System-Assigned Identity
      ↓
Key Vault
```

---

# User-Assigned Managed Identity

**User-assigned managed identity** → A standalone Azure resource that can be assigned to multiple Azure resources.

Characteristics:

- Exists independently
- Can be reused
- Lifecycle is separate from the resources using it

Example:

```text
             ┌─ VM
Managed      ├─ App Service
Identity ────┤
             └─ Function App
```

**How they connect:**  
System-assigned identities are tied to one resource; user-assigned identities can be reused across multiple resources.

---

# Assign Managed Identities to Azure Resources

**Managed identity assignment** → Attaching a managed identity to an Azure resource.

Example:

```text
Virtual Machine
      ↓
Enable Managed Identity
      ↓
Identity exists in Microsoft Entra
      ↓
Assign Azure RBAC role
      ↓
Managed Identity can access resource
```

Important:

> **Creating/enabling a managed identity does not automatically give it access to Azure resources.**

The identity still needs appropriate permissions.

**How they connect:**  
Identity creation provides authentication capability; RBAC provides authorization.

---

# Access Azure Resources with Managed Identities

A typical flow:

```text
1. Azure resource has managed identity
             ↓
2. Application requests token
             ↓
3. Microsoft Entra ID authenticates the managed identity
             ↓
4. Azure resource validates authorization
             ↓
5. Requested operation is allowed/denied
```

Example:

```text
VM
 ↓
Managed Identity
 ↓
Microsoft Entra ID
 ↓
Access Token
 ↓
Azure Key Vault
 ↓
Secret
```

**How they connect:**  
Managed identity handles authentication while Azure RBAC determines whether the identity is authorized.

---

# Azure Key Vault RBAC

**Key Vault RBAC** → Uses Azure role-based access control to authorize access to Key Vault resources and data.

Microsoft recommends Azure RBAC as the modern Key Vault authorization model; Key Vault can also have legacy access-policy configurations, so administrators must know which permission model the vault uses.

Important roles include:

### Key Vault Reader

Can read Key Vault metadata and object metadata but cannot read sensitive secret values.

### Key Vault Secrets Officer

Can perform actions on secrets but does not manage permissions.

### Key Vault Secrets User

Can read secret contents.

### Key Vault Administrator

Provides broad Key Vault data-plane administration.

**How they connect:**  
Key Vault RBAC determines which identities can manage or retrieve Key Vault data.

---

# Retrieve Objects from Azure Key Vault

**Key Vault object** → A protected item stored in Azure Key Vault.

Common objects:

- Secrets
- Keys
- Certificates

For a secret:

```text
Application
    ↓
Managed Identity
    ↓
Microsoft Entra token
    ↓
Azure Key Vault
    ↓
RBAC authorization
    ↓
Secret value
```

To retrieve a secret, the identity must have the appropriate Key Vault data-plane permission.

For example, **Key Vault Secrets User** includes permission to retrieve secret contents.

**How they connect:**  
Managed identity authenticates the application, Azure RBAC authorizes access, and Key Vault returns the permitted object.

---

# Comparison

| Concept | Purpose |
|---|---|
| Microsoft Entra role | Manage Microsoft Entra resources |
| Azure RBAC role | Manage/access Azure resources |
| Built-in role | Microsoft-created permission set |
| Custom role | Organization-created permission set |
| Managed identity | Azure-managed application identity |
| System-assigned identity | Identity tied to one Azure resource |
| User-assigned identity | Reusable managed identity |
| Scope | Defines where Azure permissions apply |
| Key Vault RBAC | Controls Key Vault access through Azure RBAC |

### Critical Exam Distinction

**Microsoft Entra RBAC**

→ Controls Microsoft Entra directory resources.

**Azure RBAC**

→ Controls Azure resources.

Do not confuse the two.

---

# SC-300 Scenario Thinking

### Scenario 1 — VM needs a Key Vault secret

A VM needs to retrieve a secret from Key Vault.

Best architecture:

```text
VM
 ↓
Managed Identity
 ↓
Key Vault Secrets User
 ↓
Key Vault
```

Avoid storing a client secret in the VM when managed identity can be used.

---

### Scenario 2 — Developer needs to manage a resource

A developer needs to manage an Azure resource but should not manage access.

Use:

**Contributor**

Not:

**Owner**

---

### Scenario 3 — User needs to view Azure resources

A user only needs read access.

Use:

**Reader**

---

### Scenario 4 — Application needs secret contents

An application needs to retrieve a secret from Key Vault.

Use:

**Managed Identity + appropriate Key Vault data-plane RBAC role**

For example:

**Key Vault Secrets User**

---

### Scenario 5 — Built-in role is too broad

A user needs only a specific set of operations.

Consider:

**Custom Azure RBAC role**

Apply it at the narrowest appropriate scope.

---

# Troubleshooting

Use this sequence:

**Identity → Role → Scope → Permission → Authentication → Resource → Result**

### 1. Identity

Determine which identity is making the request.

Is it:

- User?
- Group?
- Service principal?
- System-assigned managed identity?
- User-assigned managed identity?

---

### 2. Role

Check the assigned Azure RBAC role.

Ask:

- Is a role assigned?
- Is it the correct role?
- Does it provide the required action?

---

### 3. Scope

Check where the role was assigned.

```text
Management Group
       ↓
Subscription
       ↓
Resource Group
       ↓
Resource
       ↓
Data
```

Make sure the assignment applies to the target resource.

---

### 4. Permission

Analyze the role definition.

Check:

- `Actions`
- `DataActions`
- `NotActions`
- `NotDataActions`

For Key Vault, determine whether the required operation is a data-plane operation.

---

### 5. Authentication

For managed identities, verify:

- Identity is enabled
- Correct identity is being used
- Token can be obtained
- Application is requesting the correct resource access

---

### 6. Resource

Verify the target resource.

For Key Vault:

- Correct vault
- Correct secret/key/certificate
- Correct authorization model
- RBAC enabled when using Key Vault RBAC

Microsoft specifically recommends checking whether a Key Vault uses Azure RBAC or the legacy access-policy model before troubleshooting permissions.

---

### 7. Result

Verify the actual operation.

Examples:

```text
Can list secret metadata?
Can read secret value?
Can create a secret?
Can delete a secret?
```

Do not assume access because the identity can see the resource.

**How they connect:**  
A successful troubleshooting path verifies the identity, role, scope, actual permission, authentication, resource configuration, and final operation.

---

# Interview Scenarios

### Question

**What is Azure RBAC?**

Strong answer:

> Azure RBAC is Azure's authorization system for controlling who can perform actions on Azure resources. Access is determined by the security principal, role definition, and scope.

---

### Question

**What is the difference between Azure RBAC and Microsoft Entra roles?**

Strong answer:

> Microsoft Entra roles control administrative access to Microsoft Entra resources, while Azure RBAC controls access to Azure resources such as virtual machines, storage, and Key Vault.

---

### Question

**Why use a managed identity?**

Strong answer:

> Managed identities allow Azure resources and applications to authenticate to supported services without storing credentials such as client secrets in application code.

---

### Question

**A VM has a managed identity but cannot retrieve a Key Vault secret. What do you check?**

Strong answer:

> I would verify the VM's managed identity, confirm the correct RBAC role is assigned, verify the assignment scope, confirm the Key Vault uses the expected authorization model, verify the role includes the required data-plane permission, and then test the secret retrieval.

---

### Question

**Contributor vs Owner?**

Strong answer:

> Contributor can manage Azure resources but does not normally have permission to assign Azure RBAC roles. Owner includes full resource management and access-management capabilities.

---

### Question

**Why might someone be able to see a Key Vault but not read a secret?**

Strong answer:

> Resource visibility and data access are different permissions. The identity may have management-plane access or metadata permissions without having the required Key Vault data-plane permission to read the secret value.

---

# SC-300 Knowledge Checklist

You should be able to explain:

- [ ] Azure RBAC
- [ ] Security principals
- [ ] Azure role definitions
- [ ] Role assignments
- [ ] Azure scopes
- [ ] Built-in roles
- [ ] Custom roles
- [ ] Actions
- [ ] DataActions
- [ ] NotActions
- [ ] NotDataActions
- [ ] Management plane
- [ ] Data plane
- [ ] Managed identities
- [ ] System-assigned identities
- [ ] User-assigned identities
- [ ] Managed identity authentication flow
- [ ] Azure Key Vault RBAC
- [ ] Key Vault roles
- [ ] Retrieving Key Vault secrets
- [ ] Azure RBAC vs Microsoft Entra roles
- [ ] Least privilege

---

# Interview / Real-World Skill Checklist

You should be able to:

- [ ] Assign Azure roles
- [ ] Select the appropriate built-in role
- [ ] Choose the correct RBAC scope
- [ ] Analyze a role's permissions
- [ ] Explain why a custom role is needed
- [ ] Enable/use a managed identity
- [ ] Distinguish system-assigned vs user-assigned identities
- [ ] Assign RBAC permissions to a managed identity
- [ ] Configure Key Vault RBAC
- [ ] Grant an application access to a Key Vault secret
- [ ] Troubleshoot Azure RBAC access failures
- [ ] Troubleshoot managed-identity access failures
- [ ] Troubleshoot Key Vault authorization failures

---

# Real-World Administrator Mindset

Think in this order:

```text
WHO?
 ↓
WHAT ROLE?
 ↓
WHAT SCOPE?
 ↓
WHAT PERMISSION?
 ↓
HOW IS THE IDENTITY AUTHENTICATING?
 ↓
WHAT RESOURCE?
 ↓
WHAT ACTION?
 ↓
ALLOWED OR DENIED?
```

The most important IAM principle is:

> **Do not grant more access than the identity needs.**

Prefer:

- Built-in role when appropriate
- Custom role when necessary
- Narrow scope
- Managed identity instead of stored credentials
- Least privilege
- Data-plane permissions only when required

---

# Master Mental Model

```text
                 IDENTITY
                    │
                    ▼
          User / Group / App /
          Managed Identity
                    │
                    ▼
              AZURE RBAC
                    │
          ┌─────────┴─────────┐
          ▼                   ▼
       ROLE                  SCOPE
          │                   │
          └─────────┬─────────┘
                    ▼
              PERMISSIONS
                    │
                    ▼
              AZURE RESOURCE
                    │
          ┌─────────┴─────────┐
          ▼                   ▼
     Management             Data
        Plane               Plane
          │                   │
          ▼                   ▼
     Resource             Key Vault
     Management           Secrets/Keys
```

**The core exam model:**

> **Authentication establishes who the identity is. Azure RBAC determines what that identity is authorized to do and where.**

**For managed identities:**

> **Azure resource → Managed Identity → Microsoft Entra token → Azure RBAC → Target Resource**

**For Key Vault:**

> **Identity → Key Vault RBAC → Data-plane permission → Secret/Key/Certificate**
  
