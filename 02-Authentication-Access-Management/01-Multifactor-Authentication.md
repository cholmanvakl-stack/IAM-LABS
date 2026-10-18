# 01 — Secure Microsoft Entra Users with Multifactor Authentication

## Main concept
<span style="color:#58a6ff"><strong>MFA requires evidence from more than one authentication factor, making stolen passwords less useful.</strong></span> It strengthens sign-in but does not itself decide which resource permissions a user has.

### What MFA proves
- <span style="color:#58a6ff"><strong>Knowledge:</strong></span> something you know (password/PIN).
- <span style="color:#58a6ff"><strong>Possession:</strong></span> something you have (authenticator device, security key).
- <span style="color:#58a6ff"><strong>Inherence:</strong></span> something you are (biometric).
- Two passwords are <span style="color:#58a6ff"><strong>not</strong></span> two factors. A PIN or biometric unlocking a device-bound key can be part of a passwordless, multifactor authentication flow.
- <span style="color:#58a6ff"><strong>Phishing-resistant MFA</strong></span> uses cryptographic, origin-bound authentication (for example, FIDO2 passkeys/security keys); ordinary push/OTP is not equivalently phishing resistant.
<span style="color:#58a6ff"><strong>How it connects:</strong></span> Primary authentication identifies the user; a stronger authentication requirement raises confidence in that sign-in.

### Ways to require MFA
- <span style="color:#58a6ff"><strong>Security defaults:</strong></span> baseline protections for suitable tenants with limited customization; not a replacement for granular Conditional Access.
- <span style="color:#58a6ff"><strong>Conditional Access (CA):</strong></span> target users, groups, resources, and sign-in conditions; require MFA or a specific authentication strength.
- <span style="color:#58a6ff"><strong>Per-user MFA:</strong></span> legacy management approach; generally prefer Conditional Access when licensed and appropriate.
- <span style="color:#58a6ff"><strong>Authentication methods policy:</strong></span> determines which methods users are permitted to register and use. Enabling a method does not necessarily force it on every sign-in.
<span style="color:#58a6ff"><strong>How it connects:</strong></span> Methods policy = what can be used; CA/security defaults = when stronger authentication is required.

### Plan an MFA rollout
1. Inventory users, applications, authentication methods, legacy authentication, and licensing.
2. Select phishing-resistant methods for high-risk roles; consider accessibility and recovery.
3. Register methods and run a pilot with representative users.
4. Plan emergency-access accounts and avoid tenant-wide lockout.
5. Roll out in stages, monitor sign-in logs and registration reports, provide support.
6. Review service accounts and workloads: interactive MFA is not suitable for unattended application authentication.
<span style="color:#58a6ff"><strong>How it connects:</strong></span> Registration readiness and policy targeting must both be correct for reliable enforcement.

### Configure authentication methods
- <span style="color:#58a6ff"><strong>Microsoft Authenticator:</strong></span> push notifications and supported passwordless phone sign-in; number matching improves push resistance to accidental approvals.
- <span style="color:#58a6ff"><strong>TOTP/OATH:</strong></span> time-based one-time codes from supported software/hardware tokens.
- <span style="color:#58a6ff"><strong>FIDO2/passkeys:</strong></span> phishing-resistant public-key sign-in; user verifies locally with PIN/biometric.
- <span style="color:#58a6ff"><strong>Temporary Access Pass (TAP):</strong></span> time-limited onboarding/recovery method to bootstrap stronger methods.
- <span style="color:#58a6ff"><strong>SMS/voice:</strong></span> available in supported scenarios but weaker against phishing/SIM attacks.
- Users need eligible methods registered; tenant policy and licensing may restrict options.
<span style="color:#58a6ff"><strong>How it connects:</strong></span> Allowed methods + registered method + enforced requirement = successful MFA challenge.

### Practical decision example
<span style="color:#58a6ff"><strong>Goal:</strong></span> protect privileged administrators from phishing.
- Prefer a <span style="color:#58a6ff"><strong>Conditional Access authentication strength requiring phishing-resistant MFA</strong></span> rather than merely any MFA.
- Pilot, exclude/secure emergency-access accounts as appropriate, then inspect sign-in logs.

## SC-300 exam essentials
- <span style="color:#58a6ff"><strong>Authentication factor vs method:</strong></span> factor category vs implementation.
- <span style="color:#58a6ff"><strong>MFA registration vs MFA enforcement:</strong></span> having a method registered does not mean every sign-in requires it.
- <span style="color:#58a6ff"><strong>Security defaults vs CA:</strong></span> basic baseline vs customizable policies.
- <span style="color:#58a6ff"><strong>Require MFA vs require phishing-resistant authentication strength:</strong></span> not equivalent.
- <span style="color:#58a6ff"><strong>Legacy authentication:</strong></span> often cannot meet modern MFA challenges; block or migrate it.

## Troubleshooting
**Policy applied? → User/resource targeted? → Method enabled? → Method registered? → Sign-in method compatible? → CA result → Authentication details/logs**

## Check understanding
1. Why are two passwords not MFA?
2. Why does enabling Authenticator not guarantee every sign-in uses MFA?
3. Which control targets phishing-resistant MFA for administrators?

Source: https://learn.microsoft.com/en-us/training/modules/secure-aad-users-with-mfa/
