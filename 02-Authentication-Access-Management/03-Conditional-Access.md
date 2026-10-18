# 03 — Plan, Implement, and Administer Conditional Access

## Main concept
**Conditional Access is the policy decision engine: IF a sign-in matches defined assignments and conditions, THEN enforce access controls.**

### The policy mental model
**Who/what → Target resource/action → Conditions → Grant/block → Session controls → Evaluation result**
- <span style="color:#58a6ff"><strong>Assignments:</strong></span> users/groups, workload identities where supported, directory roles, targeted resources, and actions.
- <span style="color:#58a6ff"><strong>Conditions:</strong></span> sign-in risk, user risk, device platform, location, client app, device state, and other supported signals.
- <span style="color:#58a6ff"><strong>Grant controls:</strong></span> block, require MFA/authentication strength, compliant device, hybrid joined device, approved client app/app protection where supported, or terms of use.
- <span style="color:#58a6ff"><strong>Session controls:</strong></span> sign-in frequency, persistent browser, app-enforced restrictions, Defender for Cloud Apps controls, continuous access evaluation behavior.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Policy does not create resource permissions; it determines whether and under what safeguards sign-in can proceed.

### Security defaults vs Conditional Access
- <span style="color:#58a6ff"><strong>Security defaults:</strong></span> simple Microsoft-managed baseline for tenants not using granular CA.
- <span style="color:#58a6ff"><strong>Conditional Access:</strong></span> customized targeting and conditions, typically requiring appropriate Entra licensing.
- Security defaults and CA policy configuration are alternative approaches; plan migration deliberately.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Both strengthen sign-in, but only CA supports fine-grained policy decisions.

### Plan safe policies
1. Define business requirement, population, apps, risk and required control.
2. Inventory licensing, legacy auth, break-glass accounts, and supported devices.
3. Target a pilot group; exclude emergency-access accounts as appropriate.
4. Configure policy in <span style="color:#58a6ff"><strong>report-only</strong></span> mode; inspect sign-in impact.
5. Use <span style="color:#58a6ff"><strong>What If</strong></span> and sign-in logs; test realistic scenarios.
6. Enable gradually and monitor failures.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Policy scope determines blast radius; report-only and logs reduce lockout risk.

### Evaluation and policy interactions
- Multiple applicable CA policies are evaluated together; meeting one policy does not bypass another.
- A matching <span style="color:#58a6ff"><strong>block</strong></span> control prevents access.
- Grant controls can use <span style="color:#58a6ff"><strong>require all</strong></span> or <span style="color:#58a6ff"><strong>require one of selected controls</strong></span> when supported.
- Exclusions and targeting determine whether a policy applies, not the user's underlying resource authorization.
- Service principals/workload identities require appropriate workload-specific policy support; interactive user controls do not map directly.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Effective access = authentication success + all applicable CA requirements + app/resource authorization.

### Authentication strengths
- Define acceptable method combinations, e.g. phishing-resistant MFA.
- <span style="color:#58a6ff"><strong>Require MFA</strong></span> is broader than <span style="color:#58a6ff"><strong>require phishing-resistant MFA</strong></span>.
- Evaluate authentication details and satisfied claims, not just whether a method is registered.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Authentication strengths turn the method used into an enforceable policy requirement.

### Application controls and sessions
- <span style="color:#58a6ff"><strong>Defender for Cloud Apps</strong></span> session controls can monitor/restrict supported app sessions, such as downloads.
- <span style="color:#58a6ff"><strong>Sign-in frequency</strong></span> controls reauthentication interval under supported circumstances; it is not a guaranteed timer that forcibly logs users out at an exact moment.
- <span style="color:#58a6ff"><strong>Continuous Access Evaluation (CAE):</strong></span> supported services can react to certain critical events/policy changes without waiting for ordinary token expiration.
- <span style="color:#58a6ff"><strong>Authentication session management</strong></span> affects when a user must prove identity again.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Grant controls decide entry; session controls govern ongoing access.

### Optimization and agent identities
- Conditional Access optimization capabilities can surface policy recommendations; review suggestions and licensing/availability before changes.
- Supported agent/workload identities may have distinct policy types and conditions; do not assume user MFA policies apply to nonhuman identities.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Identity type changes which policy mechanisms are applicable.

## SC-300 exam essentials
- <span style="color:#58a6ff"><strong>Assignments vs conditions vs controls:</strong></span> target vs context vs enforced action.
- <span style="color:#58a6ff"><strong>Report-only vs enabled:</strong></span> impact observation vs enforcement.
- <span style="color:#58a6ff"><strong>What If vs sign-in logs:</strong></span> simulation vs actual evaluated sign-in.
- <span style="color:#58a6ff"><strong>MFA vs authentication strength:</strong></span> any accepted MFA vs specified strength.
- <span style="color:#58a6ff"><strong>Block vs grant:</strong></span> matching block wins.
- <span style="color:#58a6ff"><strong>CAE vs sign-in frequency:</strong></span> near-real-time reevaluation vs session reauthentication settings.

## Troubleshooting
**Sign-in log → Applied policies → User/resource assignment → Conditions → Exclusions → Grant controls → Session controls → Authentication details → Result**

## Check understanding
1. Why can a user satisfy MFA and still be blocked?
2. What is the difference between What If and a sign-in log?
3. Why does CA success not guarantee SharePoint file access?

Source: https://learn.microsoft.com/en-us/training/modules/plan-implement-administer-conditional-access/
