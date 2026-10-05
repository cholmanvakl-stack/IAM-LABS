# Day 4 — Implement and Manage Hybrid Identity

## Learning Module

### Microsoft Learn Alignment

**Microsoft Learn topic:** Implement and manage hybrid identity

**Day 4 focus:**
- Hybrid identity
- Microsoft Entra Connect
- Microsoft Entra Connect Sync
- Microsoft Entra Cloud Sync
- Password Hash Synchronization (PHS)
- Pass-through Authentication (PTA)
- Seamless Single Sign-On (SSO)
- Federation
- Synchronization troubleshooting
- Microsoft Entra Connect Health

**Primary goals:**
1. Prepare for **SC-300 Identity and Access Administrator** exam questions.
2. Build the knowledge and decision-making skills expected of a **real-world IAM administrator**.

---

# 1. Hybrid Identity

**Hybrid identity** → Connects on-premises Active Directory identities with Microsoft Entra ID.

### Core concept

A hybrid environment has:
- **On-premises Active Directory** → Source of identity information.
- **Microsoft Entra ID** → Cloud identity platform.
- **Synchronization** → Moves identity information between environments.
- **Authentication method** → Determines where/how users are authenticated.

### Administrator mindset

When working with hybrid identity, always separate:

**Identity synchronization** from **authentication**.

Synchronization answers:

> "Does the user exist correctly in Microsoft Entra ID?"

Authentication answers:

> "How does the user prove who they are?"

This distinction is critical for SC-300.

### How they connect:

**On-prem AD → synchronization → Microsoft Entra ID → authentication → resource access**

---

# 2. Microsoft Entra Connect

**Microsoft Entra Connect** → Microsoft's traditional solution for integrating on-premises Active Directory with Microsoft Entra ID.

It can provide:
- Identity synchronization
- Password Hash Synchronization
- Pass-through Authentication
- Seamless SSO

### Why administrators use it

It allows organizations to maintain identities on-premises while providing cloud identity capabilities through Microsoft Entra ID.

### Important distinction

Microsoft Entra Connect is the **overall integration solution**.

**Connect Sync** is the synchronization engine within that traditional architecture.

### How they connect:

**Entra Connect → synchronization + authentication integration → Microsoft Entra ID**

---

# 3. Microsoft Entra Connect Sync

**Connect Sync** → The traditional synchronization engine used to synchronize supported on-premises directory objects with Microsoft Entra ID.

### Common synchronized objects

- Users
- Groups
- Computers
- Contacts
- Other supported directory objects

### Important concepts

Synchronization depends on:
- Source directory
- Organizational Unit (OU) scope
- Attribute mappings
- Filtering
- Synchronization rules
- Connector configuration

### Administrator thinking

If a user exists on-premises but not in Entra ID, investigate the synchronization path before changing authentication settings.

### How they connect:

**On-prem AD → Connect Sync → Microsoft Entra ID**

---

# 4. Microsoft Entra Cloud Sync

**Cloud Sync** → A cloud-managed synchronization solution that uses a lightweight provisioning agent.

### Key characteristics

- Cloud-managed configuration
- Lightweight provisioning agent
- Synchronizes on-premises identities to Microsoft Entra ID
- Provides an alternative to traditional Connect Sync

### Connect Sync vs Cloud Sync

| | Connect Sync | Cloud Sync |
|---|---|---|
| Management | Primarily traditional/local configuration | Cloud-managed |
| Agent | Connect Sync engine | Lightweight provisioning agent |
| Purpose | Identity synchronization | Identity synchronization |
| Architecture | Traditional hybrid architecture | More cloud-managed architecture |

### Exam distinction

If the question emphasizes a **lightweight agent and cloud-managed provisioning**, think:

**Microsoft Entra Cloud Sync**

### How they connect:

Both solutions synchronize identity information, but they use different architectures.

---

# 5. Password Hash Synchronization

**PHS** → Synchronizes a representation of the on-premises password to Microsoft Entra ID so Entra ID can authenticate the user.

### Important

The user's actual password is **not** synchronized.

Microsoft Entra ID receives a protected representation used for authentication.

### Authentication flow

**User → Microsoft Entra sign-in → Entra validates credentials**

### Major advantage

Authentication does not require the user's password to be validated against on-premises Active Directory at sign-in time.

### Administrator decision

PHS is useful when an organization wants:
- Cloud authentication
- Reduced authentication dependency on on-premises infrastructure
- Simpler hybrid authentication

### How they connect:

**Connect Sync / Cloud Sync → identity synchronization**

**PHS → cloud authentication**

---

# 6. Pass-through Authentication

**PTA** → Allows Microsoft Entra ID to validate a user's password against on-premises Active Directory through authentication agents.

### Authentication flow

**User → Microsoft Entra sign-in → PTA agent → on-prem AD → authentication result**

### Important

PTA requires:
- PTA agents
- Connectivity to on-premises AD
- Healthy authentication infrastructure

### Administrator decision

PTA is useful when an organization wants password validation to remain on-premises.

### Major distinction

**PHS**
→ Authentication occurs in Microsoft Entra ID.

**PTA**
→ Password validation occurs against on-premises AD.

### How they connect:

PTA connects cloud sign-in with on-premises password validation.

---

# 7. Seamless Single Sign-On

**Seamless SSO** → Reduces repeated credential prompts for supported users in trusted corporate environments.

### Purpose

It improves the sign-in experience by allowing supported domain-joined users to authenticate without repeatedly entering credentials.

### Important distinction

Seamless SSO is **not the primary authentication method**.

It improves the user experience around authentication.

It can work with hybrid authentication configurations such as:
- PHS
- PTA

### Exam trap

Do not confuse:

**Seamless SSO**
with
**PHS or PTA**

PHS/PTA determine how authentication occurs.

Seamless SSO reduces the need for repeated credential entry.

### How they connect:

**Authentication method → authenticates the user**

**Seamless SSO → improves the sign-in experience**

---

# 8. Federation

**Federation** → Delegates authentication from Microsoft Entra ID to a trusted external identity provider.

### Example

**AD FS** → Common on-premises federation service.

### Authentication flow

**User → Microsoft Entra ID → trusted federation provider → authentication → Entra access**

### Important distinction

With federation:

**Microsoft Entra ID does not directly perform the user's primary authentication.**

The trusted identity provider handles authentication.

### When federation may be used

Organizations may use federation when they require:
- Existing federation infrastructure
- Specialized authentication requirements
- Advanced authentication customization

### How they connect:

**Microsoft Entra ID → trusted IdP → authentication**

---

# 9. Authentication Comparison

| Technology | Primary purpose | Authentication location | Key distinction |
|---|---|---|---|
| Connect Sync | Synchronization | N/A | Traditional synchronization engine |
| Cloud Sync | Synchronization | N/A | Cloud-managed + lightweight agent |
| PHS | Authentication | Microsoft Entra ID | Cloud validates authentication |
| PTA | Authentication | On-prem AD | Password validated through PTA agents |
| Federation | Authentication | Trusted IdP | Entra delegates authentication |
| Seamless SSO | Sign-in experience | Depends on authentication method | Reduces credential prompts |
| Connect Health | Monitoring | N/A | Monitors hybrid identity infrastructure |

### How they connect:

**Connect Sync / Cloud Sync**
→ move identity information.

**PHS / PTA / Federation**
→ determine how authentication occurs.

**Seamless SSO**
→ improves the user sign-in experience.

**Connect Health**
→ monitors the hybrid environment.

---

# 10. Synchronization Troubleshooting

**Synchronization troubleshooting** → Identify where the identity synchronization process is failing between on-premises Active Directory and Microsoft Entra ID.

Use a structured troubleshooting sequence rather than changing settings randomly.

### Troubleshooting sequence

**1. Source**

Verify:
- Does the user exist in on-premises AD?
- Is the correct object being modified?
- Are required attributes populated?

↓

**2. Scope**

Verify:
- Is the user's OU included?
- Is the domain included?
- Is the object excluded by filtering?

↓

**3. Sync engine / agent**

Verify:
- Is Connect Sync running?
- Is the Cloud Sync provisioning agent running?
- Is the synchronization component healthy?

↓

**4. Errors**

Check for:
- Synchronization errors
- Duplicate attributes
- Invalid attributes
- Configuration errors
- Object conflicts

↓

**5. Connectivity**

Verify:
- Synchronization component can communicate with required Microsoft services.
- Required network connectivity exists.
- Agents can communicate successfully.

↓

**6. Microsoft Entra ID**

Verify:
- Did the object reach Entra?
- Are the expected attributes present?
- Is the correct identity represented?

↓

**7. Result**

Confirm:
- User exists correctly.
- Attributes are correct.
- Group membership is correct.
- Expected downstream access works.

### Troubleshooting pattern

**Source → Scope → Engine/Agent → Errors → Connectivity → Entra → Result**

### How they connect:

Each stage eliminates a different failure point in the synchronization pipeline.

---

# 11. Microsoft Entra Connect Health

**Connect Health** → Monitors the health of hybrid identity infrastructure.

### Can monitor components such as:

- Microsoft Entra Connect
- AD FS
- Other supported hybrid identity components

### Administrator use

Connect Health helps identify:
- Health problems
- Agent issues
- Synchronization problems
- Authentication infrastructure problems

### Important distinction

Connect Health is primarily a **monitoring and visibility tool**.

It does not replace:
- Connect Sync
- Cloud Sync
- PHS
- PTA
- Federation

### How they connect:

**Hybrid identity components → Connect Health → monitoring and visibility**

---

# 12. Real-World Hybrid Identity Assessment

When inheriting a hybrid identity environment, evaluate it in layers.

### Identity source

Determine:
- Where identities originate.
- Whether Active Directory is authoritative.
- Which objects synchronize.

### Synchronization

Determine:
- Connect Sync or Cloud Sync?
- Synchronization scope?
- Filtering?
- Attribute mappings?
- Synchronization errors?

### Authentication

Determine:
- PHS?
- PTA?
- Federation?
- Seamless SSO?

### Infrastructure

Determine:
- Are agents healthy?
- Is connectivity working?
- Are servers/services healthy?
- Is redundancy configured?

### Monitoring

Determine:
- Is Connect Health configured?
- Are alerts being monitored?
- Are synchronization/authentication failures visible?

### How they connect:

**Source → Synchronization → Authentication → Infrastructure → Monitoring**

This is the mental model an IAM administrator should use when assessing a hybrid environment.

---

# 13. SC-300 Scenario Thinking

### Scenario 1 — User exists on-premises but not in Entra

Think:

**Source → Scope → Sync engine → Errors → Connectivity → Entra**

Do not immediately change authentication settings.

---

### Scenario 2 — User appears in Entra but cannot sign in

Think:

**Identity exists → authentication method → authentication infrastructure → credentials → sign-in result**

The problem may be authentication rather than synchronization.

---

### Scenario 3 — Password authentication must remain on-premises

Think:

**PTA**

---

### Scenario 4 — Organization wants cloud-based authentication with less dependency on on-premises AD

Think:

**PHS**

---

### Scenario 5 — Organization wants a cloud-managed synchronization architecture using a lightweight agent

Think:

**Cloud Sync**

---

### Scenario 6 — Users are repeatedly prompted for credentials

Think:

**Seamless SSO**

Then verify that the underlying authentication configuration is healthy.

---

### Scenario 7 — Authentication is delegated to an existing trusted identity provider

Think:

**Federation**

---

### Scenario 8 — Hybrid infrastructure needs centralized health monitoring

Think:

**Connect Health**

---

# 14. Interview Scenarios

### Interview Question 1

**"What is hybrid identity?"**

Strong answer:

Hybrid identity connects on-premises Active Directory identities with Microsoft Entra ID. Synchronization keeps identity information aligned, while an authentication method such as PHS, PTA, or federation determines how users authenticate.

---

### Interview Question 2

**"What's the difference between Connect Sync and Cloud Sync?"**

Strong answer:

Connect Sync is the traditional synchronization architecture, while Cloud Sync is a more cloud-managed synchronization solution that uses a lightweight provisioning agent.

---

### Interview Question 3

**"What's the difference between PHS and PTA?"**

Strong answer:

PHS allows Microsoft Entra ID to authenticate users using a synchronized password representation, while PTA sends the authentication request through an agent so the password is validated against on-premises Active Directory.

---

### Interview Question 4

**"A user exists in Active Directory but isn't appearing in Entra. What do you check?"**

Strong answer:

I would troubleshoot the synchronization path in order: verify the source object and attributes, confirm synchronization scope and filtering, check the sync engine or provisioning agent, review synchronization errors, verify connectivity, then confirm the resulting object in Microsoft Entra.

---

### Interview Question 5

**"What does Seamless SSO do?"**

Strong answer:

Seamless SSO reduces repeated credential prompts for supported users in trusted corporate environments. It improves the sign-in experience but isn't itself the underlying authentication method.

---

### Interview Question 6

**"What is Connect Health used for?"**

Strong answer:

Connect Health provides monitoring and visibility into supported hybrid identity components such as Microsoft Entra Connect and AD FS, helping administrators identify health and infrastructure issues.

---

# 15. SC-300 Knowledge Checklist

You should be able to explain:

- [ ] Hybrid identity
- [ ] Microsoft Entra Connect
- [ ] Connect Sync
- [ ] Cloud Sync
- [ ] PHS
- [ ] PTA
- [ ] Seamless SSO
- [ ] Federation
- [ ] AD FS
- [ ] Synchronization scope
- [ ] Synchronization errors
- [ ] Provisioning agents
- [ ] Connect Health
- [ ] Synchronization vs authentication
- [ ] PHS vs PTA
- [ ] Connect Sync vs Cloud Sync
- [ ] When federation is involved
- [ ] How to troubleshoot synchronization

---

# 16. Interview / Real-World Skill Checklist

You should be able to:

- Explain a hybrid identity architecture.
- Identify the identity source.
- Identify the synchronization technology.
- Identify the authentication method.
- Explain the authentication flow.
- Determine whether a problem is synchronization or authentication.
- Troubleshoot synchronization logically.
- Identify scope and filtering problems.
- Identify synchronization errors.
- Evaluate agent health.
- Evaluate hybrid identity monitoring.
- Explain PHS vs PTA.
- Explain Connect Sync vs Cloud Sync.
- Explain federation.
- Explain Seamless SSO.
- Explain the purpose of Connect Health.
- Assess a hybrid identity environment from an administrator perspective.

---

# 17. Real-World Administrator Mindset

A hybrid identity administrator should not think:

> "The user can't sign in, so I'll reset the password."

Instead, think:

> **Where is the identity failing?**

Determine whether the problem is:

**Source → Synchronization → Authentication → Infrastructure → Authorization**

Then troubleshoot only the failing layer.

The most important Day 4 skill is understanding that **identity synchronization and authentication are separate parts of the identity system**.

---

# Day 4 Master Mental Model

```text
                 ON-PREMISES
              Active Directory
                     │
                     ▼
          ┌─────────────────────┐
          │ Synchronization     │
          │                     │
          │ Connect Sync        │
          │        OR           │
          │ Cloud Sync          │
          └──────────┬──────────┘
                     │
                     ▼
              Microsoft Entra ID
                     │
          ┌──────────┼──────────┐
          ▼          ▼          ▼
         PHS        PTA     Federation
          │          │          │
          │          │          ▼
          │          │       Trusted IdP
          │          │
          └────┬─────┘
               ▼
          Authentication
               │
               ▼
         Resource Access

      Seamless SSO = Sign-in experience
      Connect Health = Monitoring
```

**Core rule:**

**Synchronization gets the identity into Entra.**

**Authentication proves the identity.**

**Authorization determines what the identity can access.**

**Monitoring tells you whether the hybrid infrastructure is healthy.**
