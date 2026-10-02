# Day 3 — External Identities

### Guest Users
**Guest user** → An external identity represented in the Microsoft Entra tenant.
- Used for collaboration with people outside the organization.
- Guest users can be assigned groups, roles, licenses, and resource access.
- **User type: Guest** identifies an external user.
**How they connect:** Guest users provide the identity representation needed for external collaboration.

### B2B Collaboration
**Microsoft Entra B2B collaboration** → Allows external users to access an organization's resources using their own identity.
- External users are represented as guest users in the resource tenant.
- The resource tenant controls the guest's access.
- The external user's home tenant remains the source of their identity.
**How they connect:** B2B connects an external identity to resources in another organization.

### External Collaboration Settings
**External collaboration settings** → Control how the organization manages external B2B collaboration.
- Control who can invite external users.
- Can restrict external collaboration by domain.
- Control guest access to directory information.
**How they connect:** External collaboration settings establish the organization's general rules for guest access.

### External User Invitations
**External user invitation** → Creates an external user relationship in the resource tenant.
- External users can be invited individually or in bulk.
- Invitations establish the guest relationship.
- The invited identity can then access permitted resources.
**How they connect:** Invitations create the guest identity used for B2B collaboration.

### External User Management
**External user management** → Administration of guest identities after they are created.
- Manage properties and account status.
- Manage group membership and resource access.
- Guest accounts can be removed when access is no longer required.
**How they connect:** External user management controls the guest throughout its access lifecycle.

### Dynamic Groups for External Users
**Dynamic group** → Automatically manages membership using user or device attributes.
- Membership is determined by rules.
- `userType` can identify guest users.
- Members are automatically added or removed when they meet or stop meeting the rule.
**How they connect:** Dynamic groups can automate management of external users at scale.

### Microsoft Entra Verified ID
**Microsoft Entra Verified ID** → Uses digitally verifiable credentials to prove information about an identity.
- Credentials can be issued, presented, and verified.
- Uses verifiable digital credentials rather than relying only on directory accounts.
**How they connect:** Verified ID provides a way to verify identity information independently of traditional account-based access.

### External Identity Providers
**External identity provider** → A service that authenticates an external identity.
- Can be configured for external identities.
- **SAML** and **WS-Fed** can be used for federation scenarios.
- The identity provider performs authentication while Microsoft Entra manages access to resources.
**How they connect:** External identity providers connect external authentication to Microsoft Entra access.

### Cross-Tenant Access
**Cross-tenant access** → Controls collaboration between Microsoft Entra organizations.
- **Inbound access** → External users accessing resources in your tenant.
- **Outbound access** → Your users accessing resources in another tenant.
- Can configure organizational-specific access policies.
- Trust settings can allow trust of selected authentication or device claims.
**How they connect:** Cross-tenant access controls how organizations trust and collaborate with each other.

### External Identity Administration
**External identity administration** → Managing how external identities authenticate, collaborate, and access organizational resources.
- B2B provides the collaboration model.
- External collaboration settings establish general
