# Explain cloud workload protections in Microsoft Defender for Cloud

## Main concept
Defender for Cloud offers workload-specific protection plans that detect threats affecting compute, data, application, and cloud infrastructure services.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/understand-azure-defender-cloud-workload-protection/

## Core knowledge
- Defender for Servers
- Defender for App Service
- Defender for Storage
- Defender for SQL
- Defender for open-source databases
- Defender for Key Vault
- Defender for Resource Manager
- Defender for DNS
- Defender for Containers
- Additional workload protection capabilities and plan prerequisites

## How concepts connect
Different workloads produce different attack surfaces and signals: compute activity, database access, storage operations, secret access, control-plane operations and container activity need appropriate protection.

## SC-200 exam decisions
Match a suspicious activity scenario to its workload-specific Defender plan; distinguish data-plane access, control-plane changes, and compute-based attacks.

## Troubleshooting
Identify resource type → confirm workload plan → verify onboarding and supported features → review workload telemetry → alert evidence → remediation.

## Check understanding
1. Suspicious secret access is detected in Azure. Which workload protection and evidence would you examine?
2. What Azure resource, security plan, connector, or investigation view would you check first, and why?
3. How would you validate the resulting remediation or security improvement?

**Study tip:** Use `source → scope → plan/connector → telemetry → alert or recommendation → response → verification`. Check licensing and product support before relying on a feature in production.
