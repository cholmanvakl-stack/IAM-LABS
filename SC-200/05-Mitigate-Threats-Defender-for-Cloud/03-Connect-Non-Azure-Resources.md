# Connect non-Azure resources to Microsoft Defender for Cloud

## Main concept
Defender for Cloud can extend security posture and workload protection to hybrid and multicloud resources through supported connectors and management integrations.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/connect-non-azure-machines-to-azure-defender/

## Core knowledge
- Protecting non-Azure machines
- Connecting on-premises and other cloud machines using Azure Arc where applicable
- Connecting AWS accounts
- Connecting Google Cloud (GCP) projects
- Connector permissions, scope and onboarding status
- Coverage differences by workload and provider

## How concepts connect
Cloud connectors establish resource discovery and posture visibility; machine onboarding and supported plans provide additional workload telemetry and protections.

## SC-200 exam decisions
Match non-Azure machines, AWS and GCP to the appropriate connection method; understand why connector setup alone may not enable every protection.

## Troubleshooting
Check cloud/provider account → connector and permissions → project/account scope → Azure Arc/onboarding where needed → supported plan → inventory and telemetry.

## Check understanding
1. An AWS account is connected but some workloads are not protected. What should you verify?
2. What Azure resource, security plan, connector, or investigation view would you check first, and why?
3. How would you validate the resulting remediation or security improvement?

**Study tip:** Use `source → scope → plan/connector → telemetry → alert or recommendation → response → verification`. Check licensing and product support before relying on a feature in production.
