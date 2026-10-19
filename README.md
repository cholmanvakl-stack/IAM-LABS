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

## Career-Specific Section — From IAM to Cybersecurity and Penetration Testing

### Main concept
**Use SC-300 and practical IAM experience as a bridge from Help Desk into cybersecurity, then build the technical skills and authorized testing portfolio needed for penetration testing.**

**Help Desk → IAM Analyst / Identity Administrator → Cybersecurity Analyst or Security Engineer → Junior Penetration Tester → Penetration Tester / Red Team Operator**

This is a suggested route, not a mandatory sequence. Direct transitions into junior security testing roles are possible with sufficient practical evidence; a SOC role is not required.

### The mental model
`SC-900` demonstrates security and identity fundamentals. `SC-300` validates knowledge of implementing and managing Microsoft Entra identity, access, workload identities, and governance. `Hands-on projects` demonstrate that you can apply this knowledge. `IAM job experience` adds production operations, change control, incident response, stakeholder coordination, and business context. `Advanced certifications` should deepen the specialty you actually use at work.

### Which jobs should I apply for?
| Priority | Job titles to search | What to demonstrate |
|---|---|---|
| Apply immediately | IAM Analyst, Identity Access Analyst, Access Management Analyst, Identity Support Specialist | Joiner/mover/leaver tickets, group and role assignments, MFA/SSPR, access reviews, audit evidence |
| Strong transition roles | Microsoft Entra ID Administrator, Junior IAM Administrator, Microsoft 365 Administrator, Cloud Identity Support Engineer | Conditional Access, hybrid identities, enterprise apps, provisioning, troubleshooting |
| Stretch roles | IAM Engineer (Junior), Identity Engineer, PAM Analyst, Identity Governance Analyst | Automation, PIM, app SSO, SCIM, access packages, least privilege, operational runbooks |
| Cybersecurity bridge | Security Analyst, SOC Analyst, Vulnerability Management Analyst, Junior Security Engineer | Alert investigation, vulnerability validation, detection, Windows/Linux, network analysis |
| Offensive security goal | Junior Penetration Tester, Associate Security Consultant, Web Application Security Tester | Authorized assessments, clear reports, web testing, AD security, scripting |

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

### Transition from IAM into penetration testing

**Why IAM is useful:** Penetration testers regularly assess authentication, authorization, identity misconfiguration, privilege escalation paths, Active Directory and cloud identity exposure. Understanding how these systems should be secured makes it easier to assess them responsibly.

#### Offensive security foundations
1. `Networking`: TCP/IP, DNS, HTTP/S, routing, VPNs, firewalls, and packet analysis.
2. `Operating systems`: Windows internals, Active Directory, Linux administration, permissions and logging.
3. `Scripting`: Python, PowerShell and Bash for automation and analysis.
4. `Web security`: OWASP Top 10, authentication/session design, authorization flaws and API security.
5. `Assessment process`: scoping and written authorization, discovery, validation, evidence collection, risk explanation, remediation and retesting.
6. `Reporting`: concise executive summaries, reproducible technical findings and prioritized fixes.

#### Build a legal testing portfolio
- [ ] Set up an isolated lab with intentionally vulnerable targets and documented authorization boundaries.
- [ ] Document an Active Directory security assessment lab, focusing on misconfigurations and remediations.
- [ ] Complete a web application assessment using legal training targets such as PortSwigger Web Security Academy or OWASP Juice Shop.
- [ ] Complete a cloud identity configuration review lab with least-privilege recommendations.
- [ ] Publish sanitized assessment reports: scope, methodology, evidence, impact, remediation and retest results.
- [ ] Show defensive context: detection opportunities, audit logs and how administrators prevent the issue.

**Important:** Only test systems you own or have explicit authorization to assess. Never publish real credentials, tokens, private data or operational secrets.

### Certifications to pursue afterward

| Certification | Why it fits | When to consider it |
|---|---|---|
| `SC-300` — Identity and Access Administrator Associate | Strong IAM and Microsoft Entra foundation | Finish first |
| `CompTIA Security+` | Broad security vocabulary and foundational security knowledge | Optional; useful if security fundamentals or job postings warrant it |
| `CompTIA Network+` | Structured networking fundamentals | Optional; learn the material even if you skip the exam |
| `eJPT` — Junior Penetration Tester | Hands-on entry-level penetration testing workflow | Good first practical offensive-security milestone |
| `CompTIA PenTest+` | Penetration-testing methodology and concepts | Alternative or complement depending on employer requirements |
| `PNPT` — Practical Network Penetration Tester | Practical internal network/AD-oriented assessment and reporting | After networking, Windows/AD and basic offensive labs |
| `OSCP` — OffSec Certified Professional | Recognized hands-on penetration-testing credential | Later, after substantial lab practice and methodology |
| `AZ-104` — Azure Administrator Associate | Cloud infrastructure knowledge supporting cloud security assessments | Optional if cloud/Entra-focused roles dominate |
| `SC-200` — Security Operations Analyst Associate | Detection and incident-response knowledge | Optional if taking a SOC/blue-team bridge role |
| `SC-100` — Cybersecurity Architect Expert | Security architecture rather than direct penetration testing | Only if your long-term goals expand toward architecture |

**Suggested certification order:** `SC-300 → practical networking/Linux/Windows/web security → eJPT or PNPT → OSCP when ready`. Do not collect every certificate; choose based on skill gaps, cost, and real job requirements.

### Practical 90-day pivot after SC-300
- `Days 1–30`: Keep applying to IAM jobs; study TCP/IP, HTTP, Linux and Python; set up a legal isolated lab.
- `Days 31–60`: Learn web security fundamentals, Windows/AD attack surfaces and defensive mitigations; complete guided labs.
- `Days 61–90`: Write two polished assessment reports, practice communicating findings, and assess readiness for eJPT/PNPT-style training.

**Job search strategy:** Apply to IAM and entry-level security roles in parallel. Start targeting junior pentesting positions once you can demonstrate structured assessments and reporting, not merely tool familiarity.

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
**Your story:** Experienced Help Desk professional using Microsoft identity administration and SC-300 to transition into cybersecurity, while building a legal hands-on portfolio in Windows/Active Directory, web security, cloud identity and penetration-testing methodology.

Do not claim production experience for lab-only tasks. Instead say `Built and validated in a lab` and explain what would change in production (approvals, pilot rollout, monitoring, rollback and audit).

### Certification maintenance
Microsoft role-based certifications generally require annual renewal. Track the renewal window in Microsoft Learn and review current exam objectives before taking or renewing an exam.

Official resources: [SC-300 certification](https://learn.microsoft.com/en-us/credentials/certifications/exams/sc-300/) · [SC-100 certification](https://learn.microsoft.com/en-us/credentials/certifications/cybersecurity-architect-expert/) · [SC-200 certification](https://learn.microsoft.com/en-us/credentials/certifications/security-operations-analyst/) · [MS-102 retirement information](https://learn.microsoft.com/en-us/credentials/certifications/m365-administrator-expert/)
