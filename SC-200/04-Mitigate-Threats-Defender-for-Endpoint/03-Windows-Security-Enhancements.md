# Implement Windows security enhancements with Microsoft Defender for Endpoint

## Main concept
`Attack surface reduction (ASR)` helps reduce risky Windows behaviors and exposure to common attack techniques.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/implement-windows-10-security-enhancements-with-microsoft-defender-for-endpoint/

## Core knowledge
- ASR concepts and rule types
- enable and configure ASR rules
- audit versus block modes
- compatibility and policy scoping
- monitoring rule impact

## How concepts connect
ASR is preventive hardening, while EDR detects and investigates suspicious activity that occurs despite preventive controls.

## SC-200 exam decisions
Select audit mode for impact evaluation where appropriate; understand rule targeting, enforcement, and exclusions; avoid disabling broad protection without evidence.

## Troubleshooting
Check policy source → device/group assignment → effective configuration → rule mode → event evidence → exclusions and outcome.

## Check understanding
1. A business application stops working after ASR is enabled. How would you investigate and safely tune the rule?
2. Which Defender portal page, setting, or endpoint artifact would you examine first, and why?
3. How would you validate the result before closing the case?

**Study tip:** Think `source → scope → sensor/engine → evidence → response → verification`. Only perform response actions on systems you administer or are authorized to investigate.
