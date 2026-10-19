# IAM-LABS — SC-300 Study Notes

## Main idea
**Identity and Access Management asks: Who are you? How do we verify you? What can you access? How is access managed over time?**

## Microsoft Learn learning paths
1. [01 — Implement an Identity Management Solution](01-Identity-Management/README.md) — 4 modules
2. [02 — Implement an Authentication and Access Management Solution](02-Authentication-Access-Management/README.md) — 6 modules
3. [03 — Implement Access Management for Apps](03-Application-Access-Management/README.md) — 4 modules
4. [04 — Plan and Implement an Identity Governance Strategy](04-Identity-Governance/README.md) — 4 modules

## Study method
For every topic, learn **what it is → why it exists → how it works → when to use it → how it connects**. Focus on scenario decisions, scope, permissions, and troubleshooting.

## Core mental model
**Tenant → Identity → Attributes → Groups/Roles → Authentication → Authorization → Resource → Audit/Lifecycle**

> This repository currently contains concise learning notes. Labs and PowerShell will be added separately.

## Career-Specific Section — After SC-300

### Main concept
**Turn SC-300 knowledge into demonstrable IAM administration experience, move from Help Desk into an identity-focused role, and choose the next certification based on the job you want—not simply the next exam number.**

**Help Desk → Identity Support / IAM Analyst → Microsoft Entra Administrator → IAM Engineer → IAM Architect or Security Architect**

### The mental model
`SC-900` demonstrates security and identity fundamentals. `SC-300` validates knowledge of implementing and managing Microsoft Entra identity, access, workload identities, and governance. `Hands-on projects` demonstrate that you can apply this knowledge. `IAM job experience` adds production operations, change control, incident response, stakeholder coordination, and business context. `Advanced certifications` should deepen the specialty you actually use at work.

### Which jobs should I apply for?
| Priority | Job titles to search | What to demonstrate |
|---|---|---|
| Apply immediately | IAM Analyst, Identity Access Analyst, Access Management Analyst, Identity Support Specialist | Joiner/mover/leaver tickets, group and role assignments, MFA/SSPR, access reviews, audit evidence |
| Strong transition roles | Microsoft Entra ID Administrator, Junior IAM Administrator, Microsoft 365 Administrator, Cloud Identity Support Engineer | Conditional Access, hybrid identities, enterprise apps, provisioning, troubleshooting |
| Stretch roles | IAM Engineer (Junior), Identity Engineer, PAM Analyst, Identity Governance Analyst | Automation, PIM, app SSO, SCIM, access packages, least privilege, operational runbooks |
| Longer term | Senior IAM Engineer, IAM Architect, Cybersecurity Architect | Identity architecture, Zero Trust design, governance at scale, cross-platform integrations |

Search variants: `IAM`, `Identity and Access Management`, `Identity Governance`, `IGA`, `Entra ID`, `Azure AD`, `SSO`, `Provisioning`, `PAM`, `Access Administration`. Some organizations use different titles for the same work.

### Career roadmap after passing SC-300

#### Phase 1 — First 30 days: make the certification employable
1. Add `Microsoft Certified: Identity and Access Administrator Associate` to your resume and LinkedIn **only after earning it**.
2. Reframe existing Help Desk work accurately around identity tasks you actually perform: account lifecycle, access requests, MFA resets, group membership, account lockouts, escalations, documentation and ticket resolution.
3. Create a concise GitHub portfolio landing page linking to identity labs, PowerShell scripts, troubleshooting runbooks and screenshots. Never publish tenant secrets, tokens, real user data or customer information.
4. Apply to IAM Analyst, Identity Support, Entra Administrator and Microsoft 365 administration roles; do not wait for a second certification.

#### Phase 2 — Days 31–60: prove operational capability
Build and document at least four practical scenarios:
- `Identity lifecycle`: new hire, department transfer and departure with group, licensing and account-disable decisions.
- `Conditional Access`: report-only policy, test identities, sign-in log analysis, exclusions and rollback.
- `Enterprise app SSO`: gallery/non-gallery app, SAML or OIDC trust, user assignment, provisioning and failure investigation.
- `Identity governance`: access package, approval, access review, PIM activation and audit trail.
For each: record the business requirement, least-privilege design, configuration, validation, failure modes and remediation.

#### Phase 3 — Days 61–90: interview and specialize
- Practice explaining `source → scope → policy/engine → logs/errors → connectivity → target/result` when troubleshooting.
- Prepare examples of access request approvals, role scoping, Conditional Access lockout prevention, hybrid synchronization and app consent.
- Apply broadly and track applications, interviews, skill gaps and follow-ups.
- Choose a specialization after seeing which job requirements recur.

### Certifications to pursue afterward
| Certification | Best when your next goal is… | Priority |
|---|---|---|
| `SC-300` — Identity and Access Administrator Associate | Establish Microsoft Entra IAM expertise | **Finish first** |
| `MD-102` — Endpoint Administrator Associate | Transition via endpoint/device administration, Intune, device compliance and Conditional Access | Strong optional bridge |
| `AZ-104` — Azure Administrator Associate | Broaden Azure administration, subscriptions, networking, resources and RBAC | Strong option for cloud IAM |
| `SC-200` — Security Operations Analyst Associate | Move toward SOC, identity threat investigation, Sentinel and Defender | Choose for security operations |
| `SC-401` — Information Security Administrator Associate | Focus on information protection, data security and compliance | Choose for data/security governance |
| `SC-100` — Cybersecurity Architect Expert | Progress toward security architecture **after practical engineering experience** | Long-term target |
| `MS-102` — Microsoft 365 Administrator Expert | Broad Microsoft 365 tenant administration | **Time-sensitive: scheduled retirement November 30, 2026; do not treat as a default long-term next step** |

`SC-300` can satisfy an eligible prerequisite certification for `SC-100`; passing SC-100 and meeting the current prerequisite requirements are needed for the Expert certification. See [Microsoft's current SC-100 requirements](https://learn.microsoft.com/en-us/credentials/certifications/cybersecurity-architect-expert/).

Microsoft has announced [MS-102 / Microsoft 365 Administrator Expert retirement on November 30, 2026](https://learn.microsoft.com/en-us/credentials/certifications/m365-administrator-expert/). Recheck certification availability and replacements before committing study time.

**Recommended default:** `SC-300 → hands-on Entra projects → IAM Analyst / Identity Administrator applications → AZ-104 or MD-102 (based on target jobs) → SC-100 later if architecture becomes the goal.`

### Skills employers will want to see
- `Directory administration`: users, groups, roles, licenses, administrative units, hybrid AD.
- `Authentication and security`: MFA, passwordless, SSPR, Conditional Access, Identity Protection.
- `Application access`: SAML, OIDC/OAuth, app registrations, service principals, consent, SCIM.
- `Governance and privilege`: access reviews, entitlement management, PIM, privileged roles.
- `Automation`: PowerShell, Microsoft Graph/Entra modules, repeatable reports and scripts.
- `Operations`: sign-in/audit/provisioning logs, troubleshooting, ticketing, change management and documentation.

### Portfolio evidence checklist
- [ ] Identity lifecycle automation with screenshots and safe sample data
- [ ] Least-privilege role and administrative-unit design
- [ ] Conditional Access policy with report-only testing and rollback plan
- [ ] SSO application integration with token/claim troubleshooting
- [ ] Entitlement management and access review walkthrough
- [ ] PIM activation and emergency access design
- [ ] PowerShell/Graph scripts with prerequisites, sample output and error handling
- [ ] One incident-style runbook: symptoms → investigation → root cause → fix → verification

### Interview positioning
**Your story:** Experienced Help Desk professional building specialized identity and access management capability through SC-900, SC-300, Microsoft Entra labs, automation and operational troubleshooting.

Do not claim production experience for lab-only tasks. Instead say `Built and validated in a lab` and explain what would change in production (approvals, pilot rollout, monitoring, rollback and audit).

### Certification maintenance
Microsoft role-based certifications generally require annual renewal. Track the renewal window in Microsoft Learn and review current exam objectives before taking or renewing an exam.

Official resources: [SC-300 certification](https://learn.microsoft.com/en-us/credentials/certifications/exams/sc-300/) · [SC-100 certification](https://learn.microsoft.com/en-us/credentials/certifications/cybersecurity-architect-expert/) · [SC-200 certification](https://learn.microsoft.com/en-us/credentials/certifications/security-operations-analyst/) · [MS-102 retirement information](https://learn.microsoft.com/en-us/credentials/certifications/m365-administrator-expert/)
