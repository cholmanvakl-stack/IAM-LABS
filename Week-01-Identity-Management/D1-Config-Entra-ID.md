# Day 1 — Implement Initial Configuration of Microsoft Entra ID

## Learning Module

**Microsoft Learn alignment:**  
Implement initial configuration of Microsoft Entra ID

**Primary goals:**

1. **SC-300 Exam Preparation** — Understand the concepts, terminology, scenarios, and decision-making Microsoft can test.
2. **IAM Administrator Preparation** — Understand how an administrator would evaluate, configure, delegate, secure, and troubleshoot a real Microsoft Entra tenant.

---

# 1. Microsoft Entra Tenant Foundation

## What You Need to Know

A **Microsoft Entra tenant** is the organization's identity boundary containing users, groups, applications, roles, policies, domains, and other identity resources.

Before administering Entra, an administrator should understand the tenant's:

- Tenant name and ID
- Primary domain
- Custom domains
- Administrators and privileged roles
- Administrative Units
- Organization/branding configuration
- Tenant-wide settings

## SC-300 Focus

Know the difference between:

- **Tenant** → Identity boundary
- **User** → Identity
- **Group** → Collection of identities
- **Role** → Permissions assigned to an administrator
- **Administrative Unit** → Scope boundary for delegated administration

## Interview / Real-World Question

> "You inherit an Entra tenant from another administrator. What would you review first?"

Think:

**Tenant → Domains → Roles → Administrative Units → Tenant-wide settings → Security configuration**

---

# 2. Company Branding

## What You Need to Know

**Company branding** customizes the Microsoft Entra sign-in experience for the organization.

Examples include:

- Organization logo
- Background image
- Sign-in page text
- Organization-specific branding

## Why It Matters

Branding helps users recognize the organization's legitimate authentication experience.

## SC-300 Focus

Understand that company branding is a **tenant-level configuration** affecting the organization's sign-in experience.

## Interview / Real-World Question

> "Why would an organization configure Entra company branding?"

A strong answer should mention:

- Consistent user experience
- Organizational identity
- User recognition of legitimate sign-in pages
- Centralized tenant configuration

---

# 3. Microsoft Entra Roles

## What You Need to Know

**Microsoft Entra roles** provide permissions to perform administrative tasks in the tenant.

Examples:

- Global Administrator
- User Administrator
- Helpdesk Administrator
- Groups Administrator
- Domain Name Administrator
- Security Administrator

## Least Privilege

Administrators should receive **only the permissions required to perform their job**.

Example:

```text
Task:
Reset user passwords

Bad choice:
Global Administrator

Better choice:
Appropriate least-privileged role
```

## Critical Distinction

**Microsoft Entra role** ≠ **Azure RBAC role**

Microsoft Entra roles manage identity-related resources.

Azure RBAC controls access to Azure resources.

## SC-300 Focus

Be able to determine:

> **Which role provides the required permission without unnecessarily granting higher privileges?**

## Interview / Real-World Question

> "A help desk technician needs to reset user passwords. Would you make them Global Administrator?"

Expected thinking:

**No. Determine the minimum role required and assign only that level of access.**

---

# 4. Role Assignment

## What You Need to Know

A role assignment connects:

**Principal + Role + Scope**

```text
Administrator
      +
Entra Role
      +
Scope
      ↓
Effective permissions
```

The principal can be a user or supported group/service principal depending on the scenario.

## Administrator Thinking

Before assigning a role, determine:

1. What task must be performed?
2. What permissions are required?
3. Which role provides those permissions?
4. Can the role be scoped?
5. Should the assignment be permanent or eligible/JIT?
6. Who actually needs the access?

## SC-300 Focus

Expect scenarios where **Global Administrator is intentionally the wrong answer** because a more specific role provides the required permissions.

---

# 5. Administrative Units

## What You Need to Know

**Administrative Unit (AU)** → A container used to scope administration to a subset of users, groups, or devices.

Example:

```text
Tenant
│
├── HR AU
│   ├── HR User 1
│   └── HR User 2
│
├── Finance AU
│   ├── Finance User 1
│   └── Finance User 2
│
└── IT AU
    ├── IT User 1
    └── IT User 2
```

## Why AUs Matter

AUs allow organizations to delegate administration without giving administrators tenant-wide permissions.

Example:

> Help desk should manage password resets for HR users but not Finance users.

Possible design:

**Help Desk Administrator + HR Administrative Unit scope**

## SC-300 Focus

Remember:

**Role = what administrator can do**

**Administrative Unit = where the administrator can do it**

## Interview / Real-World Question

> "How would you allow a regional help desk team to manage only users in their region?"

Think:

**Least-privileged role + Administrative Unit scope**

---

# 6. Role Permissions

## What You Need to Know

A role is made up of specific permissions/actions.

Do not select roles based only on the role name.

Evaluate:

**Required task → Required permission → Appropriate role**

Microsoft provides detailed permissions for built-in roles so administrators can determine what each role actually allows.

## Administrator Thinking

If someone says:

> "I need administrator access."

Do not immediately assign Global Administrator.

Ask:

- What are you trying to manage?
- Which objects?
- Which actions?
- What scope?
- How frequently?
- Does an existing role provide the required permissions?

## SC-300 Focus

Understand **least privilege and role permissions**, not just memorizing role names.

---

# 7. Custom Domains

## What You Need to Know

A **custom domain** allows an organization to use its own domain name with Microsoft Entra ID.

Example:

```text
Default:
company.onmicrosoft.com

Custom:
company.com
```

## Domain Lifecycle

Understand the general process:

```text
Add domain
   ↓
Create verification record
   ↓
Verify domain ownership
   ↓
Domain becomes available
```

## Why It Matters

Custom domains allow organizations to use familiar organizational identities and sign-in names.

## SC-300 Focus

Know:

- Default `onmicrosoft.com` domain
- Custom domain
- Domain verification
- Domain management
- Domain Name Administrator role

## Interview / Real-World Question

> "A company wants users to sign in with `user@company.com` instead of the tenant's `onmicrosoft.com` address. What needs to be configured?"

Answer:

**Add and verify the organization's custom domain in Microsoft Entra ID.**

---

# 8. Tenant-Wide Settings

## What You Need to Know

**Tenant-wide settings** control behavior across the organization rather than a single user or resource.

Examples include settings affecting:

- User access
- Group behavior
- Guest behavior
- Application consent
- Organization configuration
- Other directory-wide behavior

## Administrator Thinking

Tenant-wide changes can have a broad impact.

Before changing one:

1. Identify what the setting controls.
2. Determine who will be affected.
3. Evaluate security implications.
4. Determine whether a narrower configuration is possible.
5. Document the change.
6. Monitor the result.

## SC-300 Focus

Understand the difference between:

**Object-level configuration** → affects a specific object

**Tenant-wide configuration** → can affect the organization

---

# 9. Initial Tenant Assessment

When taking responsibility for an existing Entra tenant, perform an initial assessment.

## Assessment Order

```text
1. Tenant
   ↓
2. Domains
   ↓
3. Privileged roles
   ↓
4. Administrative Units
   ↓
5. Organization / Branding
   ↓
6. Tenant-wide settings
   ↓
7. Security / least privilege
```

## Questions to Ask

### Tenant
- Is this the correct tenant?
- What is the tenant ID?
- What is the organization's primary domain?

### Roles
- Who has privileged roles?
- Are Global Administrators justified?
- Are roles assigned using least privilege?
- Are there unnecessary permanent assignments?

### Administrative Units
- Are AUs being used for delegated administration?
- Are administrators scoped appropriately?

### Domains
- Which domains are verified?
- Which domain is primary?
- Are there unexpected domains?

### Tenant Settings
- What organization-wide settings are enabled?
- Could any setting create unnecessary exposure?
- Are changes documented?

---

# 10. Troubleshooting Initial Configuration

When something isn't working, troubleshoot in stages instead of immediately changing permissions.

## Staged Troubleshooting

**1. Identify the task**

What exactly is failing?

```text
Cannot manage users
Cannot assign role
Cannot verify domain
Cannot modify tenant setting
Cannot access AU
```

**2. Identify the object**

What resource is being managed?

- User
- Group
- Domain
- Administrative Unit
- Tenant setting

**3. Identify the administrator**

Who is attempting the action?

- User
- Group
- Service principal

**4. Check the assigned role**

Does the administrator have the required Microsoft Entra role?

**5. Check the scope**

If an Administrative Unit is involved, is the administrator scoped to the correct AU?

**6. Check the specific permission**

Does the assigned role actually contain the required action?

**7. Check tenant configuration**

Could a tenant-wide setting or restriction prevent the action?

**8. Verify the result**

After correcting the issue, confirm the administrator can perform the intended task without receiving unnecessary permissions.

### Troubleshooting Mental Model

```text
Task
 ↓
Object
 ↓
Administrator
 ↓
Role
 ↓
Scope
 ↓
Permission
 ↓
Tenant Setting
 ↓
Verify
```

---

# 11. SC-300 Scenario Thinking

For exam questions, translate the scenario into:

```text
WHO?
   ↓
WHAT?
   ↓
WHERE?
   ↓
HOW MUCH ACCESS?
```

### WHO?

Who needs access?

### WHAT?

What administrative action must they perform?

### WHERE?

Is the action tenant-wide or limited to an Administrative Unit?

### HOW MUCH ACCESS?

What is the **least-privileged role** that satisfies the requirement?

---

# Interview Scenarios

## Scenario 1 — Global Administrator

**Question:**

A help desk employee needs to reset passwords for users in the HR department. They currently have Global Administrator.

What would you do?

**Think:**

- Global Administrator is excessive.
- Identify the required password-management permissions.
- Determine the appropriate role.
- Scope the role to the HR Administrative Unit when supported.
- Remove unnecessary Global Administrator access.

---

## Scenario 2 — Administrative Units

**Question:**

Your organization has separate HR, Finance, and IT departments. Regional help desk administrators should manage only their assigned department.

How would you design this?

**Think:**

```text
Department
    ↓
Administrative Unit
    ↓
Least-privileged role
    ↓
Scoped administrator
```

---

## Scenario 3 — Custom Domain

**Question:**

Users currently have `user@tenant.onmicrosoft.com`, but the organization wants `user@company.com`.

What do you configure?

**Answer path:**

**Custom domain → DNS verification → Configure domain → Use domain for identities**

---

## Scenario 4 — Role Selection

**Question:**

An administrator says:

> "I need Global Administrator because I need to manage users."

How do you respond?

**Answer:**

Determine the exact user-management tasks first. Then assign the least-privileged Microsoft Entra role that provides those permissions.

---

## Scenario 5 — Permission Troubleshooting

**Question:**

An administrator has an appropriate role but still cannot perform an action.

What do you investigate?

**Answer path:**

```text
Required task
 ↓
Object
 ↓
Assigned role
 ↓
Administrative Unit scope
 ↓
Specific role permission
 ↓
Tenant-wide restrictions/settings
 ↓
Verify
```

---

# SC-300 Knowledge Checklist

Before moving to the Day 1 lab, you should be able to explain:

- [ ] What an Entra tenant is
- [ ] What company branding controls
- [ ] What Microsoft Entra roles are
- [ ] Why Global Administrator should not be used unnecessarily
- [ ] What least privilege means
- [ ] How role assignments work
- [ ] What Administrative Units are
- [ ] How AUs enable delegated administration
- [ ] The difference between a role and an Administrative Unit
- [ ] How to evaluate role permissions
- [ ] What a custom domain is
- [ ] Why domain verification is required
- [ ] What tenant-wide settings are
- [ ] Why tenant-wide changes require careful evaluation
- [ ] How to troubleshoot an administrative permission problem
- [ ] How to choose the least-privileged solution in a scenario

---

# Interview / Real-World Skill Checklist

You should be able to:

- [ ] Perform an initial Entra tenant assessment
- [ ] Evaluate existing privileged role assignments
- [ ] Identify excessive Global Administrator assignments
- [ ] Select an appropriate administrative role based on required tasks
- [ ] Design delegated administration using Administrative Units
- [ ] Evaluate role permissions instead of relying only on role names
- [ ] Configure and verify a custom domain
- [ ] Evaluate tenant-wide settings before changing them
- [ ] Troubleshoot permission problems systematically
- [ ] Explain your IAM decisions using least privilege
- [ ] Explain why you chose one administrative design over another

---

# Real-World Administrator Mindset

The goal is not:

> **"How do I make this work?"**

The goal is:

> **"How do I make this work with the minimum necessary access, appropriate scope, and controlled organizational impact?"**

That is the mindset that connects **SC-300 exam knowledge → IAM administration → real-world security practice**.
