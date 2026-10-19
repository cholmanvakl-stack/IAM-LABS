# Deploy the Microsoft Defender for Endpoint environment

## Main concept
A functioning `Defender for Endpoint` deployment requires supported devices, correct onboarding, access controls, and configured platform features.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/deploy-microsoft-defender-for-endpoints-environment/

## Core knowledge
- Environment creation
- OS compatibility and capabilities
- onboarding methods and device verification
- access management and RBAC
- device groups
- advanced features

## How concepts connect
Onboarding enables telemetry; roles limit who can investigate or respond; device groups and settings shape scope and automation.

## SC-200 exam decisions
Identify appropriate onboarding method and supported OS; distinguish RBAC permissions from device-group scope; validate onboarded device status.

## Troubleshooting
Check license and prerequisites → onboarding method → connectivity → device sensor/health → device inventory → permissions and groups.

## Check understanding
1. An onboarded endpoint is absent from inventory. What would you check before changing detection settings?
2. Which Defender portal page, setting, or endpoint artifact would you examine first, and why?
3. How would you validate the result before closing the case?

**Study tip:** Think `source → scope → sensor/engine → evidence → response → verification`. Only perform response actions on systems you administer or are authorized to investigate.
