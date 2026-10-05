# Week 2 — Day 1: Secure Microsoft Entra Users with Multifactor Authentication

## Learning Module

### Microsoft Learn Alignment

**Microsoft Learn path:** Implement an authentication and access management solution

**Microsoft Learn module:** Secure Microsoft Entra users with multifactor authentication

**Week 2 — Day 1 focus:**  
**Multifactor Authentication (MFA)**

The Microsoft Learn path focuses on implementing and managing authentication and access controls with Microsoft Entra ID and is aligned to the SC-300 exam.

---

# Goal 1 — SC-300 Exam Preparation

## 1. Multifactor Authentication

**Multifactor Authentication (MFA)** → Requires users to provide additional verification beyond their primary credential.

### Authentication factors

**Something you know**
- Password
- PIN

**Something you have**
- Phone
- Authenticator app
- Security key

**Something you are**
- Fingerprint
- Facial recognition

### Core concept

MFA strengthens authentication by requiring more than one type of verification.

### Exam distinction

A password alone is **single-factor authentication**.

Password + another verification factor is **multifactor authentication**.

### How they connect:

**Primary credential → additional verification → stronger authentication**

---

# 2. Microsoft Entra MFA

**Microsoft Entra MFA** → Microsoft Entra authentication capability that requires additional verification when configured conditions require it.

MFA can help protect accounts even when a password is compromised.

### Common verification methods

- Microsoft Authenticator
- FIDO2 security keys
- OATH tokens
- Other supported authentication methods

### Important

MFA is an **authentication control**.

It does not automatically determine which resources a user is authorized to access.

### How they connect:

**MFA → verifies identity**

**Authorization → determines access**

---

# 3. Authentication Methods

**Authentication method** → A mechanism used to verify a user's identity.

Examples include:
- Password
- Microsoft Authenticator
- FIDO2 security key
- OATH token
- Windows Hello for Business

### Administrator responsibility

An IAM administrator must determine:
- Which methods are available.
- Which methods users can register.
- Which methods provide stronger authentication.
- Which users are allowed to use each method.

### Exam concept

Do not treat every authentication method as equivalent.

Some methods provide stronger phishing resistance than others.

### How they connect:

**Authentication methods → provide the mechanisms used by MFA and passwordless authentication.**

---

# 4. Microsoft Authenticator

**Microsoft Authenticator** → Authentication app that can provide additional verification for users.

It can support:
- Push notifications
- Number matching
- Passwordless authentication

### Administrator considerations

Evaluate:
- Registration
- Availability
- User adoption
- Authentication policy
- Security requirements

### How they connect:

**Authenticator → authentication method → identity verification**

---

# 5. FIDO2 Security Keys

**FIDO2 security key** → Hardware-based authentication method designed for strong, phishing-resistant authentication.

### Key characteristics

- Passwordless capable
- Strong phishing resistance
- Uses public-key cryptography
- Requires the physical security key

### Administrator use

FIDO2 can be appropriate for:
- High-risk users
- Administrators
- Organizations requiring phishing-resistant authentication

### Exam distinction

When a scenario emphasizes **phishing-resistant passwordless authentication**, think:

**FIDO2**

### How they connect:

**FIDO2 security key → passwordless authentication → phishing-resistant sign-in**

---

# 6. OATH Tokens

**OATH token** → Authentication mechanism that generates time-based or event-based one-time passcodes.

### Administrator considerations

OATH tokens can provide an additional authentication factor without relying on a phone-based authenticator.

### How they connect:

**OATH token → one-time passcode → additional authentication factor**

---

# 7. Passwordless Authentication

**Passwordless authentication** → Authentication that does not require the user to enter a traditional password.

Examples include:
- Microsoft Authenticator passwordless
- FIDO2 security keys
- Windows Hello for Business

### Benefits

- Reduces password dependency.
- Can improve security.
- Can provide phishing-resistant authentication depending on the method.

### Exam distinction

**MFA** and **passwordless authentication** are related but not identical.

MFA means multiple authentication factors.

Passwordless means the authentication process does not rely on a traditional password.

### How they connect:

**Passwordless methods can provide strong authentication without requiring a traditional password.**

---

# 8. Authentication Strength

**Authentication strength** → Defines the level/type of authentication required to satisfy an access requirement.

### Concept

Different resources may require different authentication strength.

For example:

**Standard application**
→ normal authentication

**Highly sensitive application**
→ stronger authentication requirement

### Administrator mindset

Do not simply ask:

> "Does the user have MFA?"

Ask:

> "Did the user authenticate using a method strong enough for this resource?"

### How they connect:

**Authentication method → authentication strength → access decision**

---

# 9. MFA Registration

**MFA registration** → Process through which users register authentication methods that can later be used to verify their identity.

### Administrator considerations

Verify:
- Users can register.
- Required methods are available.
- Registration requirements match organizational policy.
- Users have appropriate authentication methods registered.

### How they connect:

**Registration → available authentication method → authentication**

---

# 10. MFA and Conditional Access

**Conditional Access** → Policy-based access control that can require MFA based on conditions.

Conditional Access can evaluate factors such as:
- User
- Group
- Application
- Device
- Location
- Risk
- Authentication context

### Example

```text
User attempts access
        ↓
Conditional Access evaluates request
        ↓
MFA required
        ↓
User completes MFA
        ↓
Access decision
```

### Important distinction

MFA is the **authentication requirement**.

Conditional Access is one mechanism that can **enforce the requirement based on conditions**.

### How they connect:

**Conditional Access → determines when MFA is required**

**MFA → provides additional verification**

---

# 11. Authentication vs Authorization

**Authentication** → Determines who the user is.

**Authorization** → Determines what the user can access.

### Example

A user successfully completes MFA.

That proves:

**Authentication succeeded.**

It does not automatically mean:

**The user is authorized to access the application.**

### Exam trap

Do not confuse:

**"Can the user prove their identity?"**

with:

**"Is the user allowed to access this resource?"**

### How they connect:

**Authentication → identity**

**Authorization → access**

---

# Goal 2 — Real-World IAM Administrator / Interview Preparation

# 12. MFA Administrator Responsibilities

An IAM administrator should be able to:

- Configure authentication methods.
- Manage MFA requirements.
- Understand authentication strength.
- Assist users with registration.
- Investigate MFA failures.
- Determine whether MFA is actually being enforced.
- Evaluate authentication security.
- Reduce reliance on passwords.
- Recommend stronger authentication methods.
- Troubleshoot authentication problems without immediately weakening security controls.

### Administrator mindset

Never solve an authentication problem by simply disabling MFA without understanding the cause.

Determine:

**What failed?**

**Who is affected?**

**Which authentication method was being used?**

**Which policy required MFA?**

**Was the user registered correctly?**

---

# 13. MFA Troubleshooting

**MFA troubleshooting** → Identify where the authentication process failed.

Use a structured troubleshooting process.

### 1. User

Verify:
- Correct user account.
- Account enabled.
- Correct sign-in identity.

↓

### 2. Registration

Verify:
- User has registered authentication methods.
- Required method is available.
- Registration is complete.

↓

### 3. Authentication Method

Determine:
- Which method is being used?
- Microsoft Authenticator?
- FIDO2?
- OATH?
- Other supported method?

↓

### 4. Policy

Check:
- Is MFA required?
- Which policy requires it?
- Is the user in the policy scope?
- Is another policy affecting the result?

↓

### 5. Authentication Strength

Verify:
- Does the authentication method satisfy the required authentication strength?
- Is a stronger method required?

↓

### 6. Sign-In Result

Review:
- Sign-in result.
- MFA requirement.
- Authentication details.
- Failure reason.

↓

### 7. Verify

Confirm:
- User can authenticate successfully.
- Required MFA method works.
- Required authentication strength is satisfied.
- Access is granted only when the appropriate conditions are met.

### Troubleshooting pattern

**User → Registration → Method → Policy → Authentication Strength → Sign-In Result → Verify**

### How they connect:

Troubleshooting should identify the failing layer instead of randomly changing authentication settings.

---

# 14. Real-World Scenario Thinking

### Scenario 1 — User cannot complete MFA

Think:

**User → Registration → Authentication Method → Policy → Sign-In Result**

Do not immediately disable MFA.

---

### Scenario 2 — User has MFA registered but access is denied

Think:

**Authentication succeeded → Authorization or Conditional Access decision**

MFA registration alone does not guarantee access.

---

### Scenario 3 — Administrator wants stronger protection for privileged accounts

Think:

**Stronger authentication method → phishing-resistant authentication → appropriate authentication strength**

Potential solution:

**FIDO2 security key**

---

### Scenario 4 — Users complain about repeated MFA prompts

Think:

**Authentication method → Conditional Access → session behavior → sign-in experience**

Investigate the configuration before changing security requirements.

---

### Scenario 5 — User says "I completed MFA but still can't access the application"

Think:

**Authentication ≠ authorization**

Investigate:
- Conditional Access
- Application assignment
- User/group access
- Authentication strength
- Other access policies

---

# 15. Interview Scenarios

### Interview Question 1

**"What is MFA?"**

Strong answer:

MFA requires users to provide additional verification beyond their primary credential. It strengthens authentication because compromising one factor isn't enough to complete authentication.

---

### Interview Question 2

**"What's the difference between authentication and authorization?"**

Strong answer:

Authentication verifies who the user is. Authorization determines what that authenticated identity is allowed to access.

---

### Interview Question 3

**"A user can't complete MFA. How would you troubleshoot it?"**

Strong answer:

I'd first verify the user account and authentication-method registration, then determine which authentication method they're using. I'd check the applicable policies and authentication-strength requirements, review the sign-in and authentication details, and then verify the result.

---

### Interview Question 4

**"A user has Microsoft Authenticator registered but still can't access an application. What would you check?"**

Strong answer:

I wouldn't assume MFA is the problem. I'd determine whether authentication succeeded and then investigate Conditional Access, authentication strength, application assignment, and authorization.

---

### Interview Question 5

**"What authentication method would you consider for highly privileged users who need phishing-resistant authentication?"**

Strong answer:

FIDO2 security keys are a strong option because they provide passwordless, phishing-resistant authentication.

---

# 16. SC-300 Knowledge Checklist

You should be able to explain:

- [ ] MFA
- [ ] Authentication factors
- [ ] Microsoft Entra authentication methods
- [ ] Microsoft Authenticator
- [ ] FIDO2
- [ ] OATH tokens
- [ ] Passwordless authentication
- [ ] Authentication strength
- [ ] Authentication-method registration
- [ ] MFA enforcement
- [ ] Conditional Access and MFA
- [ ] Authentication vs authorization
- [ ] MFA troubleshooting
- [ ] Phishing-resistant authentication

---

# 17. Interview / Real-World Skill Checklist

You should be able to:

- Configure and evaluate authentication methods.
- Explain MFA to a user or hiring manager.
- Determine why an MFA request is failing.
- Identify whether an issue is registration, policy, authentication, or authorization.
- Explain why FIDO2 provides strong authentication.
- Explain passwordless authentication.
- Understand authentication strength.
- Investigate sign-in results.
- Troubleshoot MFA without immediately weakening security.
- Explain the relationship between MFA and Conditional Access.
- Distinguish authentication from authorization.

---

# 18. Real-World Administrator Mindset

An IAM administrator should not think:

> "The user can't sign in, so I'll turn MFA off."

Instead:

> **"Which part of the authentication chain failed?"**

Use:

**User → Registration → Method → Policy → Authentication Strength → Sign-In Result → Access**

The objective is not simply to make the user sign in.

The objective is to restore **secure authentication while preserving the organization's access controls**.

---

# Day 1 Master Mental Model

```text
                 USER
                   │
                   ▼
          Authentication Method
                   │
          ┌────────┼────────┐
          ▼        ▼        ▼
     Authenticator FIDO2   OATH
          │        │        │
          └────────┼────────┘
                   ▼
              MFA / MFA
            Authentication
                   │
                   ▼
        Authentication Strength
                   │
                   ▼
        Conditional Access
                   │
                   ▼
            Authorization
                   │
                   ▼
             RESOURCE
```

### Core rule

**Authentication proves who the user is.**

**MFA strengthens authentication.**

**Authentication strength determines whether the method is strong enough.**

**Conditional Access determines when requirements apply.**

**Authorization determines what the authenticated user can access.**
