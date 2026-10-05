
# Week 2 Day 6 — Deploy and Configure Microsoft Entra Global Secure Access

## Microsoft Learn Alignment

**Module:** Deploy and Configure Microsoft Entra Global Secure Access

**Focus:**
- Global Secure Access
- Microsoft Entra Internet Access
- Microsoft Entra Private Access
- Global Secure Access dashboard
- Remote networks
- Conditional Access with Global Secure Access
- Global Secure Access logging
- Global Secure Access monitoring

---

# Goal 1 — SC-300 Exam Preparation

The key concept for this module is:

> **Global Secure Access connects identity-aware access controls with network traffic.**

Global Secure Access is Microsoft's Security Service Edge (SSE) solution that unifies **Microsoft Entra Internet Access** and **Microsoft Entra Private Access**. It applies Zero Trust principles to access from users and devices to public, Microsoft, and private resources.

---

# Global Secure Access

**Global Secure Access (GSA)** → Microsoft's unified Security Service Edge solution for controlling and securing access to network resources.

It brings together:

- Microsoft Entra Internet Access
- Microsoft Entra Private Access
- Identity
- Network access
- Conditional Access
- Traffic forwarding
- Monitoring and logging

The Global Secure Access experience is managed through the Microsoft Entra admin center.

**How they connect:**  
Global Secure Access combines **identity + network traffic + access policy + monitoring** into one security model.

---

# Microsoft Entra Internet Access

**Microsoft Entra Internet Access** → Provides identity-aware secure access to internet and Microsoft traffic.

It can protect access to:

- Microsoft 365
- Exchange Online
- SharePoint Online
- Other supported internet/SaaS destinations

It operates through traffic-forwarding profiles and can integrate with Conditional Access.

Think:

```text
User
 ↓
Global Secure Access
 ↓
Internet / Microsoft Services
```

**How they connect:**  
Internet Access secures **outbound access to public and Microsoft services** using identity-aware network controls.

---

# Microsoft Entra Private Access

**Microsoft Entra Private Access** → Provides Zero Trust access to private organizational resources.

Examples:

- Internal applications
- Private servers
- File shares
- Private IP addresses
- Internal FQDNs
- Legacy applications

Private Access can provide access without requiring a traditional VPN.

Think:

```text
Remote User
     ↓
Global Secure Access
     ↓
Private Access
     ↓
Private Network
     ↓
Internal Resource
```

**How they connect:**  
Private Access secures **access to private organizational resources**, including resources in hybrid and multicloud environments.

---

# Comparison

| Feature | Internet Access | Private Access |
|---|---|---|
| Primary purpose | Internet/Microsoft access | Private resource access |
| Protects | Public/SaaS/Microsoft traffic | Internal/private resources |
| VPN replacement | No | Yes |
| Conditional Access | Yes | Yes |
| Traffic forwarding | Yes | Yes |
| Private network connector | No | Yes |
| Example | SharePoint Online | Internal application |

### Easy Exam Memory

**Internet Access → Internet**

**Private Access → Private network**

**Global Secure Access → Umbrella**

---

# Global Secure Access Client

**Global Secure Access Client** → Windows client that acquires and forwards supported network traffic through Global Secure Access.

Basic flow:

```text
Windows Device
      ↓
GSA Client
      ↓
Traffic Forwarding Profile
      ↓
Global Secure Access
      ↓
Target Resource
```

The client is used for Microsoft Entra Internet Access and Microsoft Entra Private Access scenarios.

**How they connect:**  
The client acquires traffic from the endpoint and sends applicable traffic through the configured Global Secure Access service.

---

# Traffic Forwarding Profiles

**Traffic forwarding profile** → Determines which types of traffic Global Secure Access acquires and forwards.

Important profiles include:

- Microsoft 365 / Microsoft traffic
- Internet access
- Private access

Microsoft documentation identifies these profiles as the mechanism used to determine which traffic is tunneled through the Global Secure Access service.

**How they connect:**  
Traffic forwarding profiles determine **what traffic enters Global Secure Access**.

---

# Remote Networks

**Remote network** → Represents a network location, such as a branch office, that connects traffic to Global Secure Access.

Example:

```text
Branch Office
     ↓
Remote Network
     ↓
Global Secure Access
     ↓
Microsoft / Internet Resources
```

This allows users at supported network locations to access protected resources without each device necessarily using the Global Secure Access client.

Microsoft's current quickstart specifically demonstrates creating a remote network, applying Conditional Access to the Microsoft traffic profile, and reviewing the resulting logs.

**How they connect:**  
Remote networks extend Global Secure Access protection beyond individual endpoint clients to network locations.

---

# Global Secure Access Dashboard

**Global Secure Access dashboard** → Central location for viewing deployment and traffic information.

The dashboard can provide visibility into:

- Users
- Devices
- Applications
- Traffic
- Microsoft traffic
- Private Access traffic
- Cross-tenant activity
- Deployment insights

Microsoft describes the dashboard as a visualization and summary point for deployment and traffic information.

**How they connect:**  
The dashboard provides the high-level operational view of the Global Secure Access environment.

---

# Conditional Access with Global Secure Access

**Conditional Access + Global Secure Access** → Uses identity and security conditions to control whether network traffic or application access is allowed.

Example:

```text
User
 ↓
Device
 ↓
Conditional Access
 ↓
GSA
 ↓
Private Application
```

Conditional Access can evaluate factors such as:

- User
- Group
- Device
- Location
- Risk
- Compliance
- Application
- Authentication requirements

Microsoft Entra Private Access supports per-app Conditional Access policies, while Internet Access can use Conditional Access to apply identity-aware controls to internet destinations.

**How they connect:**  
Global Secure Access provides the network access path; Conditional Access determines whether that access should be allowed under defined conditions.

---

# Universal Conditional Access

**Universal Conditional Access** → Extends Conditional Access controls to traffic destinations that might not themselves be integrated with Microsoft Entra ID.

This is important because traditional Conditional Access is often thought of as controlling application sign-ins.

Global Secure Access allows identity-aware network traffic to be incorporated into access decisions.

**How they connect:**  
Universal Conditional Access extends identity-based access controls beyond traditional Entra-integrated applications.

---

# Global Secure Access Logging

**Global Secure Access logging** → Records activity and configuration information used for monitoring, auditing, and troubleshooting.

Important log categories include:

### Audit Logs

Record configuration and administrative changes.

Examples:

- Filtering policy changes
- Forwarding profile changes
- Remote network management

### Traffic Logs

Show network connection activity.

Useful information includes:

- User
- Destination
- Source
- Traffic type
- Policy result
- Connection result

### Enriched Microsoft 365 Logs

Provide additional network context around Microsoft 365 activity.

Microsoft currently documents these log categories as part of Global Secure Access monitoring.

**How they connect:**  
Logs provide the evidence needed to understand **what happened, who did it, where traffic went, and what result occurred**.

---

# Global Secure Access Monitoring

**Monitoring** → Continuously evaluating Global Secure Access health, traffic, configuration, and access behavior.

Monitor:

- Traffic volume
- Users
- Devices
- Destinations
- Connection status
- Remote network health
- Connector health
- Policy results
- Configuration changes

Microsoft recommends using dashboards for trend analysis while using alerts and logs for operational detection and troubleshooting.

**How they connect:**  
Monitoring turns Global Secure Access logs and health information into operational visibility.

---

# Zero Trust

**Zero Trust** → Security model based on:

- Verify explicitly
- Use least privilege
- Assume breach

Global Secure Access applies these principles to network access by combining identity, device, network, and policy context.

Example:

```text
User
 +
Device
 +
Location
 +
Risk
 +
Application
        ↓
Conditional Access
        ↓
Access decision
```

**How they connect:**  
Global Secure Access extends Zero Trust principles into network access.

---

# Global Secure Access Architecture

The core architecture:

```text
                 USER / DEVICE
                       │
                       ▼
              Global Secure Access
                       │
          ┌────────────┴────────────┐
          ▼                         ▼
   Internet Access            Private Access
          │                         │
          ▼                         ▼
 Internet / SaaS              Private Network
 Microsoft Services           Internal Apps
          │                         │
          └────────────┬────────────┘
                       ▼
              Conditional Access
                       │
                       ▼
              Logging / Monitoring
```

---

# Scenario Thinking

### Scenario 1 — Remote employee needs internal application access

A remote employee needs access to an internal corporate application without using a traditional VPN.

Use:

**Microsoft Entra Private Access**

Potential architecture:

```text
Remote User
 ↓
GSA Client
 ↓
Private Access
 ↓
Private Network Connector
 ↓
Internal Application
```

Private Access is designed specifically for this VPN-replacement scenario.

---

### Scenario 2 — Protect Microsoft 365 traffic

The organization wants to secure Microsoft 365 traffic from user devices.

Use:

**Microsoft Entra Internet Access / Microsoft traffic profile**

---

### Scenario 3 — Branch office

A branch office needs Global Secure Access connectivity.

Use:

**Remote Network**

---

### Scenario 4 — Require compliant devices

The organization wants only compliant devices to access protected resources.

Use:

**Conditional Access**

---

### Scenario 5 — Investigate blocked traffic

A user reports that an application cannot be reached.

Start with:

**Global Secure Access traffic logs**

Then investigate:

- User
- Destination
- Traffic profile
- Policy
- Connection status
- Result

---

# Troubleshooting

Use this sequence:

**User → Client/Network → Traffic Profile → Conditional Access → Destination → Logs → Result**

### 1. User

Identify:

- Which user?
- Which group?
- Which device?
- Is the user assigned to the relevant application/profile?

---

### 2. Client / Network

Determine whether the traffic is coming through:

- Global Secure Access Client
- Remote Network

Check:

- Client connectivity
- Device configuration
- Remote network health
- Connector health when Private Access is involved

---

### 3. Traffic Profile

Verify the appropriate profile is enabled.

Examples:

- Microsoft traffic
- Internet traffic
- Private access traffic

If the traffic is not being acquired, the problem may be the forwarding configuration.

---

### 4. Conditional Access

Check:

- User/group assignment
- Application/resource
- Conditions
- Grant controls
- Session controls
- Compliant network requirements

Do not assume the network path is the problem before checking Conditional Access.

---

### 5. Destination

Determine what the user is trying to access:

- Microsoft service
- Internet destination
- Private application
- Private IP
- FQDN

---

### 6. Logs

Check Global Secure Access logs.

Look for:

- User
- Source
- Destination
- Traffic type
- Policy
- Connection result

Traffic logs are specifically intended to show network connections and transactions and can be filtered to investigate access behavior.

---

### 7. Result

Determine whether the failure is:

**Acquisition → Policy → Routing → Connector → Destination**

Example:

```text
Client connected
      ↓
Traffic acquired
      ↓
Conditional Access evaluated
      ↓
Traffic forwarded
      ↓
Connector reachable
      ↓
Private resource reachable
```

**How they connect:**  
Troubleshooting isolates whether the failure occurs at the endpoint, traffic-forwarding layer, policy layer, network path, connector, or destination.

---

# Interview Scenarios

### Question

**What is Global Secure Access?**

Strong answer:

> Global Secure Access is Microsoft's Security Service Edge solution that combines Microsoft Entra Internet Access and Microsoft Entra Private Access to provide identity-aware, Zero Trust access to Microsoft, internet, and private resources.

---

### Question

**Internet Access vs Private Access?**

Strong answer:

> Internet Access secures access to internet and Microsoft traffic, while Private Access provides Zero Trust access to private organizational resources and can replace traditional VPN-based access.

---

### Question

**What is a remote network?**

Strong answer:

> A remote network represents a network location, such as a branch office, that can connect traffic to Global Secure Access without requiring every user at that location to use the client individually.

---

### Question

**How does Conditional Access work with Global Secure Access?**

Strong answer:

> Global Secure Access provides the traffic access path while Conditional Access evaluates identity, device, risk, location, and other conditions to determine whether that access should be allowed.

---

### Question

**A user cannot access an internal application through Private Access. What do you check?**

Strong answer:

> I would verify the user and group assignment, Global Secure Access Client or network connectivity, traffic forwarding profile, Private Access application configuration, Conditional Access policies, connector health, and finally the Global Secure Access traffic logs to identify where the request is failing.

---

# SC-300 Knowledge Checklist

You should be able to explain:

- [ ] Global Secure Access
- [ ] Security Service Edge
- [ ] Microsoft Entra Internet Access
- [ ] Microsoft Entra Private Access
- [ ] Global Secure Access Client
- [ ] Traffic forwarding
- [ ] Traffic forwarding profiles
- [ ] Remote networks
- [ ] Private Access connectors
- [ ] Conditional Access with Global Secure Access
- [ ] Universal Conditional Access
- [ ] Global Secure Access dashboard
- [ ] Audit logs
- [ ] Traffic logs
- [ ] Microsoft 365 enriched logs
- [ ] Global Secure Access monitoring
- [ ] Zero Trust
- [ ] Internet Access vs Private Access
- [ ] Global Secure Access troubleshooting

---

# Interview / Real-World Skill Checklist

You should be able to:

- [ ] Explain Global Secure Access to another administrator
- [ ] Identify when Internet Access is appropriate
- [ ] Identify when Private Access is appropriate
- [ ] Explain how GSA can replace traditional VPN access
- [ ] Explain remote networks
- [ ] Understand traffic forwarding profiles
- [ ] Apply Conditional Access to GSA scenarios
- [ ] Read Global Secure Access traffic logs
- [ ] Investigate connection failures
- [ ] Monitor remote network health
- [ ] Explain the relationship between identity and network access
- [ ] Apply Zero Trust principles to network access

---

# Real-World Administrator Mindset

Think in this order:

```text
WHO?
 ↓
WHAT DEVICE / NETWORK?
 ↓
WHAT TRAFFIC?
 ↓
WHAT PROFILE?
 ↓
WHAT POLICY?
 ↓
WHAT DESTINATION?
 ↓
WHAT RESULT?
 ↓
WHAT DO THE LOGS SHOW?
```

Do not troubleshoot Global Secure Access as if it were only a networking problem.

It is an **identity + endpoint + network + policy + monitoring** problem.

---

# Master Mental Model

```text
                    IDENTITY
                       │
                       ▼
                 DEVICE / NETWORK
                       │
                       ▼
              GLOBAL SECURE ACCESS
                       │
          ┌────────────┴────────────┐
          ▼                         ▼
   INTERNET ACCESS            PRIVATE ACCESS
          │                         │
          ▼                         ▼
 Internet / SaaS              Private Apps
 Microsoft Services           Internal Network
          │                         │
          └────────────┬────────────┘
                       ▼
               CONDITIONAL ACCESS
                       │
                       ▼
                ACCESS DECISION
                       │
                       ▼
               LOGGING / MONITORING
```

**Core exam model:**

> **Global Secure Access = identity-aware network access.**

**Internet Access = protect Internet/Microsoft traffic.**

**Private Access = protect private resources.**

**Remote Networks = connect network locations.**

**Conditional Access = determine whether access is allowed.**

**Logs = provide the evidence.**

**Monitoring = determine whether the environment is healthy and operating as expected.**
