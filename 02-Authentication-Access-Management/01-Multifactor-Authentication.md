# 01 — Secure Microsoft Entra Users with Multifactor Authentication

## Main concept
`MFA requires evidence from more than one authentication factor, making stolen passwords less useful.` It strengthens sign-in but does not itself decide which resource permissions a user has.

### What MFA proves
- `Knowledge:` something you know (password/PIN).
- `Possession:` something you have (authenticator device, security key).
- `Inherence:` something you are (biometric).
- Two passwords are `not` two factors. A PIN or biometric unlocking a device-bound key can be part of a passwordless, multifactor authentication flow.
- `Phishing-resistant MFA` uses cryptographic, origin-bound authentication (for example, FIDO2 passkeys/security keys); ordinary push/OTP is not equivalently phishing resistant.
`How it connects:` Primary authentication identifies the user; a stronger authentication requirement raises confidence in that sign-in.

### Ways to require MFA
- `Security defaults:` baseline protections for suitable tenants with limited customization; not a replacement for granular Conditional Access.
- `Conditional Access (CA):` target users, groups, resources, and sign-in conditions; require MFA or a specific authentication strength.
- `Per-user MFA:` legacy management approach; generally prefer Conditional Access when licensed and appropriate.
- `Authentication methods policy:` determines which methods users are permitted to register and use. Enabling a method does not necessarily force it on every sign-in.
`How it connects:` Methods policy = what can be used; CA/security defaults = when stronger authentication is required.

### Plan an MFA rollout
1. Inventory users, applications, authentication methods, legacy authentication, and licensing.
2. Select phishing-resistant methods for high-risk roles; consider accessibility and recovery.
3. Register methods and run a pilot with representative users.
4. Plan emergency-access accounts and avoid tenant-wide lockout.
5. Roll out in stages, monitor sign-in logs and registration reports, provide support.
6. Review service accounts and workloads: interactive MFA is not suitable for unattended application authentication.
`How it connects:` Registration readiness and policy targeting must both be correct for reliable enforcement.

### Configure authentication methods
- `Microsoft Authenticator:` push notifications and supported passwordless phone sign-in; number matching improves push resistance to accidental approvals.
- `TOTP/OATH:` time-based one-time codes from supported software/hardware tokens.
- `FIDO2/passkeys:` phishing-resistant public-key sign-in; user verifies locally with PIN/biometric.
- `Temporary Access Pass (TAP):` time-limited onboarding/recovery method to bootstrap stronger methods.
- `SMS/voice:` available in supported scenarios but weaker against phishing/SIM attacks.
- Users need eligible methods registered; tenant policy and licensing may restrict options.
`How it connects:` Allowed methods + registered method + enforced requirement = successful MFA challenge.

### Practical decision example
`Goal:` protect privileged administrators from phishing.
- Prefer a `Conditional Access authentication strength requiring phishing-resistant MFA` rather than merely any MFA.
- Pilot, exclude/secure emergency-access accounts as appropriate, then inspect sign-in logs.

## SC-300 exam essentials
- `Authentication factor vs method:` factor category vs implementation.
- `MFA registration vs MFA enforcement:` having a method registered does not mean every sign-in requires it.
- `Security defaults vs CA:` basic baseline vs customizable policies.
- `Require MFA vs require phishing-resistant authentication strength:` not equivalent.
- `Legacy authentication:` often cannot meet modern MFA challenges; block or migrate it.

## Troubleshooting
`Policy applied? → User/resource targeted? → Method enabled? → Method registered? → Sign-in method compatible? → CA result → Authentication details/logs`

## Check understanding
1. Why are two passwords not MFA?
2. Why does enabling Authenticator not guarantee every sign-in uses MFA?
3. Which control targets phishing-resistant MFA for administrators?

Source: https://learn.microsoft.com/en-us/training/modules/secure-aad-users-with-mfa/
