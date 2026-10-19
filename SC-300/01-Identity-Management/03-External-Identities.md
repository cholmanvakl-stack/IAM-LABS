# 03 — Implement and Manage External Identities

## Main concept
`Let people outside your organization collaborate without surrendering control of your resources.` External identity authentication and resource authorization are separate responsibilities.

### B2B and guest users
- `Microsoft Entra B2B collaboration:` external users access resources in your tenant using an existing identity or supported alternative authentication.
- `Home tenant/IdP:` generally authenticates the external user.
- `Resource tenant:` represents the user and controls access to its resources.
- `Guest user object:` directory representation of the external person; guest UserType is common, but UserType and authentication source are separate concepts.
`How they connect:` External identity → invitation/redemption → guest representation → policies/groups → resource authorization.

### External collaboration settings
- Control guest invitation permissions, guest directory visibility, and collaboration restrictions.
- `Allow/block domains:` constrain collaboration with selected external domains.
- Tenant-wide external collaboration settings differ from cross-tenant access policies.
`How they connect:` Collaboration settings determine general eligibility to invite and manage guests.

### Invitations and redemption
- Invite users individually or in bulk.
- An invitation creates or establishes the external identity relationship; redemption completes the onboarding flow.
- Guest lifecycle includes properties, groups, resource assignments, access review, and eventual removal.
- A guest object existing does `not` prove the guest can access a particular application.
`How they connect:` Invitation establishes identity representation; app assignment and policies control effective access.

### External users in Microsoft 365
- External guests may collaborate in Teams, SharePoint, and other supported workloads.
- Each workload may apply additional sharing and authorization controls.
- Successful Entra sign-in can still result in SharePoint/Teams access denied.
`How they connect:` Entra establishes identity and authentication; workloads enforce their own access rules too.

### Dynamic guest groups
- Example: `(user.userType -eq "Guest")`.
- Automates membership based on attributes, but does not automatically approve resource access.
`How they connect:` External identity properties → dynamic group → supported group assignments.

### External identity providers
- External authentication can involve another Entra tenant, email one-time passcode, or supported federation/social providers depending on scenario.
- `SAML / WS-Fed federation:` trust an external identity provider for authentication.
- Authentication source and authorization owner may be different organizations.
`How they connect:` IdP authenticates; resource tenant enforces access.

### Cross-tenant access
- `Inbound:` users from another organization access your resources.
- `Outbound:` your users access another organization's resources.
- Configure default settings and organization-specific overrides.
- `B2B collaboration vs B2B direct connect:` guest-based resource collaboration vs supported direct-connect scenarios.
- `Trust settings:` under supported conditions, trust another tenant's MFA/device claims.
- Cross-tenant policies and Conditional Access can both affect the same sign-in.
`How they connect:` Cross-tenant policy controls organizational trust; collaboration and resource policies control the rest.

### Microsoft Entra Verified ID
- Uses cryptographically verifiable credentials issued, presented, and verified in supported identity proof scenarios.
- Distinct from creating a guest account or granting application permissions.
`How they connect:` Verified ID proves claims; directory identities and access policies govern resource access.

## Exam essentials
- `Home vs resource tenant:` authentication origin vs resource access governance.
- `Invitation vs assignment:` establishing guest representation vs granting app access.
- `Inbound vs outbound:` direction of cross-organization access.
- `Cross-tenant trust vs Conditional Access:` trusted claims vs enforcement.
- `Verified ID vs B2B:` credential verification vs collaboration identity.

## Troubleshooting
`Guest object → Invitation/redemption → IdP authentication → Collaboration settings → Cross-tenant policy → Conditional Access → Group/app/workload permissions → Sign-in logs`

## Check understanding
1. A guest signs in successfully but cannot open SharePoint. What do you check?
2. Which organization configures inbound access for its own resources?
3. Does trusting external MFA automatically assign the guest to an application?

[Microsoft Learn module](https://learn.microsoft.com/en-us/training/modules/implement-manage-external-identities/)
