# Connect Azure assets to Microsoft Defender for Cloud

## Main concept
Defender for Cloud needs resource inventory and appropriate provisioning to provide visibility into Azure assets and their security signals.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/connect-azure-assets-to-azure-defender/

## Core knowledge
- Asset inventory and resource exploration
- Resource filters and coverage
- Automatic provisioning of supported monitoring components
- Manual provisioning when automatic deployment is unsuitable
- Verification of deployment and reporting health

## How concepts connect
Resource discovery establishes what exists; provisioning and integration determine which resources emit relevant security data; investigation depends on healthy telemetry.

## SC-200 exam decisions
Choose auto-provisioning versus manual provisioning, identify missing resource coverage, and interpret inventory versus monitoring status.

## Troubleshooting
Check subscription and resource → plan settings → auto-provisioning configuration → agent/extension deployment → connectivity → data freshness.

## Check understanding
1. A virtual machine appears in asset inventory but does not report expected security data. How do you isolate the cause?
2. What Azure resource, security plan, connector, or investigation view would you check first, and why?
3. How would you validate the resulting remediation or security improvement?

**Study tip:** Use `source → scope → plan/connector → telemetry → alert or recommendation → response → verification`. Check licensing and product support before relying on a feature in production.
