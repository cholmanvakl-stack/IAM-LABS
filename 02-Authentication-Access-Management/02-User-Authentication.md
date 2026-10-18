# 02 — Manage User Authentication

## Main concept
<span style="color:#58a6ff"><strong>Choose and administer authentication methods that balance security, usability, and recoverability.</strong></span> Authentication verifies identity; authorization and Conditional Access decide what follows.

### Passwordless and FIDO2
- <span style="color:#58a6ff"><strong>Passkeys/FIDO2:</strong></span> public-key authentication; private key stays with the authenticator and is protected by local user verification. Origin binding provides phishing resistance.
- <span style="color:#58a6ff"><strong>Microsoft Authenticator passwordless phone sign-in:</strong></span> supported passwordless method, but do not assume every passwordless method has identical phishing resistance.
- <span style="color:#58a6ff"><strong>Temporary Access Pass:</strong></span> time-limited bootstrap/recovery credential for supported passwordless enrollment.
- <span style="color:#58a6ff"><strong>Authentication methods policy:</strong></span> enables and scopes methods; authentication strengths specify which combinations satisfy CA.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Allowed method → user registration → authentication ceremony → CA strength evaluation.

### Authenticator and OATH
- <span style="color:#58a6ff"><strong>Authenticator push:</strong></span> user approves sign-in; number matching provides stronger challenge context.
- <span style="color:#58a6ff"><strong>Software/hardware OATH TOTP:</strong></span> rotating code from shared secret; works without push but is phishable.
- <span style="color:#58a6ff"><strong>Method availability</strong></span> depends on tenant policy, account, and supported scenario.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Both can provide possession evidence, but phishing resistance differs.

### Windows Hello for Business (WHfB)
- Device-bound asymmetric keys protected by hardware when supported, unlocked with PIN/biometric.
- PIN is local to the device, not an ordinary cloud password transmitted to a server.
- Deployment requires choosing a suitable trust model and satisfying device, identity, and policy prerequisites.
- <span style="color:#58a6ff"><strong>Cloud Kerberos trust</strong></span>, <span style="color:#58a6ff"><strong>key trust</strong></span>, and <span style="color:#58a6ff"><strong>certificate trust</strong></span> are distinct models for supported hybrid/on-prem access.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> User verification unlocks a device-bound key; identity platform validates cryptographic proof.

### Self-service password reset (SSPR)
- Users reset or unlock accounts through approved verification methods.
- Configure eligible groups, number and types of methods, registration, notifications, and helpdesk behavior.
- <span style="color:#58a6ff"><strong>Password writeback</strong></span> enables supported cloud-initiated password resets to update on-prem AD for hybrid users, when configured and supported.
- SSPR registration and sign-in MFA registration may share combined registration experience, but policies/requirements are separate.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Recovery verifies the user, then changes credentials at the authoritative destination.

### Password protection and smart lockout
- <span style="color:#58a6ff"><strong>Microsoft Entra Password Protection:</strong></span> global and custom banned password lists; blocks weak/commonly used passwords during supported password changes.
- On-prem AD password protection requires deployment of supported agents and DC components.
- <span style="color:#58a6ff"><strong>Smart lockout:</strong></span> detects suspicious password guessing and temporarily locks sign-in; configure thresholds/duration appropriately.
- Lockout is not the same as disabling an account or remediating user risk.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Password protection reduces weak choices; smart lockout limits guessing attempts.

### Kerberos and certificate-based authentication
- <span style="color:#58a6ff"><strong>Kerberos:</strong></span> ticket-based authentication, important in on-prem/hybrid SSO; Microsoft Entra Kerberos supports specific cloud/hybrid scenarios.
- <span style="color:#58a6ff"><strong>Certificate-based authentication (CBA):</strong></span> validates trusted user certificates under configured PKI/trust and authentication-binding policies.
- Certificate lifecycle, trust chain, revocation, and user mapping are critical.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Kerberos proves access through tickets; CBA proves possession of a private key tied to a trusted certificate.

### Authentication for Azure virtual machines
- Microsoft Entra authentication to supported Azure VMs depends on platform-specific extensions, VM/device prerequisites, Azure RBAC sign-in roles, and network reachability.
- <span style="color:#58a6ff"><strong>Virtual Machine User Login</strong></span> vs <span style="color:#58a6ff"><strong>Virtual Machine Administrator Login</strong></span> grants different login privileges.
- Azure resource Contributor is not automatically VM sign-in permission.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Entra identity authenticates, Azure RBAC authorizes VM login.

### Tenant restrictions
- Restrict access to unapproved external tenants using supported network and identity enforcement mechanisms.
- Understand tenant restrictions versus cross-tenant access settings and Conditional Access.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Tenant restrictions control which organizational tenants may be accessed; CA evaluates sign-in to targeted resources.

## SC-300 exam essentials
- <span style="color:#58a6ff"><strong>FIDO2 vs OATH:</strong></span> phishing-resistant public key vs phishable OTP.
- <span style="color:#58a6ff"><strong>WHfB PIN vs password:</strong></span> device-local unlock vs reusable shared secret.
- <span style="color:#58a6ff"><strong>SSPR vs password writeback:</strong></span> cloud recovery vs synchronization to on-prem AD.
- <span style="color:#58a6ff"><strong>Password protection vs smart lockout:</strong></span> password quality vs attack-rate defense.
- <span style="color:#58a6ff"><strong>CBA vs Kerberos:</strong></span> certificate trust vs ticketing.
- <span style="color:#58a6ff"><strong>VM User Login vs VM Administrator Login:</strong></span> different Azure roles.

## Troubleshooting
**User/device prerequisites → Method policy → Registration → Trust/keys/certificates → Authentication logs → CA result → Resource/VM role**

## Check understanding
1. Why is a WHfB PIN not equivalent to a cloud password?
2. What enables a hybrid user's SSPR change to update AD?
3. Why might a Contributor be unable to sign into an Azure VM?

Source: https://learn.microsoft.com/en-us/training/modules/manage-user-authentication/
