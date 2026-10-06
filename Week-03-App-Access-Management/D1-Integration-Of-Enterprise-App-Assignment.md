
# Week 3 Day 1 — Plan and Design the Integration of Enterprise Apps for SSO

## Microsoft Learn Alignment

**Module:** Plan and design the integration of enterprise apps for SSO

**Focus:**
- Discover apps with Microsoft Defender for Cloud Apps
- Active Directory Federation Services (AD FS) app report
- Configure application connectors
- Implement access management for apps
- App management roles
- Custom roles for application management
- Preintegrated gallery SaaS applications
- OAuth app policies
- Enterprise application deployment and access control

---

# Goal 1 — SC-300 Exam Preparation

The key concept for this module is:

> **Discover the application → choose the integration method → configure SSO → assign access → enforce controls → monitor the application**

Enterprise application administration is about connecting applications to Microsoft Entra ID while maintaining centralized identity and access control.

---

# Enterprise Applications

**Enterprise application** → A representation of an application in Microsoft Entra ID that allows administrators to manage authentication, access, assignments, and policies.

Enterprise applications can include:

- SaaS applications
- Custom applications
- On-premises applications
- Applications integrated through the gallery
- Applications using federation protocols

An enterprise application can control:

- Who can access the application
- How users authenticate
- Which users/groups are assigned
- Provisioning
- Application roles
- Conditional Access
- SSO

**How they connect:**  
Enterprise applications provide the Microsoft Entra management layer between identities and applications.

---

# Application Discovery

**Application discovery** → Identifying applications being used within the organization so they can be evaluated and managed.

A major problem is **Shadow IT**.

**Shadow IT** → Applications being used by employees without formal IT approval or management.

Example:

```text
Employee
   ↓
Uses SaaS Application
   ↓
IT may not know about it
   ↓
Application Discovery
   ↓
Application identified
   ↓
Security / Access Evaluation
```

**How they connect:**  
Application discovery identifies applications that may need formal identity and access management.

---

# Microsoft Defender for Cloud Apps

**Microsoft Defender for Cloud Apps (MDCA)** → Microsoft security service used to discover, monitor, and control cloud application usage.

One important capability is **Cloud Discovery**.

**Cloud Discovery** → Identifies cloud applications being used in the organization, including applications that may not be officially sanctioned.

Cloud Discovery can help identify:

- Applications
- Usage
- Users
- Risk
- Shadow IT
- Cloud application activity

**How they connect:**  
Defender for Cloud Apps helps discover applications before administrators decide how they should be integrated and governed.

---

# AD FS App Report

**AD FS Application Report** → A report used when evaluating applications that currently depend on Active Directory Federation Services.

Purpose:

> Identify applications using AD FS so they can be evaluated for migration to Microsoft Entra ID.

The report helps administrators understand:

- Which applications depend on AD FS
- Authentication configuration
- Application usage
- Migration opportunities

Example:

```text
AD FS
 ↓
Application Report
 ↓
Identify Applications
 ↓
Evaluate Compatibility
 ↓
Plan Microsoft Entra Integration
 ↓
Migrate
```

**How they connect:**  
The AD FS app report helps organizations discover federation-dependent applications during a move toward Microsoft Entra-based authentication.

---

# Application Integration Methods

When an application is discovered, determine how it should integrate with Microsoft Entra ID.

Common approaches include:

### Gallery Application

Use a Microsoft Entra preintegrated application when Microsoft already provides an integration.

### Non-Gallery Application

Use when the application is not available in the Microsoft Entra application gallery.

### Custom Application

Used when an organization owns or develops the application.

### On-Premises Application

May use Microsoft Entra application proxy or another supported integration method.

### Federation

Applications can use protocols such as:

- SAML
- WS-Federation
- OpenID Connect

**How they connect:**  
The application integration method determines how Microsoft Entra ID communicates with the application for authentication and access.

---

# Application Connectors

**Application connector** → Component that enables Microsoft Entra services to communicate with or provide access to applications in specific integration scenarios.

A major example is **Microsoft Entra application proxy** for on-premises applications.

Architecture:

```text
User
 ↓
Microsoft Entra ID
 ↓
Application Proxy
 ↓
Connector
 ↓
On-Premises Application
```

The connector provides communication from the on-premises environment to the Microsoft Entra service without requiring inbound firewall connections to the internal application.

**How they connect:**  
Application connectors bridge Microsoft Entra services with applications that require connectivity from the organization's network.

---

# Configure Application Connectors

When configuring a connector, administrators need to consider:

- Connector installation
- Connector registration
- Connector group
- Network connectivity
- Application configuration
- High availability
- Connector health

For on-premises applications, connector groups can help organize connectors according to applications or network locations.

Example:

```text
Application
     ↓
Connector Group
     ↓
Connector 1
Connector 2
     ↓
On-Premises Application
```

Multiple connectors can provide redundancy.

**How they connect:**  
Connector configuration establishes the communication path between Microsoft Entra and the target application.

---

# Single Sign-On

**Single sign-on (SSO)** → Allows users to authenticate through Microsoft Entra ID and access an application without separately entering application credentials when the integration supports SSO.

Common enterprise SSO technologies include:

- SAML
- OpenID Connect
- WS-Federation
- Password-based SSO

The exact method depends on the application.

**How they connect:**  
SSO centralizes authentication through Microsoft Entra ID while reducing separate application credentials.

---

# SAML

**SAML** → Federation protocol commonly used for enterprise web application SSO.

Basic flow:

```text
User
 ↓
Application
 ↓
Microsoft Entra ID
 ↓
Authentication
 ↓
SAML Assertion
 ↓
Application
 ↓
Access
```

Important terminology:

**Identity Provider (IdP)**  
→ Microsoft Entra ID.

**Service Provider (SP)**  
→ The application.

**SAML assertion**  
→ Authentication/identity information sent to the application.

**How they connect:**  
Microsoft Entra authenticates the user and sends a SAML assertion that allows the application to establish the user's authenticated session.

---

# Preintegrated Gallery SaaS Applications

**Microsoft Entra application gallery** → Catalog of preintegrated applications.

Gallery applications can provide predefined integration capabilities for supported SaaS applications.

Benefits:

- Faster deployment
- Predefined configuration
- Supported SSO integration
- Easier administration
- Standardized deployment

Typical workflow:

```text
Find Application
 ↓
Add from Gallery
 ↓
Configure
 ↓
Assign Users / Groups
 ↓
Configure SSO
 ↓
Test
 ↓
Deploy
```

**How they connect:**  
Gallery applications reduce the work required to integrate commonly used SaaS applications.

---

# Application Access Management

**Application access management** → Controlling which identities can use an enterprise application.

Access can be managed through:

- Users
- Groups
- Application assignments
- Application roles
- Conditional Access
- User consent
- Administrative consent

Example:

```text
User
 ↓
Group Membership
 ↓
Enterprise Application Assignment
 ↓
Conditional Access
 ↓
Application
```

**How they connect:**  
Application access management determines who can use an application and under what conditions.

---

# Enterprise Application Assignment

**Application assignment** → Explicitly grants a user or group access to an enterprise application.

Example:

```text
IT-Users
    ↓
Microsoft 365 Application
    ↓
Access
```

Assignment provides an important control:

> A user may exist in Microsoft Entra ID without automatically having access to every enterprise application.

**How they connect:**  
Assignments connect identities to applications and provide a controlled application-access boundary.

---

# App Management Roles

**Application management role** → Microsoft Entra role that delegates application administration without giving unnecessary tenant-wide permissions.

Examples include roles designed for:

- Application administration
- Cloud application administration
- Application ownership
- Service principal management

The principle is:

> Give application administrators application-management permissions rather than Global Administrator when possible.

**How they connect:**  
Application management roles delegate application administration while supporting least privilege.

---

# Custom Roles for Application Management

**Custom Microsoft Entra role** → Organization-defined role containing selected permissions.

Custom roles can be used when built-in roles are:

- Too broad
- Too restrictive
- Not aligned with the organization's administrative responsibilities

Example:

```text
Application Administrator
        ↓
Needs:
    Manage Enterprise Apps
        +
    Manage Assignments
        -
    No Tenant-Wide Administration
```

**How they connect:**  
Custom roles allow application administration to follow least-privilege requirements.

---

# OAuth

**OAuth** → Authorization framework that allows applications to obtain delegated or application access to resources without directly handling the user's password.

Example:

```text
User
 ↓
Application
 ↓
OAuth Consent
 ↓
Microsoft Entra ID
 ↓
Access Token
 ↓
Resource
```

OAuth is primarily about **authorization**, not authentication.

**How they connect:**  
OAuth allows an application to receive controlled access to resources through tokens and defined permissions.

---

# OAuth App Policies

**OAuth app policy** → Controls how OAuth applications are allowed to access organizational resources.

Administrators should evaluate:

- Application
- Publisher
- Requested permissions
- User consent
- Administrative consent
- Risk
- Data being accessed

Example:

```text
OAuth Application
       ↓
Requests Permissions
       ↓
Policy Evaluation
       ↓
Allow / Block / Require Admin Consent
```

**How they connect:**  
OAuth policies help prevent applications from obtaining unnecessary or risky access to organizational data.

---

# Consent

**Consent** → Authorization granted for an application to access resources or permissions.

Two important concepts:

### User Consent

A user grants an application requested permissions within the permissions allowed by organizational policy.

### Admin Consent

An administrator grants permissions on behalf of users or the organization.

Example:

```text
Application
 ↓
Requests Permission
 ↓
Consent
 ↓
Access Token
 ↓
Resource Access
```

**How they connect:**  
Consent controls whether an application can receive the permissions it requests.

---

# Enterprise Application Deployment

A controlled deployment should follow:

```text
1. Discover
      ↓
2. Evaluate
      ↓
3. Select Integration Method
      ↓
4. Configure SSO
      ↓
5. Configure Access
      ↓
6. Configure Security Controls
      ↓
7. Test
      ↓
8. Deploy
      ↓
9. Monitor
```

Do not immediately deploy an application simply because it exists in the gallery.

Evaluate:

- Business requirement
- Authentication method
- Permissions
- Users
- Groups
- Application roles
- Conditional Access
- Consent
- Security risk
- Lifecycle

**How they connect:**  
Application deployment combines discovery, integration, authentication, authorization, security, and ongoing management.

---

# Comparison

| Concept | Purpose |
|---|---|
| Enterprise application | Microsoft Entra representation of an application |
| Application discovery | Identify applications being used |
| Defender for Cloud Apps | Discover/monitor/control cloud applications |
| AD FS App Report | Identify applications dependent on AD FS |
| Application connector | Connect Microsoft Entra services to supported applications |
| Gallery application | Preintegrated SaaS application |
| SSO | Centralize authentication |
| SAML | Federation/SSO protocol |
| OAuth | Delegated/application authorization |
| Application assignment | Grant application access |
| App management role | Delegate application administration |
| Custom role | Create precise application permissions |
| Conditional Access | Apply access conditions |
| Consent | Authorize requested application permissions |

---

# SC-300 Scenario Thinking

### Scenario 1 — Find Shadow IT

The security team wants to discover SaaS applications employees are using.

Use:

**Microsoft Defender for Cloud Apps → Cloud Discovery**

---

### Scenario 2 — Find applications using AD FS

The organization wants to migrate from AD FS to Microsoft Entra ID.

Use:

**AD FS Application Report**

Identify applications and evaluate their migration requirements.

---

### Scenario 3 — SaaS application exists in the gallery

A company wants to deploy a supported SaaS application.

Recommended approach:

**Add the preintegrated gallery application**

Then:

- Configure SSO
- Assign users/groups
- Apply Conditional Access if needed
- Test
- Deploy

---

### Scenario 4 — User exists but should not access an application

Configure:

**Enterprise application assignment**

Assign only the required users/groups.

---

### Scenario 5 — Application needs access to organizational data

Evaluate:

- OAuth permissions
- Consent
- Publisher
- Application risk
- Requested scopes

Then apply appropriate OAuth/application policies.

---

### Scenario 6 — Help desk should manage applications

Do not automatically assign:

**Global Administrator**

Instead evaluate:

**Application-specific administrative role or custom role**

Use the least-privileged role that satisfies the job requirements.

---

# Troubleshooting

Use this sequence:

**Discovery → Integration → Connector → Authentication → Assignment → Consent → Conditional Access → Application → Logs → Result**

### 1. Discovery

First determine:

- What application?
- Is it known?
- Is it sanctioned?
- Is it in the gallery?
- Is it using AD FS?
- Is it discovered through Defender for Cloud Apps?

---

### 2. Integration

Determine how the application is integrated.

Examples:

- Gallery
- SAML
- OIDC
- WS-Federation
- Password-based SSO
- Application Proxy

---

### 3. Connector

If a connector is required, verify:

- Connector installed
- Connector registered
- Connector healthy
- Correct connector group
- Network connectivity
- Target application reachable

---

### 4. Authentication

Verify:

- Correct SSO protocol
- Correct configuration
- Correct certificates/signing configuration where applicable
- Redirect/reply URLs where applicable
- Authentication succeeds

---

### 5. Assignment

Check:

- User assignment
- Group assignment
- Application role
- Whether assignment is required for the application

A successful Microsoft Entra sign-in does **not automatically mean the user is assigned to the application**.

---

### 6. Consent

If the application requires OAuth permissions:

- What permissions were requested?
- Has consent been granted?
- Is admin consent required?
- Is user consent allowed by policy?

---

### 7. Conditional Access

Check:

- User/group
- Application
- Device
- Location
- Risk
- Authentication strength
- Grant controls
- Session controls

---

### 8. Application

Verify the application itself:

- Application configuration
- Service provider settings
- Application availability
- User account
- Application roles

---

### 9. Logs

Use available Microsoft Entra/application logs to determine:

- Authentication result
- Application
- User
- Failure reason
- Conditional Access result

---

### 10. Result

Determine exactly where the request failed:

```text
Discovery
   ↓
Integration
   ↓
Authentication
   ↓
Assignment
   ↓
Consent
   ↓
Conditional Access
   ↓
Application
   ↓
Result
```

**How they connect:**  
Enterprise application troubleshooting isolates whether the problem is with discovery, integration, authentication, authorization, consent, policy, or the application itself.

---

# Interview Scenarios

### Question

**How would you deploy a new SaaS application into Microsoft Entra?**

Strong answer:

> I would first determine whether the application is already in the Microsoft Entra gallery. Then I would evaluate the authentication and SSO requirements, configure the integration, assign the appropriate users or groups, apply Conditional Access if required, test with a controlled group, and then deploy more broadly.

---

### Question

**What is the difference between SSO and application assignment?**

Strong answer:

> SSO controls how the user authenticates to the application, while application assignment controls which users or groups are allowed to access the application.

---

### Question

**How would you discover Shadow IT?**

Strong answer:

> I would use Microsoft Defender for Cloud Apps and Cloud Discovery to identify cloud applications being used within the organization and then evaluate their usage, risk, and governance requirements.

---

### Question

**Why use the AD FS application report?**

Strong answer:

> It helps identify applications that depend on AD FS so the organization can evaluate those applications for migration to Microsoft Entra-based authentication.

---

### Question

**Why not give an application administrator Global Administrator?**

Strong answer:

> Global Administrator provides far more permissions than are normally required. I would use the least-privileged built-in application role or a custom role that provides only the permissions required for application administration.

---

### Question

**An application authenticates successfully but the user still cannot access it. What do you check?**

Strong answer:

> I would check application assignment, group membership, application roles, Conditional Access, consent, and the application's own authorization requirements. Authentication proves the identity; it does not automatically prove application authorization.

---

# SC-300 Knowledge Checklist

You should be able to explain:

- [ ] Enterprise applications
- [ ] Application discovery
- [ ] Shadow IT
- [ ] Microsoft Defender for Cloud Apps
- [ ] Cloud Discovery
- [ ] AD FS Application Report
- [ ] Application connectors
- [ ] Application Proxy
- [ ] SSO
- [ ] SAML
- [ ] OIDC
- [ ] WS-Federation
- [ ] Gallery applications
- [ ] Application assignments
- [ ] Application roles
- [ ] App management roles
- [ ] Custom application-management roles
- [ ] OAuth
- [ ] OAuth permissions
- [ ] User consent
- [ ] Admin consent
- [ ] OAuth application policies
- [ ] Conditional Access for applications
- [ ] Enterprise application deployment
- [ ] Application troubleshooting

---

# Interview / Real-World Skill Checklist

You should be able to:

- [ ] Discover cloud applications
- [ ] Identify Shadow IT
- [ ] Analyze AD FS-dependent applications
- [ ] Select an appropriate application integration method
- [ ] Deploy a gallery application
- [ ] Configure SSO
- [ ] Assign users and groups
- [ ] Manage application roles
- [ ] Delegate application administration
- [ ] Create least-privilege custom application roles
- [ ] Evaluate OAuth permissions
- [ ] Manage application consent
- [ ] Apply Conditional Access to applications
- [ ] Troubleshoot SSO
- [ ] Troubleshoot application authorization
- [ ] Troubleshoot connector issues

---

# Real-World Administrator Mindset

Think in this order:

```text
WHAT APPLICATION?
        ↓
HOW IS IT CURRENTLY AUTHENTICATING?
        ↓
HOW SHOULD IT INTEGRATE?
        ↓
WHO SHOULD HAVE ACCESS?
        ↓
WHAT PERMISSIONS DOES IT REQUEST?
        ↓
WHAT SECURITY CONTROLS APPLY?
        ↓
HOW WILL IT BE DEPLOYED?
        ↓
HOW WILL IT BE MONITORED?
```

The important IAM distinction is:

> **Authentication answers "Who are you?"**

> **Assignment and authorization answer "Are you allowed to use this application?"**

> **Conditional Access answers "Under what conditions can you use it?"**

> **OAuth consent answers "What data or permissions can this application access?"**

---

# Master Mental Model

```text
                  APPLICATION
                       │
                       ▼
                DISCOVER / EVALUATE
                       │
          ┌────────────┴────────────┐
          ▼                         ▼
   Defender for Cloud Apps       AD FS Report
          │                         │
          └────────────┬────────────┘
                       ▼
                INTEGRATION METHOD
                       │
          ┌────────────┼────────────┐
          ▼            ▼            ▼
       Gallery       SAML/OIDC    Proxy/Connector
          │            │            │
          └────────────┼────────────┘
                       ▼
                      SSO
                       │
                       ▼
              APPLICATION ASSIGNMENT
                       │
                       ▼
                USERS / GROUPS
                       │
                       ▼
              CONDITIONAL ACCESS
                       │
                       ▼
              OAUTH / CONSENT
                       │
                       ▼
                  APPLICATION
                       │
                       ▼
              LOGGING / MONITORING
```

**Core exam model:**

> **Discover → Integrate → Authenticate → Assign → Authorize → Protect → Monitor**

**SSO** controls authentication.

**Assignment** controls who gets application access.

**Conditional Access** controls the conditions for access.

**OAuth** controls delegated/application permissions.

**Application roles** control application-specific authorization.

**Least privilege** determines who should be allowed to administer the application.
