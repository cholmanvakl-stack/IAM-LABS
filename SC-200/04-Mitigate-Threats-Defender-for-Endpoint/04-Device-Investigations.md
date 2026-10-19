# Perform device investigations in Microsoft Defender for Endpoint

## Main concept
Device investigation connects endpoint inventory, alerts, timeline, and forensic details to determine what happened on a device.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/perform-device-investigations-microsoft-defender-for-endpoints/

## Core knowledge
- Device inventory and device page
- device timeline and alerts
- forensic details
- behavioral blocking
- device discovery and unmanaged assets

## How concepts connect
The device page is the starting point for host context; timeline and evidence support a sequence of activity; discovery helps identify blind spots.

## SC-200 exam decisions
Differentiate known onboarded devices from discovered unmanaged devices; interpret behavioral blocking; choose the right evidence to determine scope.

## Troubleshooting
Check device identity → onboarding/last seen → timeline and alerts → process/file/network events → related devices → containment need.

## Check understanding
1. An alert references a device that has not reported recently. How do you distinguish missing telemetry from an inactive device?
2. Which Defender portal page, setting, or endpoint artifact would you examine first, and why?
3. How would you validate the result before closing the case?

**Study tip:** Think `source → scope → sensor/engine → evidence → response → verification`. Only perform response actions on systems you administer or are authorized to investigate.
