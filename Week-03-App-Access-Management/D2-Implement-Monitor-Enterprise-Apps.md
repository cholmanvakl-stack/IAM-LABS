# Week 3 Day 2 — Implement and Monitor the Integration of Enterprise Apps for SSO

## Microsoft Learn Alignment

**Module:** Implement and monitor the integration of enterprise apps for SSO

### Token Customizations

**Token customization** → Adds selected claims or information to application tokens when supported by the application and token configuration.

- Used when applications require additional identity information.
- Evaluate the application's expected claims before changing token configuration.

**How they connect:** Token configuration affects what identity information an application receives after authentication.

### Application Consent Settings

**Consent settings** → Control whether users can consent to application permissions.

- User consent can be restricted by organization policy.
- Admin consent can be required for sensitive permissions.
- Evaluate publisher, permissions, and risk.

**How they connect:** Consent controls what applications are authorized to access on behalf of users.

### Microsoft Entra Application Proxy

**Application Proxy** → Provides authenticated access to supported on-premises web applications through Microsoft Entra ID.

- Uses Application Proxy connectors.
- Avoids exposing the internal application directly to the internet.
- Can integrate with SSO and Conditional Access.

**How they connect:** Application Proxy connects Microsoft Entra identity controls to on-premises applications.

### Custom SaaS Application SSO

**Custom SaaS SSO** → Configure an application that is not covered by a ready-made gallery integration.

- Determine the supported protocol.
- Configure the identity provider settings.
- Configure the application's service-provider settings.
- Test authentication and claims.

**How they connect:** Custom SSO extends centralized Microsoft Entra authentication to applications without a standard gallery configuration.

### Application-Based User Provisioning

**Application provisioning** → Automatically creates, updates, or removes application accounts based on Microsoft Entra identity information.

- Reduces manual account administration.
- Can synchronize selected users/groups.
- Supports lifecycle management.

**How they connect:** Provisioning automates the application-side identity lifecycle after access is established.

### Monitor and Audit Enterprise Applications

**Application monitoring** → Use Microsoft Entra logs and reports to understand application access.

Review:

- Sign-in activity
- Audit activity
- Provisioning activity
- Users
- Applications
- Failures

**How they connect:** Monitoring provides evidence that application authentication, authorization, and provisioning are working correctly.

### Application Collections

**Application collection** → Organizes enterprise applications for easier presentation and access management.

- Helps group related applications.
- Can improve the user experience through My Apps.

**How they connect:** Collections organize applications without replacing the underlying access assignments.

## Troubleshooting

**Application → SSO → Assignment → Consent → Provisioning → Conditional Access → Logs → Result**

1. Identify the application.
2. Verify SSO configuration.
3. Verify user/group assignment.
4. Check consent and permissions.
5. Check provisioning status and errors.
6. Check Conditional Access.
7. Review sign-in/audit/provisioning logs.
8. Verify the application result.

## Scenario

A user is assigned to an application but cannot sign in.

Check:

- assignment
- SSO configuration
- authentication protocol
- Conditional Access
- consent
- application-side account
- sign-in logs

**Authentication success does not automatically prove application authorization.**

## Interview Skill

Be able to explain how you would deploy, monitor, and troubleshoot an enterprise application from initial configuration through ongoing access auditing.
