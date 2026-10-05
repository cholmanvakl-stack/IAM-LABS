# Week 2 — Day 4: Manage Microsoft Entra Identity Protection

## Learning Module

### Microsoft Learn Alignment

**Microsoft Learn path:** Implement an authentication and access management solution

**Microsoft Learn module:** Manage Microsoft Entra Identity Protection

**Module length:** 55 minutes / 11 units

**Day 4 focus:**
- Identity Protection fundamentals
- User risk
- User risk policies
- Sign-in risk
- Sign-in risk policies
- MFA registration policy
- Risky users
- Investigate and remediate risk
- Workload identity protection
- Microsoft Defender for Identity
- Identity Risk Management Agent

Microsoft Learn's stated objectives are to implement and manage user-risk policies, sign-in-risk policies, MFA registration policy, and monitor/investigate/remediate elevated-risk users.

---

# Goal 1 — SC-300 Exam Preparation

## 1. Microsoft Entra Identity Protection

**Microsoft Entra ID Protection** → Uses identity and sign-in risk signals to detect potentially compromised identities and help administrators respond.

### Core capabilities

- Detect risky sign-ins.
- Detect risky users.
- Assign risk levels.
- Investigate risk detections.
- Remediate risky identities.
- Integrate risk with Conditional Access.

### Risk-based security

Identity Protection answers:

> **"How risky is this identity or sign-in?"**

Conditional Access answers:

> **"What should we do when that risk is detected?"**

### How they connect:

**Identity Protection → detects/evaluates risk**

**Conditional Access → applies access controls based on risk**

---

# 2. User Risk

**User risk** → The probability that a user's identity has been compromised.

### User risk considers

Signals associated with the user's identity, such as:
- Leaked credentials
- Suspicious user activity
- Anomalous behavior
- Other identity risk detections

### Risk levels

Common risk levels include:

- Low
- Medium
- High

### Example

```text
Compromised credentials detected
          ↓
User risk increases
          ↓
Conditional Access evaluates risk
          ↓
Require remediation / block
```

### Exam distinction

**User risk**

→ "Is this user's identity potentially compromised?"

**Sign-in risk**

→ "Is this particular sign-in potentially compromised?"

### How they connect:

**User risk describes the identity's overall compromise risk.**

---

# 3. Sign-In Risk

**Sign-in risk** → The probability that a specific authentication attempt was not performed by the legitimate user.

### Examples of risk signals

- Unfamiliar sign-in properties
- Anonymous IP address
- Malicious IP address
- Atypical travel
- Password spray
- Suspicious authentication activity

Microsoft Entra ID Protection provides multiple sign-in risk detections, including anonymous IP, malicious IP, password spray, unfamiliar sign-in properties, and other threat signals.

### Example

```text
User normally signs in from Chicago
          ↓
Sign-in suddenly occurs from
an unfamiliar/high-risk location
          ↓
Sign-in risk increases
          ↓
Conditional Access evaluates risk
```

### Exam distinction

**Sign-in risk = this authentication attempt**

**User risk = this identity**

### How they connect:

**Sign-in event → risk detection → sign-in risk → access decision**

---

# 4. User Risk vs Sign-In Risk

| | User Risk | Sign-In Risk |
|---|---|---|
| Measures | Identity compromise | Specific authentication attempt |
| Scope | User | Sign-in |
| Example | Leaked credentials | Suspicious sign-in |
| Question | "Is the user compromised?" | "Is this sign-in suspicious?" |
| Response | Remediate user | Challenge/block sign-in |

### How they connect:

Both provide risk signals that can be used by Conditional Access to make access decisions.

---

# 5. Risk-Based Conditional Access

**Risk-based Conditional Access** → Uses user-risk or sign-in-risk conditions to dynamically enforce access requirements.

### Example

```text
User attempts sign-in
        ↓
Identity Protection detects risk
        ↓
Risk level evaluated
        ↓
Conditional Access policy
        ↓
Require MFA / remediate / block
```

### Common responses

Depending on the scenario and policy:

- Require MFA
- Require secure password change
- Block access

Microsoft recommends using Conditional Access risk conditions for modern risk-based access policies.

### Important 2026 change

The legacy Identity Protection user-risk and sign-in-risk policies are retiring.

Microsoft states that these legacy policies are scheduled to retire on **October 1, 2026** and recommends migrating risk enforcement to Conditional Access.

### Exam mindset

You still need to understand:

**User risk policy**

and

**Sign-in risk policy**

because they remain important concepts.

But for current administration, think:

**Identity Protection risk → Conditional Access risk condition → access control**

### How they connect:

**Risk detection → risk level → Conditional Access → remediation/access decision**

---

# 6. MFA Registration Policy

**MFA registration policy** → Requires users to register authentication methods needed for multifactor authentication.

### Purpose

Ensures users have an authentication method available before MFA is required.

### Example

```text
New user
   ↓
MFA registration required
   ↓
User registers Authenticator
   ↓
Authentication method available
   ↓
MFA can be enforced
```

### Administrator considerations

Determine:
- Who must register.
- Which methods are available.
- Registration requirements.
- How registration interacts with Conditional Access.

### Important

MFA registration is about:

**Getting the authentication method registered.**

MFA enforcement is about:

**Requiring the method during authentication.**

### How they connect:

**Registration → available method → MFA enforcement**

---

# 7. Risky Users

**Risky user** → A user whose identity has been associated with one or more risk detections.

### Administrator actions

Review:
- Risk level
- Risk detection
- Detection time
- Sign-in information
- Location
- IP address
- Application
- Device
- User activity

### Possible outcomes

- Confirm compromised
- Confirm safe
- Dismiss risk
- Remediate the user

### Important

Do not automatically assume:

**Risk detected = confirmed compromise**

Risk is an indicator that requires investigation.

### How they connect:

**Risk detection → risky user → investigation → remediation**

---

# 8. Investigate Risk

**Risk investigation** → Determine whether a risk detection represents legitimate activity, a false positive, or a compromised identity.

### Investigation information

Review:
- User
- Timestamp
- Application
- Device
- Location
- IP address
- User agent
- Risk detection
- Risk level
- Related sign-ins

Microsoft's current investigation guidance specifically recommends examining the device, location, IP address, user agent, timestamps, and application during investigation.

### Investigation sequence

**1. Identify**

Who is affected?

↓

**2. Review detection**

What caused the risk?

↓

**3. Review sign-in**

Where and when did it occur?

↓

**4. Review context**

- Device
- Location
- IP
- Application
- User agent

↓

**5. Validate**

Does the user recognize the activity?

↓

**6. Determine**

- Confirmed compromised
- Confirmed safe
- False positive / dismiss

### How they connect:

**Detection → evidence → investigation → determination**

---

# 9. Risk Remediation

**Risk remediation** → Actions taken to remove or reduce the security risk associated with an identity.

### Possible remediation

Depending on the situation:

- MFA
- Secure password change
- Password reset
- Revoke sessions/tokens where appropriate
- Confirm user compromised
- Block access
- Remove the underlying cause

### Example

```text
Leaked credentials
       ↓
User risk = High
       ↓
Secure remediation
       ↓
Password changed
       ↓
Risk reassessed
```

### Important

Remediation should address the **cause of the risk**, not merely hide the alert.

### How they connect:

**Risk → investigation → containment → remediation → verification**

---

# 10. Workload Identity Protection

**Workload identity protection** → Protects non-human identities such as applications and service principals.

### Workload identities include

- Applications
- Service principals
- Other non-human identities

### Why they matter

A compromised workload identity can potentially access:
- APIs
- Data
- Applications
- Azure resources

### Administrator mindset

Identity security is not limited to human users.

Think:

**Human identity + workload identity**

### How they connect:

**Workload identity → authentication → permissions → resource access**

---

# 11. Microsoft Defender for Identity

**Microsoft Defender for Identity** → Identity threat detection and security capability focused on on-premises Active Directory and hybrid identity environments.

### Core purpose

Helps identify:
- Suspicious identity activity
- Credential-based attacks
- Active Directory threats
- Identity-related attack behavior

### Hybrid identity connection

```text
On-premises Active Directory
          ↓
Microsoft Defender for Identity
          ↓
Identity threat detection
          ↓
Security investigation
```

Microsoft describes Defender for Identity as part of the broader identity protection ecosystem and recommends integrating Microsoft Defender security signals with Entra ID Protection.

### Important distinction

**Microsoft Entra ID Protection**

→ Focuses on cloud identity/sign-in risk.

**Microsoft Defender for Identity**

→ Focuses heavily on on-premises Active Directory and hybrid identity threats.

### How they connect:

**Defender for Identity → on-prem/hybrid identity threat signals → broader identity protection**

---

# 12. Identity Risk Management Agent

**Identity Risk Management Agent** → Microsoft capability designed to assist with identity-risk management workflows.

The current Microsoft Learn module contains a dedicated unit on the **Identity Risk Management Agent**.

### Administrator mindset

Treat agent capabilities as:

**Decision support**

rather than:

**Automatic replacement for investigation.**

The administrator still needs to understand:
- What caused the risk.
- What evidence supports it.
- What remediation is appropriate.
- Whether the action is safe.

### How they connect:

**Risk data → agent assistance → administrator investigation/decision → remediation**

---

# 13. Identity Protection Comparison

| Component | Primary purpose |
|---|---|
| Identity Protection | Detect and evaluate identity/sign-in risk |
| User Risk | Measures potential compromise of an identity |
| Sign-In Risk | Measures risk of a specific authentication attempt |
| Risk-Based Conditional Access | Applies controls based on risk |
| MFA Registration | Gets users registered for authentication methods |
| Risky Users | Identifies users associated with risk detections |
| Risk Investigation | Determines what happened and whether risk is legitimate |
| Risk Remediation | Reduces or removes the identified risk |
| Workload Identity Protection | Protects non-human identities |
| Defender for Identity | Detects identity threats in AD/hybrid environments |
| Identity Risk Management Agent | Assists identity-risk management |

### How they connect:

**Detection → Risk → Investigation → Decision → Remediation → Verification**

---

# 14. SC-300 Scenario Thinking

### Scenario 1 — User's credentials appear in a breach

Think:

**User risk**

Then:

**Investigate → remediate → verify**

---

### Scenario 2 — User signs in from a suspicious IP

Think:

**Sign-in risk**

Then:

**Conditional Access → require MFA or block according to policy**

---

### Scenario 3 — User is marked high risk

Do not immediately assume compromise.

Think:

**Risk detection → investigation → evidence → remediation**

---

### Scenario 4 — Organization wants risky sign-ins to require MFA

Think:

**Sign-in risk condition + Conditional Access + MFA**

---

### Scenario 5 — Organization wants highly risky users to remediate their credentials

Think:

**User risk + Conditional Access + secure password change**

---

### Scenario 6 — New employees need MFA registration

Think:

**MFA registration policy**

Then ensure the required authentication method is available.

---

### Scenario 7 — An on-premises Active Directory account appears compromised

Think:

**Microsoft Defender for Identity**

Then investigate the broader hybrid identity environment.

---

### Scenario 8 — An application/service principal behaves suspiciously

Think:

**Workload identity protection**

Investigate the non-human identity rather than assuming a human user is responsible.

---

### Scenario 9 — A risky user says the sign-in was legitimate

Do not simply dismiss the alert.

Think:

**Evidence → device → location → IP → application → timestamp → user confirmation → determination**

---

### Scenario 10 — You are building risk policies in October 2026

Think:

**Conditional Access risk conditions**

rather than building new legacy Identity Protection risk policies, because Microsoft is retiring the legacy policies on October 1, 2026.

---

# 15. Identity Protection Troubleshooting

**Identity Protection troubleshooting** → Determine why an identity or sign-in was classified as risky and what action should be taken.

### Troubleshooting sequence

**1. User**

Who is affected?

↓

**2. Risk type**

Is it:

- User risk?
- Sign-in risk?
- Workload identity risk?

↓

**3. Detection**

What generated the risk?

↓

**4. Evidence**

Review:

- Timestamp
- Application
- Device
- Location
- IP
- User agent
- Sign-in details

↓

**5. Policy**

Which Conditional Access policy responded?

↓

**6. Authentication**

Was MFA completed?

Was another authentication requirement satisfied?

↓

**7. Remediation**

Choose appropriate action:

- MFA
- Password reset
- Secure password change
- Block
- Revoke sessions where appropriate
- Confirm safe/compromised

↓

**8. Verify**

Confirm:

- Risk state changed.
- Access is appropriately controlled.
- Underlying issue is addressed.

### Troubleshooting pattern

**User → Risk Type → Detection → Evidence → Policy → Authentication → Remediation → Verify**

### How they connect:

Identity Protection troubleshooting should follow the evidence from **risk detection to final remediation**, rather than simply clearing the alert.

---

# 16. Interview Scenarios

### Interview Question 1

**"What's the difference between user risk and sign-in risk?"**

Strong answer:

User risk represents the likelihood that a user's identity has been compromised. Sign-in risk represents the likelihood that a specific authentication attempt wasn't legitimate.

---

### Interview Question 2

**"A user is marked as high risk. What do you do?"**

Strong answer:

I would investigate the risk detection first. I'd review the timestamp, application, device, location, IP address, user agent, and related sign-in information. Then I'd determine whether the activity is legitimate or indicates compromise and take the appropriate remediation action.

---

### Interview Question 3

**"How does Identity Protection work with Conditional Access?"**

Strong answer:

Identity Protection provides risk signals and risk levels. Conditional Access can use those risk conditions to enforce controls such as MFA, secure password change, or blocking access.

---

### Interview Question 4

**"What's the difference between Identity Protection and Defender for Identity?"**

Strong answer:

Microsoft Entra ID Protection focuses on cloud identity and sign-in risk, while Defender for Identity focuses on detecting identity threats in on-premises Active Directory and hybrid environments.

---

### Interview Question 5

**"What would you do if a user says a risky sign-in was theirs?"**

Strong answer:

I wouldn't automatically dismiss the risk. I'd validate the timestamp, application, device, location, IP address, and other sign-in context, then determine whether the activity is consistent with the user's expected behavior before closing or remediating the risk.

---

### Interview Question 6

**"How would you protect a compromised workload identity?"**

Strong answer:

I'd identify the workload identity, investigate its authentication and resource access, determine what permissions it has, contain the identity if necessary, rotate or revoke affected credentials where appropriate, and verify that unauthorized access has stopped.

---

# 17. SC-300 Knowledge Checklist

You should be able to explain:

- [ ] Microsoft Entra ID Protection
- [ ] Identity risk
- [ ] User risk
- [ ] Sign-in risk
- [ ] Risk detections
- [ ] Risk levels
- [ ] Risk-based Conditional Access
- [ ] MFA registration policy
- [ ] Risky users
- [ ] Risk investigation
- [ ] Risk remediation
- [ ] Workload identity protection
- [ ] Microsoft Defender for Identity
- [ ] Identity Risk Management Agent
- [ ] User risk vs sign-in risk
- [ ] Identity Protection vs Defender for Identity
- [ ] Identity Protection + Conditional Access
- [ ] Legacy risk policies vs modern Conditional Access risk conditions

---

# 18. Interview / Real-World Skill Checklist

You should be able to:

- Investigate risky users.
- Investigate risky sign-ins.
- Identify the source of a risk detection.
- Interpret risk levels.
- Review sign-in evidence.
- Determine whether a risk is legitimate.
- Remediate compromised identities.
- Use Conditional Access to respond to identity risk.
- Explain user risk vs sign-in risk.
- Protect workload identities.
- Explain Defender for Identity's role in hybrid environments.
- Explain the relationship between Entra ID Protection and Defender for Identity.
- Troubleshoot identity risk systematically.
- Explain current risk-policy architecture and the migration away from legacy risk policies.

---

# 19. Real-World Administrator Mindset

An IAM administrator should not think:

> "The portal says risky, so I'll just dismiss it."

Instead:

> **"What generated the risk, what evidence supports it, and what is the safest remediation?"**

Use:

**Detection → Risk → Evidence → Policy → Investigation → Remediation → Verify**

### Critical administrator principles

**1. Risk is a signal, not automatically proof of compromise.**

Investigate before making assumptions.

**2. User risk and sign-in risk are different.**

Know which one you're investigating.

**3. Risk should drive access decisions.**

Use Conditional Access to respond to risk.

**4. Investigate before dismissing.**

A false positive and a compromised identity require very different actions.

**5. Protect non-human identities.**

Applications and service principals can become attack paths.

**6. Think across the identity environment.**

Cloud identity risk and on-premises AD identity threats can be connected.

**7. Know the current architecture.**

Legacy Identity Protection risk policies are being retired; modern risk enforcement uses Conditional Access.

---

# Day 4 Master Mental Model

```text
                    IDENTITY
                       │
          ┌────────────┴────────────┐
          ▼                         ▼
      USER RISK                SIGN-IN RISK
          │                         │
          └────────────┬────────────┘
                       ▼
                RISK DETECTION
                       │
                       ▼
              RISK LEVEL / SIGNAL
                       │
                       ▼
             CONDITIONAL ACCESS
                       │
          ┌────────────┼────────────┐
          ▼            ▼            ▼
         MFA       Password      BLOCK
                    Change
                       │
                       ▼
                 INVESTIGATION
                       │
          ┌────────────┴────────────┐
          ▼                         ▼
       SAFE                    COMPROMISED
          │                         │
          ▼                         ▼
      DISMISS                  REMEDIATE
                                    │
                                    ▼
                                 VERIFY

      WORKLOAD IDENTITIES
              │
              ▼
      Identity Risk Protection
              │
              ▼
       Investigation / Response

      ON-PREMISES AD / HYBRID
              │
              ▼
    Microsoft Defender for Identity
              │
              ▼
      Identity Threat Signals
```

### Core rule

**Identity Protection detects and evaluates risk.**

**User risk describes potential compromise of the identity.**

**Sign-in risk describes potential compromise of a specific authentication attempt.**

**Conditional Access responds to risk.**

**Investigation determines what actually happened.**

**Remediation addresses the risk.**

**Defender for Identity extends identity threat visibility into on-premises/hybrid Active Directory.**

**Workload identity protection extends the model beyond human users.**
