# Manage Microsoft Entra Identity Protection

## Main concept
`Microsoft Entra ID Protection` detects identity-related risk and supports risk-based remediation.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/manage-azure-active-directory-identity-protection/

## Core knowledge
- `User risk versus sign-in risk`
- `risk detections`
- `risk-based Conditional Access policies`
- `MFA registration`
- `risky users and sign-ins`
- `dismiss/confirm compromise/remediate`
- `workload identity risks`
- `identity risk management`

## How concepts connect
Sign-in risk concerns an authentication event; user risk concerns the likelihood an identity is compromised. Policy can challenge, block, or require remediation based on risk and configured controls.

## SC-200 exam decisions
Choose response by risk type; distinguish risky users from risky sign-ins; understand policy prerequisites and licensing; investigate before dismissing risk.

## Troubleshooting
Check risk detection → user/sign-in record → policy scope and conditions → enforcement → remediation state → subsequent sign-ins.

## Check understanding
1. An account has high user risk but its latest sign-in appears normal. What should the analyst investigate?
2. Which Defender product or portal view would you start with, and why?
3. What evidence would prove the response worked?

**Study tip:** Explain the answer in terms of `signal → scope → investigation → response → validation`, not just feature definitions.
