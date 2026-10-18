# 05 — Implement Access Management for Azure Resources

## Main concept
<span style="color:#58a6ff"><strong>Azure RBAC grants a principal permission to perform defined actions at a defined Azure resource scope.</strong></span> Entra authenticates the principal; Azure Resource Manager and resource services authorize actions.

### Azure RBAC model
<span style="color:#58a6ff"><strong>Security principal + Role definition + Scope = Role assignment</strong></span>
- <span style="color:#58a6ff"><strong>Principal:</strong></span> user, group, service principal, or managed identity.
- <span style="color:#58a6ff"><strong>Role definition:</strong></span> permitted management-plane `Actions` and/or data-plane `DataActions`, with exclusions.
- <span style="color:#58a6ff"><strong>Scope:</strong></span> management group → subscription → resource group → resource.
- Assignments inherit downward; narrower scope reduces reach.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> A valid Entra identity needs an applicable Azure role assignment to perform an Azure action.

### Built-in roles
- <span style="color:#58a6ff"><strong>Owner:</strong></span> manage resources and assign Azure RBAC access.
- <span style="color:#58a6ff"><strong>Contributor:</strong></span> manage resources but generally cannot grant Azure RBAC role assignments.
- <span style="color:#58a6ff"><strong>Reader:</strong></span> view resources without changing them.
- <span style="color:#58a6ff"><strong>User Access Administrator / Role Based Access Control Administrator:</strong></span> manage role assignments within their allowed scope.
- Resource-specific roles, including <span style="color:#58a6ff"><strong>Virtual Machine User Login</strong></span>, <span style="color:#58a6ff"><strong>Storage Blob Data Reader</strong></span>, and <span style="color:#58a6ff"><strong>Key Vault Secrets User</strong></span>, grant narrower capabilities.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Choose the smallest role that includes the required operation at the narrowest viable scope.

### Entra directory roles vs Azure RBAC
- <span style="color:#58a6ff"><strong>Global Administrator:</strong></span> directory-wide administrative role, not automatically Owner of every Azure subscription.
- <span style="color:#58a6ff"><strong>Azure Owner:</strong></span> broad Azure resource control at assigned scope, not automatically Entra Global Administrator.
- Certain elevated-access mechanisms exist; don't assume cross-system permissions.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Authentication directory and Azure resource management have distinct authorization systems.

### Custom Azure roles
- Create when no built-in role matches the exact need.
- Define allowed `Actions`, `NotActions`, `DataActions`, `NotDataActions` and assignable scopes as supported.
- <span style="color:#58a6ff"><strong>NotActions</strong></span> subtracts from a role's allowed actions; it is not an explicit deny overriding other role assignments.
- Review wildcards and privileged permissions carefully.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Custom roles fine-tune permissions while scope limits where they apply.

### Managed identities
- <span style="color:#58a6ff"><strong>System-assigned:</strong></span> tied to one Azure resource's lifecycle; deleting resource removes identity.
- <span style="color:#58a6ff"><strong>User-assigned:</strong></span> standalone Azure resource; reusable across supported workloads and has independent lifecycle.
- Azure manages credential lifecycle; code requests tokens from the hosting environment rather than storing app secrets.
- Creating an identity does <span style="color:#58a6ff"><strong>not</strong></span> automatically grant it resource permissions.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Workload → managed identity → token for resource → Azure RBAC/data permission → authorized action.

### Access resources with managed identities
1. Enable or attach a managed identity.
2. Identify target resource and required operation.
3. Assign least-privilege Azure role at suitable scope.
4. Request a token for the correct audience from the workload environment.
5. Call the service; verify data-plane permissions and network rules.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Identity establishes who the workload is; role assignment establishes what it can do.

### Analyze effective permissions
- Inspect direct and inherited role assignments, group membership, scope, deny assignments, and conditions where applicable.
- Management-plane permissions are not automatically data-plane permissions.
- Role assignment propagation can take time.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Effective permissions are the combined outcome of assignments, scope inheritance, and applicable restrictions.

### Azure Key Vault RBAC
- Choose supported <span style="color:#58a6ff"><strong>Azure RBAC permission model</strong></span> versus legacy <span style="color:#58a6ff"><strong>vault access policies</strong></span>.
- <span style="color:#58a6ff"><strong>Key Vault Secrets User:</strong></span> read secret values in supported scenarios.
- <span style="color:#58a6ff"><strong>Key Vault Reader:</strong></span> view metadata, not secret contents.
- Key Vault management-plane Contributor is not equivalent to secret data access under Azure RBAC.
- Network access, firewall, private endpoint, and token audience can still prevent retrieval.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Vault exists (management plane) → principal receives data role → network allows request → secret retrieval succeeds.

## SC-300 exam essentials
- <span style="color:#58a6ff"><strong>Role vs scope:</strong></span> allowed action vs where allowed.
- <span style="color:#58a6ff"><strong>Owner vs Contributor vs Reader:</strong></span> assign access vs manage resources vs read.
- <span style="color:#58a6ff"><strong>Actions vs DataActions:</strong></span> management operations vs service data.
- <span style="color:#58a6ff"><strong>System-assigned vs user-assigned identity:</strong></span> lifecycle bound to resource vs independent/reusable.
- <span style="color:#58a6ff"><strong>Key Vault Reader vs Secrets User:</strong></span> metadata vs secret values.
- <span style="color:#58a6ff"><strong>NotActions vs deny assignment:</strong></span> subtraction within role vs separate explicit restriction.

## Troubleshooting
**Principal → Token/audience → Role definition → Assignment scope/inheritance → DataActions → Deny/conditions → Network → Resource response**

## Check understanding
1. Why can't an Azure Contributor necessarily read a Key Vault secret?
2. Why can a user-assigned identity survive deletion of a VM?
3. Why does NotActions not create a global deny?

Source: https://learn.microsoft.com/en-us/training/modules/implement-access-management-for-azure-resources/
