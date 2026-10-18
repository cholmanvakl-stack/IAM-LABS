# 02 — Create, Configure, and Manage Identities

## Main concept
`Manage the identity lifecycle and scale access with groups, attributes, and licensing.` Identity is the account; membership and assignments determine what it receives.

### Users and lifecycle
- `User:` directory identity that can authenticate and receive access.
- `Member:` generally internal organizational user; `Guest:` external collaboration identity. UserType does not alone determine every permission.
- `UPN:` sign-in identifier; `object ID:` immutable identifier for the directory object.
- `Create → update → disable → delete → restore/permanently delete` are lifecycle actions.
- `Disable sign-in:` retains object but blocks new sign-ins; existing sessions may need revocation.
- `Soft-deleted users:` generally recoverable for 30 days; permanent deletion is not normally reversible.

`How they connect:` Identity objects persist through lifecycle changes, while permissions and licensing must be managed separately.

### User attributes
- Examples: department, job title, usage location, manager, accountEnabled.
- `Usage location` can affect licensing eligibility.
- `Dynamic group rules` evaluate supported attributes; inaccurate attributes cause wrong membership.
- For hybrid users, the source of authority may be on-premises AD rather than cloud.

`How they connect:` Attributes drive automation, provisioning, and group-based access.

### Groups
- `Security group:` groups principals for access control and licensing.
- `Microsoft 365 group:` collaboration membership across supported Microsoft 365 services.
- `Assigned membership:` admin/owner explicitly manages membership.
- `Dynamic user/device membership:` rules automatically evaluate supported attributes; requires appropriate licensing.
- `Group owner:` manages supported group settings/membership; not equivalent to a tenant administrator.
- `Role-assignable group:` specialized group for Entra role assignments, with additional restrictions and privilege controls.

`How they connect:` Groups reduce per-user administration; membership connects identities to shared assignments.

### Dynamic groups
- Example user rule: `(user.department -eq "IT")`.
- When attributes change, dynamic membership is recalculated asynchronously.
- Understand rule syntax, user vs device membership, processing state, and license requirements.
- Dynamic group membership is not the same as an assigned group with manually added members.

`How they connect:` Identity attributes → membership rule → group membership → downstream access/licensing.

### Licensing
- `Direct assignment:` license assigned to one user.
- `Group-based licensing:` license inherited from a licensing group.
- `Service plans:` individual services within a license SKU can be enabled or disabled where supported.
- License errors can involve no available seats, invalid usage location, conflicting plans, or group assignment processing.
- Removing a direct assignment does not remove a license also inherited from a group.

`How they connect:` Group membership can grant both resource access and product entitlements, but these are different mechanisms.

### Device registration
- `Registered:` typically personal/BYOD identity relationship.
- `Microsoft Entra joined:` organization-owned cloud-joined device scenario.
- `Hybrid joined:` on-prem AD domain joined and registered with Entra.
- Device registration/join state is different from Intune enrollment and device compliance.

`How they connect:` Device identity and state can be used by access policies; registration alone does not guarantee access.

### Custom security attributes
- Administrator-defined key/value attributes for supported identity and authorization scenarios.
- Managed through dedicated permissions and attribute sets; distinct from standard user properties and extension attributes.
- Used for fine-grained classification and supported attribute-based access control scenarios.

`How they connect:` Attributes express identity/resource facts; policy engines use supported attributes for decisions.

### Automatic user creation
- `HR-driven provisioning:` identity lifecycle driven by authoritative HR data.
- `App provisioning:` create/update/deactivate accounts in connected apps.
- `Cross-tenant synchronization:` automate supported B2B user lifecycle between tenants.
- Provisioning depends on mappings, scope, connector permissions, and cycles.

`How they connect:` Source system → attribute mapping → provisioning engine → target identity → ongoing updates.

## Exam essentials
- `Disable vs delete vs restore:` sign-in block vs object removal vs recovery.
- `Security vs Microsoft 365 group:` authorization vs collaboration emphasis.
- `Assigned vs dynamic:` manual membership vs rule-based membership.
- `Direct vs group license:` source of assignment matters.
- `Registered vs joined vs hybrid joined:` different device identity relationships.
- `User creation vs provisioning:` one-time operation vs managed lifecycle.

## Troubleshooting
`Source of authority → User attributes → Membership rule → Group membership → License/service plan → Device state → Target access → Logs`

## Check understanding
1. What happens to a dynamic IT group when a user's department changes to Finance?
2. Why can a user retain a license after direct assignment is removed?
3. What is the difference between Entra registration and Entra join?

[Microsoft Learn module](https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/)
