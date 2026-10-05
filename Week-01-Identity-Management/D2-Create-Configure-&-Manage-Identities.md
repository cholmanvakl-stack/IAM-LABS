# Day 2 — Create, Configure, and Manage Identities

## Learning Module

**Microsoft Learn alignment:**  
Create, configure, and manage identities

**Primary goals:**

1. **SC-300 Exam Preparation** — Understand the identity-management concepts, scenarios, and distinctions Microsoft can test.
2. **IAM Administrator Preparation** — Build the ability to create, manage, troubleshoot, and automate identities in a real Microsoft Entra environment.

---

# 1. Users

**User** → An identity in Microsoft Entra ID that can authenticate and access organizational resources.

### User Types

**Member**
→ Internal organizational identity.

**Guest**
→ External identity invited to collaborate with the organization.

### User Lifecycle

```text
Create
  ↓
Configure
  ↓
Assign access/licenses
  ↓
Manage
  ↓
Disable
  ↓
Delete
  ↓
Restore or permanently remove
```

### Administrator Responsibilities

An IAM administrator may need to:

- Create users
- Modify user properties
- Enable/disable accounts
- Reset passwords
- Manage authentication-related properties
- Assign licenses
- Manage group membership
- Remove users when access is no longer required

### SC-300 Focus

Know the difference between:

**Member vs Guest**

**Enabled vs Disabled**

**Deleted vs Permanently Deleted**

### Interview / Real-World Question

> "A user leaves the company. What should happen to their Entra account?"

Think about the **identity lifecycle**, not simply deleting the account immediately.

Consider:

- Disable sign-in
- Remove access
- Review licenses
- Review group memberships
- Preserve required data
- Follow organizational retention/offboarding procedures
- Delete when appropriate

---

# 2. User Properties

User properties provide information used to identify and manage users.

Common properties include:

- Display name
- User Principal Name (UPN)
- Mail
- Job title
- Department
- Office
- Manager
- Account status
- User type

### Why Properties Matter

User attributes can drive automation.

Example:

```text
Department = Finance
        ↓
Dynamic group rule
        ↓
Finance group
        ↓
Access / licensing
```

### SC-300 Focus

Understand that **user attributes can be used by dynamic membership rules and identity-management automation**.

### Interview / Real-World Question

> "How could you automatically place all Finance employees into a Finance group?"

Use a **dynamic group based on the user's attributes**.

---

# 3. User Licensing

**License assignment** → Provides users access to Microsoft services and features.

Licenses can be assigned:

- Directly to a user
- Through a group

### Direct Assignment

```text
User
 ↓
License
```

Useful for individual exceptions or specific users.

### Group-Based Licensing

```text
Group
 ↓
License
 ↓
Group Members
```

Useful for scalable administration.

### Why Group-Based Licensing Matters

Instead of manually assigning licenses to hundreds of users:

```text
Department
     ↓
Dynamic Group
     ↓
License
     ↓
All qualifying users
```

### SC-300 Focus

Know the difference between:

**Direct licensing** → assigned to an individual user

**Group-based licensing** → inherited through group membership

### Interview / Real-World Question

> "Your organization hires 50 Finance employees. How would you automatically license them?"

Think:

**User attribute → Dynamic group → Group-based license**

---

# 4. Groups

**Group** → A collection of identities managed together.

### Security Groups

Primarily used for:

- Access control
- Permissions
- Licensing
- Resource assignment

### Microsoft 365 Groups

Primarily designed for collaboration and Microsoft 365 workloads.

### Group Membership

**Assigned membership**
→ Administrator manually manages membership.

**Dynamic membership**
→ Membership is automatically calculated from rules.

### SC-300 Focus

Understand:

```text
Assigned
→ Manual membership

Dynamic
→ Rule-based membership
```

### Interview / Real-World Question

> "Why would you use a dynamic group instead of manually adding users?"

Because membership can automatically change as user attributes change.

---

# 5. Device Registration

**Device registration** → Establishes a relationship between a device and Microsoft Entra ID.

Common device identity states include:

### Microsoft Entra Registered

Typically used for personally owned/BYOD scenarios.

```text
Personal device
      ↓
Registered with Entra
```

### Microsoft Entra Joined

The device is joined directly to Microsoft Entra ID.

```text
Organization-managed device
      ↓
Entra Joined
```

### Microsoft Entra Hybrid Joined

The device is joined to on-premises Active Directory and registered with Microsoft Entra ID.

```text
On-Prem AD
    +
Entra ID
    ↓
Hybrid Joined
```

### SC-300 Focus

Know the distinction:

| Device state | Core idea |
|---|---|
| **Registered** | Device has a relationship with Entra |
| **Entra Joined** | Device is joined to Entra |
| **Hybrid Joined** | Device is joined to on-prem AD and Entra |

### Interview / Real-World Question

> "Your organization has Windows devices joined to on-premises AD but wants them represented in Entra ID. Which device identity model should you evaluate?"

**Microsoft Entra hybrid joined.**

---

# 6. Group and User License Assignments

Licensing should be designed around the organization's identity structure.

### Individual Licensing

```text
User
 ↓
License
```

### Group Licensing

```text
User
 ↓
Group
 ↓
License
```

### Dynamic Group Licensing

```text
User Attribute
      ↓
Dynamic Group
      ↓
License
```

This can create automated licensing based on:

- Department
- Job title
- Location
- Other supported attributes

### Administrator Thinking

Before assigning licenses:

1. Determine who requires the service.
2. Determine whether the assignment should be individual or group-based.
3. Determine whether membership can be automated.
4. Avoid unnecessary licenses.
5. Monitor assignment failures.

### SC-300 Focus

The exam can test which licensing method is most appropriate for a scenario.

---

# 7. Deleted Users

When a user is deleted, the account may remain in a recoverable deleted state for a limited period.

### Lifecycle

```text
Active User
    ↓
Delete
    ↓
Deleted User
    ↓
Restore
OR
Permanent Delete
```

### Restore

Restoring a deleted user can recover the identity during the supported recovery period.

### Permanent Deletion

Permanent deletion removes the deleted user so it cannot be restored through the normal recovery process.

### Administrator Thinking

Before permanently deleting an identity, determine:

- Is recovery still required?
- Is data retention involved?
- Are there dependencies?
- Is the account actually supposed to be removed permanently?

### SC-300 Focus

Know the distinction:

**Delete** ≠ **Permanent deletion**

**Restore** is possible only while the deleted object remains recoverable.

---

# 8. Custom Security Attributes

**Custom security attributes** → Custom key-value attributes that can be assigned to supported identities for additional identity classification.

Example:

```text
User
 ↓
Custom Security Attribute
 ↓
Classification / Identity Data
```

They can help organizations represent information that standard user properties do not provide.

### Security Consideration

Custom security attributes are designed for **controlled identity information**, not simply arbitrary profile data.

Access to these attributes should be managed carefully because they can contain sensitive organizational information.

### SC-300 Focus

Understand that custom security attributes provide **additional structured identity information** beyond standard directory properties.

### Interview / Real-World Question

> "Your organization needs to classify users using an attribute that isn't available in the standard user properties. What Entra capability could you evaluate?"

**Custom security attributes.**

---

# 9. Automatic User Creation

Automatic user creation allows identities to be created based on automated processes rather than requiring administrators to manually create every account.

This can support scenarios such as:

- HR-driven identity creation
- Application provisioning
- Automated identity lifecycle processes
- External identity workflows

### Administrator Thinking

Automation should have:

- A defined source
- Defined attributes
- Defined rules
- Controlled permissions
- Error handling
- Monitoring

### SC-300 Focus

Understand the difference between:

**Manual identity creation**
→ Administrator creates the account.

**Automated identity creation**
→ A configured process creates/provisions the identity.

---

# 10. Identity Lifecycle Management

All of these capabilities fit into the identity lifecycle.

```text
        CREATE
           ↓
      Configure
           ↓
     Group / License
           ↓
      Device / Access
           ↓
         Manage
           ↓
        Disable
           ↓
         Delete
           ↓
   Restore / Remove
```

### Administrator Responsibility

The goal is not simply to create users.

The goal is to ensure:

**Right identity + right attributes + right access + right license + right lifecycle**

---

# 11. Staged Identity Troubleshooting

When a user has a problem, troubleshoot the identity from the source outward.

### Stage 1 — Identify the User

Confirm:

- Correct user
- UPN
- User type
- Account status

### Stage 2 — Check User Properties

Verify relevant attributes:

- Department
- Job title
- Manager
- Required identity information

### Stage 3 — Check Group Membership

Determine:

- Assigned groups
- Dynamic groups
- Membership rules
- Whether the user qualifies for the group

### Stage 4 — Check Licensing

Determine:

- Direct licenses
- Group-based licenses
- Assignment errors
- Whether the user qualifies for the licensing group

### Stage 5 — Check Device Identity

If the problem involves a device:

- Registered?
- Entra joined?
- Hybrid joined?
- Correct user/device relationship?

### Stage 6 — Check Access Dependencies

Determine whether the user's:

- Group membership
- License
- Device state
- User properties

are preventing the expected experience.

### Stage 7 — Check Lifecycle State

Verify the account isn't:

- Disabled
- Deleted
- In an unexpected guest/member state

### Stage 8 — Verify

Confirm the final state matches the intended identity design.

### Troubleshooting Mental Model

```text
User
 ↓
Properties
 ↓
Groups
 ↓
Licenses
 ↓
Device
 ↓
Access dependencies
 ↓
Lifecycle state
 ↓
Verify
```

---

# 12. SC-300 Scenario Thinking

For identity-management questions, translate the scenario into:

```text
WHO?
 ↓
WHAT?
 ↓
WHICH ATTRIBUTE?
 ↓
WHICH GROUP?
 ↓
WHICH LICENSE?
 ↓
WHICH DEVICE STATE?
 ↓
WHICH LIFECYCLE ACTION?
```

Ask:

> **What identity state should exist after the operation?**

---

# Interview Scenarios

## Scenario 1 — Automated Licensing

**Question:**

Your organization wants every Finance employee to automatically receive the same Microsoft license.

What would you design?

**Answer path:**

```text
Department attribute
       ↓
Dynamic group
       ↓
Group-based licensing
       ↓
Finance users receive license
```

---

## Scenario 2 — Employee Offboarding

**Question:**

An employee leaves the company. What do you do with their Entra identity?

**Answer path:**

```text
Disable
 ↓
Remove access
 ↓
Review groups/licenses/devices
 ↓
Preserve required data
 ↓
Delete when appropriate
 ↓
Permanent removal only when approved
```

---

## Scenario 3 — Device Identity

**Question:**

A Windows device is joined to on-premises Active Directory and also needs an identity in Entra ID.

What should you evaluate?

**Answer:**

**Microsoft Entra hybrid join.**

---

## Scenario 4 — Dynamic Group Problem

**Question:**

A user should belong to the Finance dynamic group but does not.

What would you check?

**Answer path:**

```text
User attribute
 ↓
Dynamic membership rule
 ↓
User qualifies?
 ↓
Group processing
 ↓
Membership
 ↓
Verify
```

---

## Scenario 5 — License Problem

**Question:**

A user is a member of a licensed group but did not receive the expected license.

What would you investigate?

**Answer path:**

```text
User membership
 ↓
Group license assignment
 ↓
License availability
 ↓
Assignment errors
 ↓
User eligibility
 ↓
Verify license
```

---

# SC-300 Knowledge Checklist

Before moving to the Day 2 lab, you should be able to explain:

- [ ] User types
- [ ] User lifecycle
- [ ] Important user properties
- [ ] Direct vs group-based licensing
- [ ] Security groups vs Microsoft 365 groups
- [ ] Assigned vs dynamic membership
- [ ] Dynamic group rules
- [ ] Registered vs Entra joined vs hybrid joined devices
- [ ] Deleted-user recovery
- [ ] Permanent user deletion
- [ ] Custom security attributes
- [ ] Automatic user creation
- [ ] Identity lifecycle management
- [ ] How attributes can drive automation
- [ ] How group membership can drive licensing
- [ ] How to troubleshoot identity problems systematically

---

# Interview / Real-World Skill Checklist

You should be able to:

- [ ] Create and manage Entra users
- [ ] Evaluate user properties
- [ ] Design group structures
- [ ] Choose assigned vs dynamic membership
- [ ] Design automated group-based licensing
- [ ] Investigate license assignment failures
- [ ] Understand Entra device identity states
- [ ] Handle deleted-user recovery
- [ ] Evaluate permanent deletion
- [ ] Use custom security attributes appropriately
- [ ] Explain automated identity creation
- [ ] Troubleshoot identity problems in stages
- [ ] Explain identity-management decisions using automation, lifecycle management, and least privilege

---

# Real-World Administrator Mindset

The goal is not:

> **"Create the user."**

The goal is:

> **"Design the identity lifecycle so the correct users automatically receive the correct attributes, groups, licenses, device relationships, and access — while minimizing manual administration."**
