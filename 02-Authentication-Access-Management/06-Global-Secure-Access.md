# 06 — Deploy and Configure Microsoft Entra Global Secure Access

## Main concept
**Global Secure Access applies identity-aware Zero Trust controls to network traffic, rather than trusting a connection merely because it comes from a corporate network.**

### What Global Secure Access is
- Microsoft's Security Service Edge (SSE) capabilities integrated with Microsoft Entra.
- Major services: **Microsoft Entra Internet Access** and **Microsoft Entra Private Access**.
- Policy evaluation combines identity, device, network traffic profile, and supported Conditional Access signals.
**How they connect:** User/device traffic → GSA forwarding → identity/policy enforcement → permitted destination.

### Microsoft Entra Internet Access
- Protects outbound access to supported internet/SaaS destinations.
- Can use traffic profiles and identity-aware controls for supported Microsoft 365 and internet traffic.
- Requires correct traffic forwarding, client/network onboarding, policy and licensing.
**How they connect:** Protect users as they access internet resources, not just internal apps.

### Microsoft Entra Private Access
- Provides identity-centric access to private applications/resources without relying solely on broad VPN network trust.
- Uses supported **private network connectors**, application segments, and Quick Access / application configurations.
- Connector placement, DNS, ports/protocols, and internal reachability are essential.
**How they connect:** Authenticated user → policy → private app segment → connector → internal destination.

### Deployment architecture
1. Confirm tenant licensing, roles, prerequisites and supported platform.
2. Enable appropriate traffic forwarding profiles.
3. Deploy Global Secure Access client where needed; configure remote networks for branch/site forwarding when applicable.
4. For private resources, deploy connectors and define app segments.
5. Assign users/groups and configure Conditional Access.
6. Validate actual traffic, policy result, destination reachability, and logs.
**How they connect:** Identity policy only helps if the intended traffic actually traverses the GSA path.

### Dashboard and monitoring
- Review traffic, health, forwarding status, logs, and policy outcomes in the Global Secure Access portal.
- Correlate sign-in logs, network traffic logs, client diagnostics, and connector health.
- Feature-specific logs and retention vary by license and configuration.
**How they connect:** Monitoring reveals whether the client/network sent traffic through enforcement and whether access was granted.

### Remote networks
- Represent branch offices or other supported network sites connected through configured forwarding/tunnels.
- Require compatible edge equipment, tunnel configuration, routing and validation.
- Distinguish remote network forwarding from individual endpoint client forwarding.
**How they connect:** Both methods direct traffic into GSA; they serve different deployment topologies.

### Conditional Access with Global Secure Access
- Use supported network/access signals and policies to enforce appropriate access.
- Evaluate trusted network context, compliant device, user identity, and targeted applications as supported.
- Beware circular dependencies and lockout when applying policies to the very services needed to establish connectivity.
**How they connect:** GSA provides network enforcement and signals; CA provides identity-based access decisions.

### Zero Trust
- **Verify explicitly:** authenticate and assess relevant signals.
- **Use least privilege:** limit users to needed applications/segments.
- **Assume breach:** monitor and constrain lateral movement.
**How they connect:** Network location alone should not be sufficient proof of trust.

## SC-300 exam essentials
- **Internet Access vs Private Access:** outbound internet/SaaS vs private app access.
- **GSA client vs remote networks:** endpoint-based vs site-based forwarding.
- **Private connector vs app segment:** connectivity component vs defined destination.
- **GSA vs traditional VPN:** identity-aware application access vs broad network tunnel model.
- **CA policy vs traffic forwarding:** access decision vs routing traffic to enforcement.

## Troubleshooting
**User/device → Client or remote-network forwarding → Traffic profile → Connector/route → DNS/ports → CA/sign-in policy → Destination → GSA logs**

## Check understanding
1. Why might a correct CA policy have no effect on traffic that bypasses GSA forwarding?
2. Which GSA service fits a private on-premises line-of-business app?
3. When would you configure a remote network instead of deploying clients to each endpoint?

Source: https://learn.microsoft.com/en-us/training/modules/deploy-configure-microsoft-entra-global-secure-access/
