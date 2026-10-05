# Week 2 — Day 2: Manage User Authentication

## Learning Module

### Microsoft Learn Alignment

**Microsoft Learn path:** Implement an authentication and access management solution

**Microsoft Learn module:** Manage user authentication

**Module length:** 52 minutes / 12 units

**Day 2 focus:**
- FIDO2 / passwordless authentication
- Microsoft Authenticator
- OATH tokens
- Windows Hello for Business
- Self-service password reset (SSPR)
- Microsoft Entra password protection
- Smart lockout
- Kerberos authentication
- Certificate-based authentication
- Authentication for Azure virtual machines
- Tenant restrictions

**Primary goals:**

1. Prepare for the **SC-300 Identity and Access Administrator** exam.
2. Build practical **IAM administrator and interview skills**.

Microsoft Learn describes this module as implementing and managing authentication options according to business requirements.

---

# 1. FIDO2 / Passwordless Authentication

**FIDO2 authentication** → Uses public-key cryptography to provide strong, passwordless authentication.

### FIDO2

- Uses a security key or supported passkey technology.
- Designed to resist phishing.
- Private key remains protected by the authenticator.
- Microsoft Entra validates the corresponding public-key credential.

### Passwordless authentication

**Passwordless authentication** → Authentication that does not require a traditional password.

Examples:
- FIDO2 security keys
- Microsoft Authenticator passwordless
- Windows Hello for Business

### Exam distinction

**Passwordless** describes the authentication experience.

**FIDO2** is a specific authentication technology.

### How they connect:

**FIDO2 → passwordless authentication → phishing-resistant authentication**

---

# 2. Microsoft Authenticator

**Microsoft Authenticator** → Mobile authentication application used for MFA and passwordless authentication.

### Common uses

- MFA approval
- Number matching
- Passwordless phone sign-in

### Administrator responsibilities

- Enable/configure the method.
- Control who can use it.
- Assist with registration.
- Require re-registration when necessary.
- Investigate failed authentication.

### Important

An administrator can manage a user's authentication methods separately from their normal profile information. Authentication methods are specifically used for authentication.

### How they connect:

**Authenticator → authentication method → identity verification**

---

# 3. OATH Tokens

**OATH token** → Generates a one-time passcode that can be used as an authentication factor.

### Common use

Provides an alternative authentication method when users cannot or should not rely on a mobile authenticator.

### Administrator considerations

- Token registration
- Token assignment
- Authentication policy
- User access
- Token lifecycle

### How they connect:

**OATH token → one-time passcode → authentication factor**

---

# 4. Windows Hello for Business

**Windows Hello for Business (WHfB)** → Passwordless authentication using a device-bound credential, typically protected by a PIN or biometric gesture.

### Core concept

The user's credential is associated with the device rather than relying on the user's traditional password for authentication.

### Authentication

Common unlock methods:
- PIN
- Fingerprint
- Facial recognition

### Security concept

Windows Hello for Business uses asymmetric cryptography.

The private key is protected on the user's device.

### Administrator considerations

- Deployment model
- Device registration/join state
- Policy
- PIN/biometric configuration
- Credential recovery

### Exam distinction

Do not confuse:

**Windows Hello for Business**
with
**Windows Hello consumer features**.

WHfB is the enterprise identity/authentication solution.

### How they connect:

**Device-bound credential → passwordless authentication → Microsoft Entra authentication**

---

# 5. Self-Service Password Reset

**Self-Service Password Reset (SSPR)** → Allows users to reset or change their passwords without requiring help desk intervention.

### Purpose

SSPR reduces:
- Help desk password-reset workload.
- User downtime.
- Dependency on administrators for routine password recovery.

### Administrator responsibilities

Configure:
- Who can use SSPR.
- Authentication requirements.
- Registration requirements.
- Notifications.
- Password reset behavior.

### Important distinction

**SSPR**
→ user resets their password.

**MFA**
→ verifies the user's identity.

SSPR can use authentication methods to verify the user before allowing a reset.

### How they connect:

**Identity verification → password reset → restored account access**

---

# 6. Microsoft Entra Password Protection

**Microsoft Entra password protection** → Prevents users from choosing commonly used or weak passwords.

### Protection sources

Microsoft provides a global list of commonly used banned passwords.

Organizations can also define custom banned password terms.

### Goal

Prevent predictable passwords such as:
- Company names
- Product names
- Common weak passwords
- Organization-specific terms

### Hybrid environments

Password protection can also extend protection to on-premises Active Directory through supported components.

### How they connect:

**Password protection → blocks weak passwords → stronger credential security**

---

# 7. Smart Lockout

**Smart lockout** → Helps protect accounts from brute
