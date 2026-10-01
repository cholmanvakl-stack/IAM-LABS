# Day 2 — Users, Groups & Licensing

### Users
**User** → An identity in Microsoft Entra ID that can authenticate and access resources.
- **Member user** → Internal organizational identity.
- **Guest user** → External identity invited to collaborate.
- Users can be created, modified, disabled, deleted, and restored.
  **How they connect:** Users are the identities that receive access, licenses, and group memberships.

### User Properties
**User properties** → Information used to identify and manage a user.
- Includes name, contact, job, department, and account information.
- **User Principal Name (UPN)** → User's sign-in name.
- User properties can be used in dynamic group membership rules.
  
**How they connect:** User properties describe the identity and can influence automated identity management.

### User Lifecycle
**User lifecycle** → Management of a user from creation through removal.
- **Create** → Create the identity.
- **Modify** → Update the identity or its properties.
- **Disable** → Prevent sign-in while retaining the account.
- **Delete** → Remove the user from the active directory.
- **Restore** → Recover a supported deleted user.
  
**How they connect:** Identity administration requires managing users throughout their lifecycle.

### Licenses
**License** → Provides access to Microsoft services and features.
- Can be assigned directly to users.
- Can be assigned through groups.
- **Group-based licensing** → Assigns licenses to group members.
  
**How they connect:** Licensing determines which services and features users can access.

### Deleted Users
**Deleted user** → A user removed from the active directory but retained temporarily for recovery.
- Deleted users can be restored during the recovery period.
- Permanent deletion removes the user permanently.
  
**How they connect:** Deleted-user management provides a recovery option during the user lifecycle.

### Groups
**Group** → A collection of identities managed together.
- **Security group** → Primarily used for access, permissions, and licensing.
- **Microsoft 365 group** → Primarily used for collaboration.
- Groups can have owners and members.
  
**How they connect:** Groups allow administrators to manage access, licensing, and collaboration for multiple identities as a unit.

### Group Membership
**Group membership** → Determines which identities belong to a group.
- **Assigned membership** → Administrator manually manages members.
- **Dynamic membership** → Membership is automatically determined by rules.
- Membership can affect access and licensing.
  
**How they connect:** Group membership connects users to resources, permissions, and licenses assigned to the group.

### Dynamic Groups
**Dynamic group** → A group whose membership is automatically determined by user or device attributes.
- Uses membership rules.
- Users are automatically added or removed when they meet or stop meeting the rule.
- Reduces manual membership management.
  
**How they connect:** Dynamic groups use identity attributes to automate group membership.

### Group Management
**Group management** → Creating and maintaining groups and their membership.
- Create and configure groups.
- Manage owners and members.
- Configure membership type.
- Manage group-based licensing.
  
**How they connect:** Group management provides a scalable way to manage identities, access, and licensing.
