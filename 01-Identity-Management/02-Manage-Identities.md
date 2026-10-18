# 02 — Create, Configure, and Manage Identities

## Main concept
<span style="color:#58a6ff"><strong>Manage the identity lifecycle and scale access with groups, attributes, and licensing.</strong></span> Identity is the account; membership and assignments determine what it receives.

### Users and lifecycle
- <span style="color:#58a6ff"><strong>User:</strong></span> directory identity that can authenticate and receive access.
- <span style="color:#58a6ff"><strong>Member:</strong></span> generally internal organizational user; <span style="color:#58a6ff"><strong>Guest:</strong></span> external collaboration identity. UserType does not alone determine every permission.
- <span style="color:#58a6ff"><strong>UPN:</strong></span> sign-in identifier; <span style="color:#58a6ff"><strong>object ID:</strong></span> immutable identifier for the directory object.
- **Create → update → disable → delete → restore/permanently delete** are lifecycle actions.
- <span style="color:#58a6ff"><strong>Disable sign-in:</strong></span> retains object but blocks new sign-ins; existing sessions may need revocation.
- <span style="color:#58a6ff"><strong>Soft-deleted users:</strong></span> generally recoverable for 30 days; permanent deletion is not normally reversible.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Identity objects persist through lifecycle changes, while permissions and licensing must be managed separately.

### User attributes
- Examples: department, job title, usage location, manager, accountEnabled.
- <span style="color:#58a6ff"><strong>Usage location</strong></span> can affect licensing eligibility.
- <span style="color:#58a6ff"><strong>Dynamic group rules</strong></span> evaluate supported attributes; inaccurate attributes cause wrong membership.
- For hybrid users, the source of authority may be on-premises AD rather than cloud.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Attributes drive automation, provisioning, and group-based access.

### Groups
- <span style="color:#58a6ff"><strong>Security group:</strong></span> groups principals for access control and licensing.
- <span style="color:#58a6ff"><strong>Microsoft 365 group:</strong></span> collaboration membership across supported Microsoft 365 services.
- <span style="color:#58a6ff"><strong>Assigned membership:</strong></span> admin/owner explicitly manages membership.
- <span style="color:#58a6ff"><strong>Dynamic user/device membership:</strong></span> rules automatically evaluate supported attributes; requires appropriate licensing.
- <span style="color:#58a6ff"><strong>Group owner:</strong></span> manages supported group settings/membership; not equivalent to a tenant administrator.
- <span style="color:#58a6ff"><strong>Role-assignable group:</strong></span> specialized group for Entra role assignments, with additional restrictions and privilege controls.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Groups reduce per-user administration; membership connects identities to shared assignments.

### Dynamic groups
- Example user rule: `(user.department -eq "IT")`.
- When attributes change, dynamic membership is recalculated asynchronously.
- Understand rule syntax, user vs device membership, processing state, and license requirements.
- Dynamic group membership is not the same as an assigned group with manually added members.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Identity attributes → membership rule → group membership → downstream access/licensing.

### Licensing
- <span style="color:#58a6ff"><strong>Direct assignment:</strong></span> license assigned to one user.
- <span style="color:#58a6ff"><strong>Group-based licensing:</strong></span> license inherited from a licensing group.
- <span style="color:#58a6ff"><strong>Service plans:</strong></span> individual services within a license SKU can be enabled or disabled where supported.
- License errors can involve no available seats, invalid usage location, conflicting plans, or group assignment processing.
- Removing a direct assignment does not remove a license also inherited from a group.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Group membership can grant both resource access and product entitlements, but these are different mechanisms.

### Device registration
- <span style="color:#58a6ff"><strong>Registered:</strong></span> typically personal/BYOD identity relationship.
- <span style="color:#58a6ff"><strong>Microsoft Entra joined:</strong></span> organization-owned cloud-joined device scenario.
- <span style="color:#58a6ff"><strong>Hybrid joined:</strong></span> on-prem AD domain joined and registered with Entra.
- Device registration/join state is different from Intune enrollment and device compliance.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Device identity and state can be used by access policies; registration alone does not guarantee access.

### Custom security attributes
- Administrator-defined key/value attributes for supported identity and authorization scenarios.
- Managed through dedicated permissions and attribute sets; distinct from standard user properties and extension attributes.
- Used for fine-grained classification and supported attribute-based access control scenarios.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Attributes express identity/resource facts; policy engines use supported attributes for decisions.

### Automatic user creation
- <span style="color:#58a6ff"><strong>HR-driven provisioning:</strong></span> identity lifecycle driven by authoritative HR data.
- <span style="color:#58a6ff"><strong>App provisioning:</strong></span> create/update/deactivate accounts in connected apps.
- <span style="color:#58a6ff"><strong>Cross-tenant synchronization:</strong></span> automate supported B2B user lifecycle between tenants.
- Provisioning depends on mappings, scope, connector permissions, and cycles.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Source system → attribute mapping → provisioning engine → target identity → ongoing updates.

## Exam essentials
- <span style="color:#58a6ff"><strong>Disable vs delete vs restore:</strong></span> sign-in block vs object removal vs recovery.
- <span style="color:#58a6ff"><strong>Security vs Microsoft 365 group:</strong></span> authorization vs collaboration emphasis.
- <span style="color:#58a6ff"><strong>Assigned vs dynamic:</strong></span> manual membership vs rule-based membership.
- <span style="color:#58a6ff"><strong>Direct vs group license:</strong></span> source of assignment matters.
- <span style="color:#58a6ff"><strong>Registered vs joined vs hybrid joined:</strong></span> different device identity relationships.
- <span style="color:#58a6ff"><strong>User creation vs provisioning:</strong></span> one-time operation vs managed lifecycle.

## Troubleshooting
**Source of authority → User attributes → Membership rule → Group membership → License/service plan → Device state → Target access → Logs**

## Check understanding
1. What happens to a dynamic IT group when a user's department changes to Finance?
2. Why can a user retain a license after direct assignment is removed?
3. What is the difference between Entra registration and Entra join?

[Microsoft Learn module](https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/)
