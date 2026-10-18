# 03 — Plan, Implement, and Administer Conditional Access

## Main concept
`Conditional Access is the policy decision engine: IF a sign-in matches defined assignments and conditions, THEN enforce access controls.`

### The policy mental model
`Who/what → Target resource/action → Conditions → Grant/block → Session controls → Evaluation result`
- `Assignments:` users/groups, workload identities where supported, directory roles, targeted resources, and actions.
- `Conditions:` sign-in risk, user risk, device platform, location, client app, device state, and other supported signals.
- `Grant controls:` block, require MFA/authentication strength, compliant device, hybrid joined device, approved client app/app protection where supported, or terms of use.
- `Session controls:` sign-in frequency, persistent browser, app-enforced restrictions, Defender for Cloud Apps controls, continuous access evaluation behavior.
`How they connect:` Policy does not create resource permissions; it determines whether and under what safeguards sign-in can proceed.

### Security defaults vs Conditional Access
- `Security defaults:` simple Microsoft-managed baseline for tenants not using granular CA.
- `Conditional Access:` customized targeting and conditions, typically requiring appropriate Entra licensing.
- Security defaults and CA policy configuration are alternative approaches; plan migration deliberately.
`How they connect:` Both strengthen sign-in, but only CA supports fine-grained policy decisions.

### Plan safe policies
1. Define business requirement, population, apps, risk and required control.
2. Inventory licensing, legacy auth, break-glass accounts, and supported devices.
3. Target a pilot group; exclude emergency-access accounts as appropriate.
4. Configure policy in `report-only` mode; inspect sign-in impact.
5. Use `What If` and sign-in logs; test realistic scenarios.
6. Enable gradually and monitor failures.
`How they connect:` Policy scope determines blast radius; report-only and logs reduce lockout risk.

### Evaluation and policy interactions
- Multiple applicable CA policies are evaluated together; meeting one policy does not bypass another.
- A matching `block` control prevents access.
- Grant controls can use `require all` or `require one of selected controls` when supported.
- Exclusions and targeting determine whether a policy applies, not the user's underlying resource authorization.
- Service principals/workload identities require appropriate workload-specific policy support; interactive user controls do not map directly.
`How they connect:` Effective access = authentication success + all applicable CA requirements + app/resource authorization.

### Authentication strengths
- Define acceptable method combinations, e.g. phishing-resistant MFA.
- `Require MFA` is broader than `require phishing-resistant MFA`.
- Evaluate authentication details and satisfied claims, not just whether a method is registered.
`How they connect:` Authentication strengths turn the method used into an enforceable policy requirement.

### Application controls and sessions
- `Defender for Cloud Apps` session controls can monitor/restrict supported app sessions, such as downloads.
- `Sign-in frequency` controls reauthentication interval under supported circumstances; it is not a guaranteed timer that forcibly logs users out at an exact moment.
- `Continuous Access Evaluation (CAE):` supported services can react to certain critical events/policy changes without waiting for ordinary token expiration.
- `Authentication session management` affects when a user must prove identity again.
`How they connect:` Grant controls decide entry; session controls govern ongoing access.

### Optimization and agent identities
- Conditional Access optimization capabilities can surface policy recommendations; review suggestions and licensing/availability before changes.
- Supported agent/workload identities may have distinct policy types and conditions; do not assume user MFA policies apply to nonhuman identities.
`How they connect:` Identity type changes which policy mechanisms are applicable.

## SC-300 exam essentials
- `Assignments vs conditions vs controls:` target vs context vs enforced action.
- `Report-only vs enabled:` impact observation vs enforcement.
- `What If vs sign-in logs:` simulation vs actual evaluated sign-in.
- `MFA vs authentication strength:` any accepted MFA vs specified strength.
- `Block vs grant:` matching block wins.
- `CAE vs sign-in frequency:` near-real-time reevaluation vs session reauthentication settings.

## Troubleshooting
`Sign-in log → Applied policies → User/resource assignment → Conditions → Exclusions → Grant controls → Session controls → Authentication details → Result`

## Check understanding
1. Why can a user satisfy MFA and still be blocked?
2. What is the difference between What If and a sign-in log?
3. Why does CA success not guarantee SharePoint file access?

Source: https://learn.microsoft.com/en-us/training/modules/plan-implement-administer-conditional-access/
