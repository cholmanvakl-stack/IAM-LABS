# Day 3 — Implement and Manage External Identities

## Learning Module

**Microsoft Learn alignment:**  
Implement and manage external identities

**Primary goals:**

1. **SC-300 Exam Preparation** — Understand B2B, guest users, external collaboration, identity providers, Verified ID, and cross-tenant access.
2. **IAM Administrator Preparation** — Design, configure, secure, troubleshoot, and manage external identities in a real Microsoft Entra environment.

---

# 1. Guest Users

**Guest user** → An external identity represented in your Microsoft Entra tenant.

A guest can be:

- Invited from another organization
- Invited using another identity
- Added to groups
- Assigned licenses
- Given access to resources

### Key Concept

The guest's **home identity remains external**, while your tenant creates a representation of that identity.

```text id="p6l8ki"
External Identity
      ↓
Invitation
      ↓
Your Entra Tenant
      ↓
Guest User
      ↓
Resource Access
```

### SC-300 Focus

Know:

**Guest ≠ Member**

Guest users represent external collaboration identities.

---

# 2. Microsoft Entra B2B Collaboration

**B2B collaboration** → Allows external users to access organizational resources using their existing identity.

The external user's home organization remains responsible for their identity.

Your organization controls:

- What resources they can access
- Which groups they belong to
- What permissions they receive
- When their access is removed

### Core Model

```text id="4c5lwh"
External Organization
        │
        │ Identity
        ▼
   Your Entra Tenant
        │
        ▼
 Organizational Resources
```

### SC-300 Focus

Remember:

> **B2B allows external identities to collaborate with your organization without creating a completely separate identity for them.**

---

# 3. External Collaboration Settings

**External collaboration settings** → Organization-wide controls that determine how external users can collaborate with the tenant.

Settings can control:

- Who can invite guests
- Whether guests can be invited
- Domain restrictions
- Guest access to directory information

### Administrator Thinking

Before allowing external collaboration, determine:

1. Who should be allowed to invite guests?
2. Which external domains are trusted?
3. What directory information should guests see?
4. What resources can guests access?
5. How will guest access be reviewed?

### SC-300 Focus

Distinguish:

**External collaboration settings**  
→ General tenant-level guest collaboration controls.

**Cross-tenant access**  
→ Organization-specific trust and collaboration controls.

---

# 4. External User Invitations

External users can be invited individually or through bulk processes.

## Individual Invitation

```text id="w9bjqg"
Administrator
      ↓
Invite External User
      ↓
Guest Account
      ↓
User Accepts
      ↓
Access Granted
```

## Bulk Invitation

Useful when many external users require access.

Examples:

- Contractors
- Partners
- Vendors
- Project teams

### Administrator Thinking

Bulk invitations require additional attention to:

- Correct identities
- Correct domains
- Correct groups
- Correct access
- Invitation status
- Unused invitations

### SC-300 Focus

Know that **invitation creates the external user relationship; invitation alone does not automatically grant access to every organizational resource.**

---

# 5. Guest Management

**Guest management** → Managing external users throughout their access lifecycle.

Administrators should manage:

- Guest properties
- Account status
- Group membership
- Resource access
- Licenses
- Invitations
- Access removal

### Guest Lifecycle

```text id="ytbqxy"
Invite
  ↓
Accept
  ↓
Access
  ↓
Manage
  ↓
Review
  ↓
Remove
```

### Real-World Question

> "A contractor's project has ended. What should happen?"

Do not simply leave the guest account active.

Evaluate:

- Remove resource access
- Remove group membership
- Remove unnecessary licenses
- Disable/delete the guest according to organizational policy
- Preserve required records

---

# 6. External Users in Microsoft 365

Guest users can collaborate with Microsoft 365 resources when the appropriate permissions and collaboration settings allow it.

Possible collaboration includes resources such as:

- Microsoft Teams
- SharePoint
- Microsoft 365 Groups

### Important Concept

Guest identity does **not automatically equal resource access**.

```text id="u3c6wu"
Guest User
     ↓
Group / Resource Assignment
     ↓
Permission
     ↓
Microsoft 365 Resource
```

### SC-300 Focus

Always separate:

**Identity exists**

from

**Identity has access**

---

# 7. Dynamic Groups for External Users

**Dynamic group** → Automatically manages membership based on identity attributes.

A common external-user attribute is:

```text id="x4z6sm"
userType = Guest
```

This can allow an organization to automatically group guest users.

```text id="u5m0fy"
Guest User
    ↓
userType = Guest
    ↓
Dynamic Group Rule
    ↓
Guest Group
```

### Why It Matters

Dynamic groups can automate:

- Guest classification
- Licensing
- Access management
- Policy targeting
- Administrative workflows

### SC-300 Focus

Know that dynamic groups can use user attributes to automatically add or remove members.

---

# 8. Microsoft Entra Verified ID

**Microsoft Entra Verified ID** → A verifiable credential system that allows identity information to be issued, presented, and verified digitally.

Core concepts:

**Issuer**
→ Organization that issues a credential.

**Holder**
→ Person who holds the credential.

**Verifier**
→ Organization that verifies the credential.

```text id="0g1b9d"
Issuer
  ↓
Credential
  ↓
Holder
  ↓
Verifier
```

### Why It Matters

Verified ID can allow an organization to verify specific identity information without relying solely on traditional directory accounts.

### SC-300 Focus

Understand:

**Verified ID = verifiable digital credentials**

It is different from:

**B2B = external resource collaboration**

---

# 9. External Identity Providers

**External identity provider** → A service that authenticates an external identity.

Microsoft Entra can integrate with external identity providers using supported federation protocols.

Common federation protocols include:

- SAML
- WS-Federation

### Authentication Flow

```text id="m8x5si"
External User
      ↓
External Identity Provider
      ↓
Microsoft Entra
      ↓
Resource Access
```

### Important Distinction

The identity provider handles **authentication**.

Microsoft Entra controls the resulting **access to organizational resources**.

### SC-300 Focus

Know:

**Identity Provider → Authentication**

**Entra → Access / resource authorization**

---

# 10. Cross-Tenant Access

**Cross-tenant access** → Controls collaboration and trust between Microsoft Entra organizations.

It provides organizational-specific controls for external collaboration.

## Inbound Access

**Inbound** → External users accessing your organization's resources.

```text id="y9lqju"
External Tenant
      ↓
Your Tenant
      ↓
Your Resources
```

## Outbound Access

**Outbound** → Your users accessing resources in another organization.

```text id="j6b8ut"
Your Tenant
      ↓
External Tenant
      ↓
External Resources
```

### Trust Settings

Organizations can configure trust for selected authentication or device claims where supported.

### SC-300 Focus

Remember:

**Inbound = into your tenant**

**Outbound = out of your tenant**

---

# 11. External Collaboration vs Cross-Tenant Access

This distinction is important for SC-300 scenarios.

| Capability | Primary purpose |
|---|---|
| **B2B collaboration** | External users access organizational resources |
| **External collaboration settings** | General rules for guest collaboration |
| **Identity provider** | External authentication |
| **Cross-tenant access** | Organization-to-organization collaboration and trust |
| **Dynamic group** | Automatically groups identities |
| **Verified ID** | Verifies digital credentials |

### Administrator Thinking

When given an external-access scenario, ask:

```text id="p2f44b"
Who is the external user?
        ↓
How will they authenticate?
        ↓
Which tenant owns the resource?
        ↓
Is access inbound or outbound?
        ↓
What collaboration policy applies?
        ↓
What resource access is required?
```

---

# 12. Staged External Identity Troubleshooting

When external collaboration fails, troubleshoot the identity flow in stages.

### Stage 1 — Identify the External User

Verify:

- Correct guest account
- Correct UPN/email
- User type
- Account status

### Stage 2 — Check the Invitation

Determine:

- Was an invitation sent?
- Was it accepted?
- Is the invitation still valid?
- Was the correct identity invited?

### Stage 3 — Check Authentication

Determine:

- Which identity provider is being used?
- Can the external user authenticate?
- Is federation functioning?
- Is the expected authentication method being used?

### Stage 4 — Check Collaboration Settings

Verify:

- Guest invitation settings
- Domain restrictions
- Guest access restrictions
- External collaboration configuration

### Stage 5 — Check Cross-Tenant Access

If another Entra organization is involved:

- Check inbound access
- Check outbound access
- Check organization-specific settings
- Check trust settings

### Stage 6 — Check Resource Access

Verify:

- Group membership
- Resource assignment
- Application assignment
- Share permissions
- Microsoft 365 resource permissions

### Stage 7 — Check Dynamic Membership

If access depends on a dynamic group:

- Check the user's attributes
- Check the membership rule
- Check membership processing
- Verify group membership

### Stage 8 — Verify

Confirm the external user can access **only the resources they are supposed to access**.

### Troubleshooting Mental Model

```text id="n9p0qv"
Guest Identity
     ↓
Invitation
     ↓
Authentication
     ↓
Collaboration Settings
     ↓
Cross-Tenant Controls
     ↓
Group / Resource Access
     ↓
Dynamic Membership
     ↓
Verify
```

---

# 13. SC-300 Scenario Thinking

For external identity questions, translate the scenario into:

```text id="b9u5gv"
WHO?
 ↓
WHICH TENANT?
 ↓
HOW DO THEY AUTHENTICATE?
 ↓
INBOUND OR OUTBOUND?
 ↓
WHAT POLICY APPLIES?
 ↓
WHAT RESOURCE?
 ↓
WHAT ACCESS?
```

This prevents confusing B2B, identity providers, external collaboration settings, and cross-tenant access.

---

# Interview Scenarios

## Scenario 1 — Contractor Access

**Question:**

A contractor from another company needs access to a SharePoint site.

How would you approach it?

**Answer path:**

```text id="5q2s3d"
External identity
      ↓
B2B guest
      ↓
Invitation
      ↓
Authentication
      ↓
Group / resource permission
      ↓
SharePoint access
```

---

## Scenario 2 — Guest Can Sign In but Cannot Access Resource

**Question:**

A guest successfully signs in but cannot access a Teams team.

What do you investigate?

**Answer path:**

```text id="2ohq3j"
Guest exists
 ↓
Account enabled
 ↓
Authentication succeeds
 ↓
Correct group/team membership?
 ↓
Resource permissions?
 ↓
External collaboration settings?
 ↓
Cross-tenant restrictions?
```

The key principle:

> **Successful authentication does not prove authorization.**

---

## Scenario 3 — External Organization Cannot Access You

**Question:**

Users from another Entra tenant cannot collaborate with your organization.

What do you check?

**Answer path:**

```text id="3x8kpn"
Guest / B2B configuration
 ↓
External collaboration settings
 ↓
Cross-tenant inbound access
 ↓
Organization-specific settings
 ↓
Trust settings
 ↓
Resource permissions
```

---

## Scenario 4 — Automatically Manage Guests

**Question:**

Your organization wants all guest users placed into a specific group automatically.

What would you use?

**Answer:**

**Dynamic group using an appropriate guest-related user attribute/rule.**

---

## Scenario 5 — External Authentication

**Question:**

An external organization wants its users to authenticate using its existing identity provider.

What capability should you evaluate?

**Answer:**

**External identity provider / federation.**

---

## Scenario 6 — Inbound vs Outbound

**Question:**

Your users need to access resources in another organization's Entra tenant.

Is that inbound or outbound?

**Answer:**

**Outbound from your tenant.**

---

# SC-300 Knowledge Checklist

Before moving to the Day 3 lab, you should be able to explain:

- [ ] Guest users
- [ ] B2B collaboration
- [ ] External collaboration settings
- [ ] Individual invitations
- [ ] Bulk invitations
- [ ] Guest lifecycle management
- [ ] External users in Microsoft 365
- [ ] Dynamic groups for external users
- [ ] Microsoft Entra Verified ID
- [ ] Issuer, holder, and verifier
- [ ] External identity providers
- [ ] SAML and WS-Federation
- [ ] Cross-tenant access
- [ ] Inbound access
- [ ] Outbound access
- [ ] Trust settings
- [ ] B2B vs external collaboration settings
- [ ] Identity provider vs cross-tenant access
- [ ] Authentication vs authorization
- [ ] External identity troubleshooting

---

# Interview / Real-World Skill Checklist

You should be able to:

- [ ] Invite and manage guest users
- [ ] Explain B2B collaboration
- [ ] Design external collaboration controls
- [ ] Manage individual and bulk invitations
- [ ] Manage guest access throughout its lifecycle
- [ ] Control external access to Microsoft 365 resources
- [ ] Automate guest grouping with dynamic groups
- [ ] Explain Verified ID
- [ ] Explain the role of an external identity provider
- [ ] Evaluate inbound vs outbound cross-tenant access
- [ ] Evaluate cross-tenant trust settings
- [ ] Troubleshoot external-user access systematically
- [ ] Separate authentication problems from authorization problems
- [ ] Apply least privilege to external identities
- [ ] Explain why an external user has access to a specific resource

---

# Real-World Administrator Mindset

The goal is not:

> **"Let the guest into the tenant."**

The goal is:

> **"Allow the right external identity to authenticate, establish the correct trust relationship, and access only the resources required for the business purpose — then remove that access when it is no longer needed."**
