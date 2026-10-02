# Day 4 — Authentication Fundamentals

### Authentication
**Authentication** → Verifies that an identity is who they claim to be.
- **Authentication method** → How the identity proves who they are.
- **Authentication** is different from **authorization**, which determines what the identity can access.
**How they connect:** Authentication establishes identity before authorization determines access.

### Authentication Methods
**Authentication method** → A method used to verify an identity.
- Password
- Microsoft Authenticator
- FIDO2 security key
- Passkey
- Windows Hello for Business
- Certificate-based authentication
- Temporary Access Pass (TAP)
**How they connect:** Authentication methods provide the mechanisms used to verify identities.

### Authentication Methods Policy
**Authentication methods policy** → Controls which authentication methods are available and who can use them.
- Methods can be enabled or disabled.
- Methods can be scoped to specific users or groups.
**How they connect:** The policy controls which authentication methods users can register and use.

### Multifactor Authentication
**MFA** → Requires authentication using multiple factors.
- **Something you know** → Password/PIN.
- **Something you have** → Phone/security key.
- **Something you are** → Biometric.
- Two methods from the same factor type do not provide two different factors.
**How they connect:** MFA increases authentication security by requiring multiple authentication factors.

### Microsoft Authenticator
**Microsoft Authenticator** → Mobile authentication method used for MFA and passwordless authentication.
- Supports push notifications.
- Supports number matching.
- Can support passwordless sign-in.
**How they connect:** Authenticator provides MFA and passwordless authentication capabilities.

### Passwordless Authentication
**Passwordless authentication** → Authentication without a traditional password.
- Microsoft Authenticator passwordless
- FIDO2
- Passkeys
- Windows Hello for Business
**How they connect:** Passwordless methods replace traditional password-based authentication with stronger authentication mechanisms.

### FIDO2 and Passkeys
**FIDO2** → Passwordless authentication standard using public-key cryptography.
- Private key remains protected by the authenticator.
- Public key is registered with Microsoft Entra.
**Passkey** → Passwordless credential based on public-key cryptography.
**How they connect:** FIDO2 and passkeys provide phishing-resistant passwordless authentication.

### Windows Hello for Business
**Windows Hello for Business** → Device-bound authentication for Windows.
- Can use PIN, fingerprint, or facial recognition.
- Uses a device-bound credential instead of sending a password.
**How they connect:** Windows Hello provides passwordless authentication for Windows users.

### Authentication Strength
**Authentication strength** → Defines which authentication methods or combinations are acceptable.
- **Multifactor authentication strength** → Requires MFA-capable methods.
- **Passwordless MFA strength** → Requires passwordless methods.
- **Phishing-resistant MFA strength** → Requires phishing-resistant methods.
**How they connect:** Authentication strength can be used by Conditional Access to require specific authentication methods.

### Self-Service Password Reset
**SSPR** → Allows users to reset their own passwords after verifying their identity.
- Administrators control who can use SSPR.
- Authentication methods are used for identity verification.
**How they connect:** SSPR uses authentication methods to verify users before allowing password recovery.

### Temporary Access Pass
**TAP** → A time-limited passcode used to authenticate users and help register authentication methods.
- Useful for onboarding and passwordless registration.
- Temporary rather than permanent.
**How they connect:** TAP provides temporary authentication that can help users establish stronger permanent authentication methods.
