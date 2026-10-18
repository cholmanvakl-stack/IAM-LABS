# 03 — Implement and Manage External Identities

## Main concept
<span style="color:#58a6ff"><strong>Let people outside your organization collaborate without surrendering control of your resources.</strong></span> External identity authentication and resource authorization are separate responsibilities.

### B2B and guest users
- <span style="color:#58a6ff"><strong>Microsoft Entra B2B collaboration:</strong></span> external users access resources in your tenant using an existing identity or supported alternative authentication.
- <span style="color:#58a6ff"><strong>Home tenant/IdP:</strong></span> generally authenticates the external user.
- <span style="color:#58a6ff"><strong>Resource tenant:</strong></span> represents the user and controls access to its resources.
- <span style="color:#58a6ff"><strong>Guest user object:</strong></span> directory representation of the external person; guest UserType is common, but UserType and authentication source are separate concepts.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> External identity → invitation/redemption → guest representation → policies/groups → resource authorization.

### External collaboration settings
- Control guest invitation permissions, guest directory visibility, and collaboration restrictions.
- <span style="color:#58a6ff"><strong>Allow/block domains:</strong></span> constrain collaboration with selected external domains.
- Tenant-wide external collaboration settings differ from cross-tenant access policies.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Collaboration settings determine general eligibility to invite and manage guests.

### Invitations and redemption
- Invite users individually or in bulk.
- An invitation creates or establishes the external identity relationship; redemption completes the onboarding flow.
- Guest lifecycle includes properties, groups, resource assignments, access review, and eventual removal.
- A guest object existing does <span style="color:#58a6ff"><strong>not</strong></span> prove the guest can access a particular application.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Invitation establishes identity representation; app assignment and policies control effective access.

### External users in Microsoft 365
- External guests may collaborate in Teams, SharePoint, and other supported workloads.
- Each workload may apply additional sharing and authorization controls.
- Successful Entra sign-in can still result in SharePoint/Teams access denied.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Entra establishes identity and authentication; workloads enforce their own access rules too.

### Dynamic guest groups
- Example: `(user.userType -eq "Guest")`.
- Automates membership based on attributes, but does not automatically approve resource access.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> External identity properties → dynamic group → supported group assignments.

### External identity providers
- External authentication can involve another Entra tenant, email one-time passcode, or supported federation/social providers depending on scenario.
- <span style="color:#58a6ff"><strong>SAML / WS-Fed federation:</strong></span> trust an external identity provider for authentication.
- Authentication source and authorization owner may be different organizations.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> IdP authenticates; resource tenant enforces access.

### Cross-tenant access
- <span style="color:#58a6ff"><strong>Inbound:</strong></span> users from another organization access your resources.
- <span style="color:#58a6ff"><strong>Outbound:</strong></span> your users access another organization's resources.
- Configure default settings and organization-specific overrides.
- <span style="color:#58a6ff"><strong>B2B collaboration vs B2B direct connect:</strong></span> guest-based resource collaboration vs supported direct-connect scenarios.
- <span style="color:#58a6ff"><strong>Trust settings:</strong></span> under supported conditions, trust another tenant's MFA/device claims.
- Cross-tenant policies and Conditional Access can both affect the same sign-in.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Cross-tenant policy controls organizational trust; collaboration and resource policies control the rest.

### Microsoft Entra Verified ID
- Uses cryptographically verifiable credentials issued, presented, and verified in supported identity proof scenarios.
- Distinct from creating a guest account or granting application permissions.
<span style="color:#58a6ff"><strong>How they connect:</strong></span> Verified ID proves claims; directory identities and access policies govern resource access.

## Exam essentials
- <span style="color:#58a6ff"><strong>Home vs resource tenant:</strong></span> authentication origin vs resource access governance.
- <span style="color:#58a6ff"><strong>Invitation vs assignment:</strong></span> establishing guest representation vs granting app access.
- <span style="color:#58a6ff"><strong>Inbound vs outbound:</strong></span> direction of cross-organization access.
- <span style="color:#58a6ff"><strong>Cross-tenant trust vs Conditional Access:</strong></span> trusted claims vs enforcement.
- <span style="color:#58a6ff"><strong>Verified ID vs B2B:</strong></span> credential verification vs collaboration identity.

## Troubleshooting
**Guest object → Invitation/redemption → IdP authentication → Collaboration settings → Cross-tenant policy → Conditional Access → Group/app/workload permissions → Sign-in logs**

## Check understanding
1. A guest signs in successfully but cannot open SharePoint. What do you check?
2. Which organization configures inbound access for its own resources?
3. Does trusting external MFA automatically assign the guest to an application?

[Microsoft Learn module](https://learn.microsoft.com/en-us/training/modules/implement-manage-external-identities/)
