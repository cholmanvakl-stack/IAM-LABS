# Day 4 — Hybrid Identity

### Hybrid Identity
**Hybrid identity** → Connects on-premises Active Directory identities with Microsoft Entra ID.
- Provides a common identity across on-premises and cloud environments.
**How they connect:** Hybrid identity uses synchronization and authentication technologies to connect on-premises AD with Entra ID.

### Microsoft Entra Connect
**Microsoft Entra Connect** → Integrates on-premises Active Directory with Microsoft Entra ID.
- Supports identity synchronization and hybrid authentication.
**How they connect:** Entra Connect provides the bridge between on-premises AD and Entra ID.

### Microsoft Entra Connect Sync
**Connect Sync** → Traditional synchronization engine that synchronizes on-premises directory objects to Entra ID.
- Synchronizes users, groups, and other supported objects.
**How they connect:** Connect Sync moves identity information from on-premises AD into Entra ID.

### Microsoft Entra Cloud Sync
**Cloud Sync** → Cloud-managed synchronization solution using a lightweight provisioning agent.
- Uses a cloud provisioning service.
- Provides an alternative to traditional Connect Sync.
**How they connect:** Cloud Sync synchronizes on-premises identities with Entra ID using a more cloud-managed architecture.

### Password Hash Synchronization
**PHS** → Synchronizes a representation of the on-premises password to Entra ID for cloud authentication.
- Password itself is not synchronized.
- Authentication can occur in Entra ID.
**How they connect:** PHS reduces dependency on on-premises AD during authentication.

### Pass-through Authentication
**PTA** → Validates user passwords against on-premises Active Directory through authentication agents.
- Requires connectivity to on-premises AD.
**How they connect:** PTA allows Entra sign-in while password validation remains on-premises.

### Seamless Single Sign-On
**Seamless SSO** → Allows supported users on trusted corporate environments to sign in without repeatedly entering credentials.
- Reduces repeated authentication prompts.
**How they connect:** Seamless SSO improves the user experience while PHS, PTA, or federation handle authentication.

### Federation
**Federation** → Delegates authentication from Entra ID to a trusted identity provider.
- **AD FS** → Common on-premises federation provider.
- Authentication is handled by the trusted provider.
**How they connect:** Federation connects Entra access with an external authentication provider.

### Synchronization Troubleshooting
**Synchronization troubleshooting** → Identifying and resolving problems preventing correct synchronization between on-premises AD and Entra ID.
- Check synchronization errors, attributes, configuration, connectivity, and filtering.
**How they connect:** Troubleshooting determines where the synchronization process is failing.

### Microsoft Entra Connect Health
**Connect Health** → Monitors the health of hybrid identity components.
- Monitors components such as Entra Connect and AD FS.
- Provides health and monitoring information.
**How they connect:** Connect Health provides visibility into the health of the hybrid identity environment.

### Exam-Focused Comparison

| Technology | Primary purpose | Where authentication occurs | Key exam distinction |
|---|---|---|---|
| **Connect Sync** | Synchronization | Not an authentication method | Traditional synchronization engine |
| **Cloud Sync** | Synchronization | Not an authentication method | Cloud-managed provisioning + lightweight agent |
| **PHS** | Authentication | **Microsoft Entra ID** | Least dependency on on-prem AD during authentication |
| **PTA** | Authentication | **On-premises AD** | Password validated through PTA agents |
| **Federation / AD FS** | Authentication | **Federation provider** | Entra delegates authentication to trusted IdP |
| **Seamless SSO** | Sign-in experience | Depends on authentication method | Reduces repeated credential prompts |
| **Connect Health** | Monitoring | N/A | Monitors hybrid identity infrastructure |

**How they connect:** **Connect Sync/Cloud Sync move identity information; PHS/PTA/Federation determine authentication; Seamless SSO improves the sign-in experience; Connect Health monitors the hybrid environment.**

### Staged Synchronization Troubleshooting
**Synchronization troubleshooting** → Troubleshoot the identity flow from on-premises AD toward Microsoft Entra ID.
- **1. Verify the source** → Confirm the user/object exists and required attributes are correct in on-premises AD.
- **2. Check synchronization scope** → Verify the object is included in the configured OU/domain/filter scope.
- **3. Check the sync engine or agent** → Verify Connect Sync or Cloud Sync is running and healthy.
- **4. Check synchronization errors** → Identify failed objects, attribute errors, duplicate identities, or configuration issues.
- **5. Check connectivity** → Verify the synchronization component can communicate with required services.
- **6. Check Microsoft Entra ID** → Confirm whether the object reached Entra and whether its properties are correct.
- **7. Verify the result** → Confirm the expected identity, attributes, and membership are now synchronized.
**How they connect:** Troubleshoot **source → scope → sync engine/agent → errors → connectivity → Entra → result** instead of changing settings randomly.
