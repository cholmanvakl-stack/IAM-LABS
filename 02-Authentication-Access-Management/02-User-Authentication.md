# 02 — Manage User Authentication

## Main concept
`Choose and administer authentication methods that balance security, usability, and recoverability.` Authentication verifies identity; authorization and Conditional Access decide what follows.

### Passwordless and FIDO2
- `Passkeys/FIDO2:` public-key authentication; private key stays with the authenticator and is protected by local user verification. Origin binding provides phishing resistance.
- `Microsoft Authenticator passwordless phone sign-in:` supported passwordless method, but do not assume every passwordless method has identical phishing resistance.
- `Temporary Access Pass:` time-limited bootstrap/recovery credential for supported passwordless enrollment.
- `Authentication methods policy:` enables and scopes methods; authentication strengths specify which combinations satisfy CA.
`How they connect:` Allowed method → user registration → authentication ceremony → CA strength evaluation.

### Authenticator and OATH
- `Authenticator push:` user approves sign-in; number matching provides stronger challenge context.
- `Software/hardware OATH TOTP:` rotating code from shared secret; works without push but is phishable.
- `Method availability` depends on tenant policy, account, and supported scenario.
`How they connect:` Both can provide possession evidence, but phishing resistance differs.

### Windows Hello for Business (WHfB)
- Device-bound asymmetric keys protected by hardware when supported, unlocked with PIN/biometric.
- PIN is local to the device, not an ordinary cloud password transmitted to a server.
- Deployment requires choosing a suitable trust model and satisfying device, identity, and policy prerequisites.
- `Cloud Kerberos trust`, `key trust`, and `certificate trust` are distinct models for supported hybrid/on-prem access.
`How they connect:` User verification unlocks a device-bound key; identity platform validates cryptographic proof.

### Self-service password reset (SSPR)
- Users reset or unlock accounts through approved verification methods.
- Configure eligible groups, number and types of methods, registration, notifications, and helpdesk behavior.
- `Password writeback` enables supported cloud-initiated password resets to update on-prem AD for hybrid users, when configured and supported.
- SSPR registration and sign-in MFA registration may share combined registration experience, but policies/requirements are separate.
`How they connect:` Recovery verifies the user, then changes credentials at the authoritative destination.

### Password protection and smart lockout
- `Microsoft Entra Password Protection:` global and custom banned password lists; blocks weak/commonly used passwords during supported password changes.
- On-prem AD password protection requires deployment of supported agents and DC components.
- `Smart lockout:` detects suspicious password guessing and temporarily locks sign-in; configure thresholds/duration appropriately.
- Lockout is not the same as disabling an account or remediating user risk.
`How they connect:` Password protection reduces weak choices; smart lockout limits guessing attempts.

### Kerberos and certificate-based authentication
- `Kerberos:` ticket-based authentication, important in on-prem/hybrid SSO; Microsoft Entra Kerberos supports specific cloud/hybrid scenarios.
- `Certificate-based authentication (CBA):` validates trusted user certificates under configured PKI/trust and authentication-binding policies.
- Certificate lifecycle, trust chain, revocation, and user mapping are critical.
`How they connect:` Kerberos proves access through tickets; CBA proves possession of a private key tied to a trusted certificate.

### Authentication for Azure virtual machines
- Microsoft Entra authentication to supported Azure VMs depends on platform-specific extensions, VM/device prerequisites, Azure RBAC sign-in roles, and network reachability.
- `Virtual Machine User Login` vs `Virtual Machine Administrator Login` grants different login privileges.
- Azure resource Contributor is not automatically VM sign-in permission.
`How they connect:` Entra identity authenticates, Azure RBAC authorizes VM login.

### Tenant restrictions
- Restrict access to unapproved external tenants using supported network and identity enforcement mechanisms.
- Understand tenant restrictions versus cross-tenant access settings and Conditional Access.
`How they connect:` Tenant restrictions control which organizational tenants may be accessed; CA evaluates sign-in to targeted resources.

## SC-300 exam essentials
- `FIDO2 vs OATH:` phishing-resistant public key vs phishable OTP.
- `WHfB PIN vs password:` device-local unlock vs reusable shared secret.
- `SSPR vs password writeback:` cloud recovery vs synchronization to on-prem AD.
- `Password protection vs smart lockout:` password quality vs attack-rate defense.
- `CBA vs Kerberos:` certificate trust vs ticketing.
- `VM User Login vs VM Administrator Login:` different Azure roles.

## Troubleshooting
`User/device prerequisites → Method policy → Registration → Trust/keys/certificates → Authentication logs → CA result → Resource/VM role`

## Check understanding
1. Why is a WHfB PIN not equivalent to a cloud password?
2. What enables a hybrid user's SSPR change to update AD?
3. Why might a Contributor be unable to sign into an Azure VM?

Source: https://learn.microsoft.com/en-us/training/modules/manage-user-authentication/
