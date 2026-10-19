# Configure for alerts and detections in Microsoft Defender for Endpoint

## Main concept
Alert and detection settings determine which endpoint security signals are surfaced, notified, suppressed, or governed by indicators.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/configure-settings-for-alerts-detections-microsoft-defender-for-endpoint/

## Core knowledge
- Advanced detection features
- alert notification rules
- alert suppression
- indicators of compromise (IOCs)
- allow/block indicators and scope

## How concepts connect
Telemetry and detection produce alerts; notification routes work; suppression reduces known noise; indicators influence detection or enforcement.

## SC-200 exam decisions
Differentiate suppressing an alert from remediating a threat; select indicators with sufficient evidence; manage false positives and rule scope.

## Troubleshooting
Check event telemetry → detection configuration → notification recipients → suppression rules → indicator applicability → outcome.

## Check understanding
1. A known malicious indicator produces no analyst notification. Which settings should be checked?
2. Which Defender portal page, setting, or endpoint artifact would you examine first, and why?
3. How would you validate the result before closing the case?

**Study tip:** Think `source → scope → sensor/engine → evidence → response → verification`. Only perform response actions on systems you administer or are authorized to investigate.
