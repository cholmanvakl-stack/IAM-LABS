# 05 — Implement Access Management for Azure Resources

## Main concept
**Azure RBAC grants a principal permission to perform defined actions at a defined Azure resource scope.** Entra authenticates the principal; Azure Resource Manager and resource services authorize actions.

### Azure RBAC model
**Security principal + Role definition + Scope = Role assignment**
- **Principal:** user, group, service principal, or managed identity.
- **Role definition:** permitted management-plane `Actions` and/or data-plane `DataActions`, with exclusions.
- **Scope:** management group → subscription → resource group → resource.
- Assignments inherit downward; narrower scope reduces reach.
**How they connect:** A valid Entra identity needs an applicable Azure role assignment to perform an Azure action.

### Built-in roles
- **Owner:** manage resources and assign Azure RBAC access.
- **Contributor:** manage resources but generally cannot grant Azure RBAC role assignments.
- **Reader:** view resources without changing them.
- **User Access Administrator / Role Based Access Control Administrator:** manage role assignments within their allowed scope.
- Resource-specific roles, including **Virtual Machine User Login**, **Storage Blob Data Reader**, and **Key Vault Secrets User**, grant narrower capabilities.
**How they connect:** Choose the smallest role that includes the required operation at the narrowest viable scope.

### Entra directory roles vs Azure RBAC
- **Global Administrator:** directory-wide administrative role, not automatically Owner of every Azure subscription.
- **Azure Owner:** broad Azure resource control at assigned scope, not automatically Entra Global Administrator.
- Certain elevated-access mechanisms exist; don't assume cross-system permissions.
**How they connect:** Authentication directory and Azure resource management have distinct authorization systems.

### Custom Azure roles
- Create when no built-in role matches the exact need.
- Define allowed `Actions`, `NotActions`, `DataActions`, `NotDataActions` and assignable scopes as supported.
- **NotActions** subtracts from a role's allowed actions; it is not an explicit deny overriding other role assignments.
- Review wildcards and privileged permissions carefully.
**How they connect:** Custom roles fine-tune permissions while scope limits where they apply.

### Managed identities
- **System-assigned:** tied to one Azure resource's lifecycle; deleting resource removes identity.
- **User-assigned:** standalone Azure resource; reusable across supported workloads and has independent lifecycle.
- Azure manages credential lifecycle; code requests tokens from the hosting environment rather than storing app secrets.
- Creating an identity does **not** automatically grant it resource permissions.
**How they connect:** Workload → managed identity → token for resource → Azure RBAC/data permission → authorized action.

### Access resources with managed identities
1. Enable or attach a managed identity.
2. Identify target resource and required operation.
3. Assign least-privilege Azure role at suitable scope.
4. Request a token for the correct audience from the workload environment.
5. Call the service; verify data-plane permissions and network rules.
**How they connect:** Identity establishes who the workload is; role assignment establishes what it can do.

### Analyze effective permissions
- Inspect direct and inherited role assignments, group membership, scope, deny assignments, and conditions where applicable.
- Management-plane permissions are not automatically data-plane permissions.
- Role assignment propagation can take time.
**How they connect:** Effective permissions are the combined outcome of assignments, scope inheritance, and applicable restrictions.

### Azure Key Vault RBAC
- Choose supported **Azure RBAC permission model** versus legacy **vault access policies**.
- **Key Vault Secrets User:** read secret values in supported scenarios.
- **Key Vault Reader:** view metadata, not secret contents.
- Key Vault management-plane Contributor is not equivalent to secret data access under Azure RBAC.
- Network access, firewall, private endpoint, and token audience can still prevent retrieval.
**How they connect:** Vault exists (management plane) → principal receives data role → network allows request → secret retrieval succeeds.

## SC-300 exam essentials
- **Role vs scope:** allowed action vs where allowed.
- **Owner vs Contributor vs Reader:** assign access vs manage resources vs read.
- **Actions vs DataActions:** management operations vs service data.
- **System-assigned vs user-assigned identity:** lifecycle bound to resource vs independent/reusable.
- **Key Vault Reader vs Secrets User:** metadata vs secret values.
- **NotActions vs deny assignment:** subtraction within role vs separate explicit restriction.

## Troubleshooting
**Principal → Token/audience → Role definition → Assignment scope/inheritance → DataActions → Deny/conditions → Network → Resource response**

## Check understanding
1. Why can't an Azure Contributor necessarily read a Key Vault secret?
2. Why can a user-assigned identity survive deletion of a VM?
3. Why does NotActions not create a global deny?

Source: https://learn.microsoft.com/en-us/training/modules/implement-access-management-for-azure-resources/
