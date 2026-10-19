# Investigate insider risk alerts and related activity

## Main concept
`Microsoft Purview Insider Risk Management` helps authorized reviewers triage risky user activity, analyze context, and manage investigations and cases while protecting privacy.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/purview-insider-risk-investigate-alerts/

## Core knowledge
- Insider Risk Management policies, indicators, alerts and priorities
- Policy thresholds and alert volume tuning
- Alerts dashboard, alert details and triage
- All risk factors, Activity explorer and User activity views
- Security Copilot and AI agents for investigative assistance
- Defender XDR correlation and insider risk cases
- Case actions, escalation, resolution and privacy considerations

## How concepts connect
Policies and indicators detect potentially risky activity; alert triage identifies cases needing review; risk-factor and activity views provide context; cases track decisions and authorized follow-up.

## SC-200 exam decisions
Differentiate a risky activity signal from proof of malicious intent; know when to create or escalate a case; use activity views for evidence and apply least-privilege, privacy-aware handling.

## Troubleshooting
Check policy indicators → user/population scope → thresholds → alert details → activity timeline → Defender XDR correlation → case action and resolution.

## Check understanding
1. A high-volume insider risk policy generates many low-value alerts. Which controls should you review?
2. Which view helps reconstruct a user's activity over time?
3. Why should suspicious activity not automatically be labeled malicious insider behavior?

**Study tip:** Explain scenarios using `source → scope → evidence → investigation → decision → remediation or case action → validation`. Follow organizational authorization and privacy requirements.
