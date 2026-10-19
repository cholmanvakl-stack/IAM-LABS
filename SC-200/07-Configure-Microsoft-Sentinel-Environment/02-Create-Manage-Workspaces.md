# Create and manage Microsoft Sentinel workspaces

## Main concept
`Microsoft Sentinel` uses an Azure Log Analytics workspace for security data. Workspace architecture, permissions, retention, and onboarding affect visibility and operational cost.

**Official Microsoft Learn module:** https://learn.microsoft.com/en-us/training/modules/create-manage-azure-sentinel-workspaces/

## Core knowledge
- Plan workspace architecture, region, data residency, and organizational scope
- Create a Log Analytics workspace and enable Microsoft Sentinel
- Manage workspaces across tenants with Azure Lighthouse
- Understand Azure RBAC and Sentinel-specific roles
- Configure workspace and Sentinel settings
- Configure logs, data retention, and ingestion cost considerations
- Onboard and manage a Sentinel workspace in the Microsoft Defender portal

## How concepts connect
The workspace stores searchable telemetry; RBAC controls who can manage or investigate it; connectors and retention govern available evidence; Defender portal integration brings SOC workflows together.

## SC-200 exam decisions
Select appropriate workspace architecture and permissions; distinguish access to the workspace from access to Sentinel operations; identify multi-tenant administration options.

## Troubleshooting
Check Azure subscription → workspace and region → Sentinel enablement → role assignments → connector/ingestion → retention → Defender portal onboarding.

## Check understanding
1. What is the relationship between a Log Analytics workspace and Microsoft Sentinel?
2. Why might a user see a workspace but lack permission to configure Sentinel?
3. When is Azure Lighthouse relevant?

**Study tip:** Work through `source → scope → connector/workspace → data → detection/investigation → result`. Verify permissions and ingestion before assuming a missing alert means no suspicious activity.
