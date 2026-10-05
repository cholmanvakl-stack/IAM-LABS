# Week 2 — Day 3: Plan, Implement, and Administer Conditional Access

## Learning Module

### Microsoft Learn Alignment

**Microsoft Learn path:** Implement an authentication and access management solution

**Microsoft Learn module:** Plan, implement, and administer Conditional Access

**Module length:** 1 hour 5 minutes / 13 units

**Day 3 focus:**
- Security defaults
- Conditional Access planning
- Conditional Access policies
- Policy assignments
- Policy controls
- Authentication controls
- Testing and troubleshooting
- Application controls
- Session management
- Continuous Access Evaluation (CAE)
- Authentication session controls
- Conditional Access Optimization agent
- Conditional Access protection for agent identities

Microsoft Learn describes Conditional Access as providing granular control over **which identities can perform activities, which resources they can access, and the security requirements that must be satisfied**.

---

# Goal 1 — SC-300 Exam Preparation

## 1. Conditional Access

**Conditional Access** → A policy-based access control system that evaluates signals about a sign-in and applies access requirements.

### Conditional Access can evaluate

- Users
- Groups
- Applications
- Devices
- Locations
- Risk
- Authentication context
- Other supported conditions

### Conditional Access can enforce

- Block access
- Grant access
- Require MFA
- Require authentication strength
- Require a compliant device
- Apply session controls

### Core mental model

```text
SIGN-IN REQUEST
      ↓
CONDITIONS
      ↓
CONDITIONAL ACCESS POLICY
      ↓
ACCESS CONTROLS
      ↓
ALLOW / REQUIRE CONTROLS / BLOCK
```

### How they connect:

**Signals → policy evaluation → controls → access decision**

---

# 2. Security Defaults

**Security defaults** → Microsoft Entra's baseline security configuration designed to provide basic identity protection with minimal configuration.

### Purpose

Security defaults help organizations establish foundational security controls without designing a full Conditional Access strategy.

### Important distinction

Security defaults are **not the same thing as Conditional Access policies**.

Think:

**Security defaults**
→ baseline protection.

**Conditional Access**
→ granular, customizable access control.

### Administrator decision

Organizations generally choose the security-default approach or build a more customized Conditional Access strategy appropriate to their environment.

### How they connect:

**Security defaults → baseline protection**

**Conditional Access → granular policy control**

---

# 3. Conditional Access Planning

**Conditional Access planning** → Designing policies before deploying them to production.

### Before creating a policy, determine:

**Who**
- Users
- Groups
- Administrative roles
- Workload identities where supported

**What**
- Cloud applications
- Resources
- Actions

**When**
- Locations
- Device conditions
- Risk
- Authentication context
- Other supported conditions

**What requirement**
- MFA
- Authentication strength
- Compliant device
- Block
- Other grant controls

**What session behavior**
- Sign-in frequency
- Persistent browser session
- Other supported session controls

### Administrator principle

Do not begin with:

> "Which setting should I enable?"

Begin with:

> **"What access decision am I trying to enforce?"**

### How they connect:

**Business requirement → target → conditions → controls → policy → testing**

---

# 4. Conditional Access Policies

**Conditional Access policy** → A set of conditions and access controls that determines how a sign-in should be handled.

### Basic policy structure

```text
IF
  user meets conditions
  AND
  resource meets conditions
  AND
  other conditions match

THEN
  require control
  OR
  block access
```

### Example

```text
IF
  user accesses Microsoft 365

AND
  user is outside trusted location

THEN
  require MFA
```

### Important

A policy should have a clearly defined purpose.

Avoid creating policies simply because a setting exists.

### How they connect:

**Conditions determine when the policy applies.**

**Controls determine what happens when it applies.**

---

# 5. Policy Assignments

**Policy assignment** → Defines which identities and resources a Conditional Access policy applies to.

### Common targeting

**Users and groups**
- Specific users
- Specific groups
- All users
- Exclusions

**Cloud applications**
- Specific applications
- Selected resources
- All supported cloud apps

### Critical concept

A policy can be technically correct but ineffective if the wrong users or applications are targeted.

### Example

```text
Policy:
Require MFA

Target:
Help Desk group

Application:
Microsoft 365

Result:
Help Desk users accessing Microsoft 365
must satisfy the configured MFA requirement.
```

### How they connect:

**Assignment → determines policy scope**

---

# 6. Policy Conditions

**Policy conditions** → Signals that determine when a Conditional Access policy applies.

### Common conditions

- User/group
- Cloud application
- Device platform
- Location
- Client app
- Risk
- Authentication flow
- Device state
- Other supported signals

### Example

```text
Users:
Help Desk

Application:
Microsoft 365

Location:
Outside trusted locations

Result:
MFA required
```

### Administrator mindset

Conditions answer:

> **"When should this policy apply?"**

### How they connect:

**Conditions → policy applicability**

---

# 7. Grant Controls

**Grant controls** → Define what must be satisfied before access is granted.

### Examples

- Require MFA
- Require authentication strength
- Require compliant device
- Require hybrid joined device
- Require approved client app
- Block access

### Important distinction

Conditions determine:

**When the policy applies.**

Grant controls determine:

**What the user must satisfy.**

### How they connect:

**Conditions → trigger policy**

**Grant controls → enforce requirement**

---

# 8. Authentication Controls

**Authentication controls** → Conditional Access controls that require a specific authentication requirement before access is granted.

### Examples

- Require multifactor authentication.
- Require authentication strength.
- Require a specific strong authentication method.

### Authentication strength

Authentication strength allows an administrator to specify the level/type of authentication required.

Example:

```text
Sensitive application
        ↓
Conditional Access
        ↓
Authentication strength
        ↓
Phishing-resistant authentication required
```

### How they connect:

**Conditional Access → authentication requirement → authentication method**

---

# 9. Application Controls

**Application controls** → Controls that manage access to applications and can provide additional session or data protections.

### Conditional Access App Control

Conditional Access App Control integrates Conditional Access with Microsoft Defender for Cloud Apps.

It can provide:
- Real-time session monitoring
- Session controls
- Access controls
- Data protection capabilities

### Important

Conditional Access determines the access conditions.

Defender for Cloud Apps can provide additional controls over the application session.

### How they connect:

**Conditional Access → application access decision → App Control → session/data controls**

---

# 10. Session Management

**Session management** → Controls how an authenticated user's session behaves after access is granted.

### Examples

- Sign-in frequency
- Persistent browser session
- Application-enforced restrictions
- Continuous Access Evaluation
- Token protection where supported

### Sign-in frequency

Controls how often users must authenticate again.

### Persistent browser session

Controls whether a browser session remains signed in after the browser is closed and reopened.

### Important distinction

Session controls do not simply determine:

> "Can this user sign in?"

They can determine:

> **"How long and under what conditions can the session continue?"**

Microsoft documents sign-in frequency and persistent browser sessions as Conditional Access session controls.

### How they connect:

**Authentication → session → session controls → continued access**

---

# 11. Continuous Access Evaluation

**Continuous Access Evaluation (CAE)** → Allows supported services to respond to important identity or policy changes during an active session instead of waiting for a normal token lifetime to expire.

### Important events

Examples include:

- User account disabled/deleted
- Password changed/reset
- MFA enabled
- Administrator revokes refresh tokens
- Elevated user risk detected

Supported services can react to these events and require access to be re-evaluated.

### Why CAE matters

Traditional model:

```text
Token issued
    ↓
Token remains valid
    ↓
Token expires
    ↓
Authentication happens again
```

CAE model:

```text
Token issued
    ↓
Critical event occurs
    ↓
Resource evaluates event
    ↓
Access can be revoked/re-evaluated
```

### Example

A user's account is disabled while they have an active Microsoft 365 session.

CAE can allow supported services to react to the account change rather than waiting for the existing token to naturally expire.

### How they connect:

**Identity event → near-real-time evaluation → session/access change**

---

# 12. Authentication Session Controls

**Authentication session controls** → Conditional Access settings that manage how frequently users must authenticate and how browser sessions persist.

### Sign-in frequency

Controls when users must authenticate again.

Can require:
- Periodic reauthentication
- Reauthentication every time

### Persistent browser session

Controls whether users remain signed in after closing and reopening their browser.

### Administrator caution

Overly aggressive reauthentication can:
- Hurt productivity.
- Increase user frustration.
- Increase MFA fatigue risk.

Microsoft specifically recommends testing session policies before production deployment.

### How they connect:

**Conditional Access → session control → authentication frequency / browser persistence**

---

# 13. Test and Troubleshoot Conditional Access

**Conditional Access troubleshooting** → Determine why a policy did or did not apply to a sign-in.

### Primary tool

**Microsoft Entra sign-in logs**

Review:
- User
- Application
- Result
- Conditional Access policies
- Authentication details
- Device information
- Location
- Failure reason

### Troubleshooting sequence

**1. User**

Who is signing in?

↓

**2. Application**

What resource is being accessed?

↓

**3. Conditions**

What conditions were present?

- Location
- Device
- Client
- Risk
- Other conditions

↓

**4. Policy**

Which Conditional Access policies applied?

Which policies did not apply?

↓

**5. Grant controls**

What requirement was imposed?

- MFA?
- Authentication strength?
- Compliant device?
- Block?

↓

**6. Session controls**

Was the problem related to:
- Sign-in frequency?
- Persistent session?
- CAE?
- Other session control?

↓

**7. Sign-in logs**

What does the authentication and Conditional Access evaluation show?

↓

**8. Verify**

Test again and confirm the expected policy behavior.

### Troubleshooting pattern

**User → Application → Conditions → Policy → Grant Controls → Session Controls → Sign-In Logs → Verify**

### How they connect:

Conditional Access troubleshooting should follow the actual policy evaluation path rather than changing policies randomly.

---

# 14. Conditional Access Optimization Agent

**Microsoft Entra Conditional Access Optimization agent** → A Microsoft capability designed to help analyze and improve Conditional Access policy configurations.

The current Microsoft Learn module includes a dedicated **10-minute Conditional Access Optimization agent** unit.

### Administrator purpose

The optimization capability is intended to help administrators evaluate Conditional Access configuration and identify opportunities to improve policy design.

### Important

Treat optimization as an **administrator decision-support capability**, not as a replacement for understanding Conditional Access.

An IAM administrator still needs to understand:

- Who is targeted.
- What is protected.
- Which conditions apply.
- Which controls are enforced.
- What exceptions exist.
- Whether the resulting policy matches business requirements.

### How they connect:

**Existing Conditional Access configuration → analysis/optimization → administrator review → policy improvement**

---

# 15. Conditional Access and Agent Identities

The current Microsoft Learn module specifically includes protection of **AI agent identities managed through Microsoft Entra Agent ID**.

### Core concept

Conditional Access can be used as part of the security strategy for identities beyond traditional human users.

### Administrator mindset

Identity security is expanding beyond:

**Human users**

to include:

**Workload identities and agent identities**

The same fundamental principle applies:

> **Identity + conditions + policy + controls = access decision**

### How they connect:

**Agent identity → Conditional Access evaluation → required controls → protected resource**

---

# 16. Conditional Access Comparison

| Component | Primary purpose |
|---|---|
| Security Defaults | Baseline identity protection |
| Conditional Access Policy | Granular access decision |
| Assignment | Determines who/resource is targeted |
| Conditions | Determines when policy applies |
| Grant Controls | Determines what requirement must be satisfied |
| Authentication Controls | Controls authentication requirements |
| Application Controls | Controls application/session behavior |
| Session Controls | Controls continued session behavior |
| CAE | Responds to important events during active sessions |
| Sign-In Logs | Shows authentication and policy evaluation |
| Optimization Agent | Helps evaluate/improve Conditional Access configuration |

### How they connect:

**Assignments + Conditions → determine scope**

**Grant/Authentication Controls → enforce requirements**

**Application/Session Controls → manage ongoing access**

**CAE → enables responsive access evaluation**

**Sign-In Logs → provide troubleshooting visibility**

**Optimization → helps improve policy design**

---

# 17. SC-300 Scenario Thinking

### Scenario 1 — Require MFA for users outside the corporate network

Think:

**Conditional Access**

Target:
- Users/groups

Condition:
- Location

Control:
- Require MFA

---

### Scenario 2 — Require stronger authentication for administrators

Think:

**Conditional Access + Authentication Strength**

Require an appropriate strong authentication method.

---

### Scenario 3 — Block access from a specific location

Think:

**Conditional Access → Location condition → Block grant control**

---

### Scenario 4 — User says they were denied access even though their password was correct

Do not assume the password is the problem.

Think:

**Sign-in logs → Conditional Access → policy evaluation → conditions → controls**

---

### Scenario 5 — Policy was created but isn't affecting the intended users

Think:

**Assignment → exclusions → application scope → conditions**

The most likely problem may be policy scope.

---

### Scenario 6 — User is repeatedly asked to authenticate

Think:

**Session management → Sign-in frequency → Conditional Access policies**

---

### Scenario 7 — User's access should be revoked rapidly after a critical identity event

Think:

**Continuous Access Evaluation**

---

### Scenario 8 — Organization wants to maintain a persistent browser session

Think:

**Conditional Access → Session → Persistent browser session**

---

### Scenario 9 — Organization wants users to reauthenticate every defined period

Think:

**Conditional Access → Session → Sign-in frequency**

---

### Scenario 10 — Conditional Access policy behaves differently than expected

Think:

**User → Application → Conditions → Policy → Grant Controls → Session Controls → Sign-In Logs**

---

# 18. Interview Scenarios

### Interview Question 1

**"What is Conditional Access?"**

Strong answer:

Conditional Access is Microsoft's policy-based access control system. It evaluates signals such as the user, application, device, location, and risk, then applies controls such as MFA, authentication strength, compliant-device requirements, or blocking access.

---

### Interview Question 2

**"What's the difference between conditions and controls?"**

Strong answer:

Conditions determine when a Conditional Access policy applies. Controls determine what must happen when the policy applies, such as requiring MFA, requiring a compliant device, or blocking access.

---

### Interview Question 3

**"A user is being blocked by Conditional Access. How do you troubleshoot it?"**

Strong answer:

I'd start with the sign-in logs, identify the user and application, determine which policies applied, review the conditions that matched, examine the grant controls, check session controls if relevant, and then verify the result with another controlled sign-in.

---

### Interview Question 4

**"What's the difference between Security Defaults and Conditional Access?"**

Strong answer:

Security Defaults provide baseline security with minimal configuration, while Conditional Access provides granular control over users, applications, conditions, authentication requirements, and access decisions.

---

### Interview Question 5

**"What is Continuous Access Evaluation?"**

Strong answer:

CAE allows supported services to respond to important identity or policy events during an active session instead of waiting for the normal token lifetime to expire. This can allow access to be revoked or re-evaluated much faster.

---

### Interview Question 6

**"What is sign-in frequency?"**

Strong answer:

Sign-in frequency is a Conditional Access session control that determines how long a user can access a resource before being required to authenticate again.

---

### Interview Question 7

**"How would you safely deploy a new Conditional Access policy?"**

Strong answer:

I'd define the business requirement, identify the users and applications, configure the conditions and controls, exclude appropriate emergency or test accounts where required, test the policy in a controlled scope, review sign-in results, and only then expand deployment.

---

# 19. SC-300 Knowledge Checklist

You should be able to explain:

- [ ] Conditional Access
- [ ] Security Defaults
- [ ] Conditional Access planning
- [ ] Policy assignments
- [ ] Policy conditions
- [ ] Grant controls
- [ ] Authentication controls
- [ ] Application controls
- [ ] Session controls
- [ ] Sign-in frequency
- [ ] Persistent browser sessions
- [ ] Continuous Access Evaluation
- [ ] Authentication session controls
- [ ] Conditional Access troubleshooting
- [ ] Sign-in logs
- [ ] Conditional Access Optimization agent
- [ ] Conditional Access for agent identities
- [ ] Authentication vs authorization

---

# 20. Interview / Real-World Skill Checklist

You should be able to:

- Design Conditional Access policies from business requirements.
- Determine policy scope.
- Select appropriate conditions.
- Select appropriate grant controls.
- Configure authentication requirements.
- Configure session controls.
- Explain Security Defaults.
- Test policies safely.
- Troubleshoot failed sign-ins.
- Read Conditional Access results in sign-in logs.
- Explain why a policy did or did not apply.
- Understand Continuous Access Evaluation.
- Explain authentication session controls.
- Evaluate Conditional Access policy design.
- Understand how Conditional Access can protect non-human identities and agent identities.
- Use optimization capabilities as decision support rather than blindly accepting recommendations.

---

# 21. Real-World Administrator Mindset

A Conditional Access administrator should not think:

> "Create a policy and turn it on."

Instead:

> **"What security decision am I trying to enforce, who should it affect, and what happens if the policy evaluates differently than expected?"**

Use:

**Business Requirement → Assignment → Conditions → Controls → Test → Sign-In Logs → Verify → Deploy**

### Critical administrator principles

**1. Scope before enforcement**

Know exactly who and what the policy affects.

**2. Test before production**

A Conditional Access policy can lock out users or administrators if poorly designed.

**3. Understand exclusions**

Emergency access and controlled test accounts can be critical to safe policy deployment.

**4. Read the sign-in logs**

Do not guess why a policy applied.

**5. Separate authentication from authorization**

A successful sign-in does not automatically mean access should be granted.

**6. Treat session management separately**

A user being allowed to sign in does not mean their session should remain valid indefinitely.

---

# Day 3 Master Mental Model

```text
                  SIGN-IN
                     │
                     ▼
             WHO IS THE USER?
                     │
                     ▼
             WHAT ARE THEY
              ACCESSING?
                     │
                     ▼
               CONDITIONS
        ┌────────────┼────────────┐
        ▼            ▼            ▼
      Device      Location       Risk
        │            │            │
        └────────────┼────────────┘
                     ▼
             CONDITIONAL ACCESS
                  POLICY
                     │
          ┌──────────┼──────────┐
          ▼          ▼          ▼
       Grant      Auth       Session
       Controls   Controls   Controls
          │          │          │
          └──────────┼──────────┘
                     ▼
              ACCESS DECISION
               │           │
             ALLOW        BLOCK
               │
               ▼
             SESSION
               │
        ┌──────┴───────┐
        ▼              ▼
   Session Rules      CAE
        │              │
        └──────┬───────┘
               ▼
         CONTINUED ACCESS
```

### Core rule

**Assignments determine who/what the policy targets.**

**Conditions determine when the policy applies.**

**Controls determine what the user must satisfy.**

**Session controls determine how access continues.**

**CAE allows supported services to respond to important events during active sessions.**

**Sign-in logs tell the administrator what actually happened.**

**Optimization helps improve policy design, but the administrator remains responsible for the final access decision.**
