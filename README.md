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

## Career-Specific Section — From IAM into Cybersecurity

### Main concept
**Use Help Desk experience and SC-300 identity knowledge to enter cybersecurity, build shared technical foundations, explore defensive and offensive security, and choose a specialization based on real hands-on experience.**

**Help Desk → IAM Analyst / Identity Administrator → Cybersecurity role → Blue Team, Red Team, or a hybrid specialty**

This is a flexible route, not a required job sequence. You do **not** have to choose Red Team or Blue Team today.

### The mental model
`Identity and Access Management (IAM)` controls identities, authentication, privileges, and access. `Blue Team` protects those systems by monitoring, investigating, hardening, and responding. `Red Team` and `penetration testing` evaluate security through authorized testing; penetration testing and full adversary-emulation red teaming are related but not identical. `Purple Team` brings offensive and defensive practitioners together to test and improve detections and controls. Strong networking, operating systems, scripting, identity, and security fundamentals support all three directions.

### Which jobs should I apply for?
| Stage | Job titles | Why they fit |
|---|---|---|
| Near-term bridge | IAM Analyst, Identity Support Specialist, Access Management Analyst, Junior Entra Administrator | Build security-relevant identity, access, policy, and audit experience |
| Security entry roles | SOC Analyst, Junior Security Analyst, Vulnerability Management Analyst, Security Operations Specialist | Gain investigation, logging, risk, and response experience |
| Engineering options | IAM Engineer, Identity Security Engineer, Junior Security Engineer | Work with controls, automation, hardening, and technical security |
| Offensive possibilities | Junior Penetration Tester, Associate Security Consultant | Pursue after building authorized assessment and reporting skills |
| Long-term options | Detection Engineer, Incident Responder, Threat Hunter, Penetration Tester, Red Team Operator, Security Architect | Specialize after learning which daily work you enjoy |

**Job strategy:** Apply to IAM and junior security roles in parallel. IAM is a useful bridge, not a mandatory prerequisite for security jobs.

### Shared foundation before choosing a team
1. `Networking`: TCP/IP, DNS, HTTP/S, ports, routing, firewalls, and packet analysis.
2. `Windows and Active Directory`: authentication, Kerberos, groups, GPOs, logs, and privilege boundaries.
3. `Linux`: shell, files, processes, permissions, services, and logs.
4. `Scripting`: PowerShell, Python, Bash, APIs, and safe automation.
5. `Cloud identity`: Microsoft Entra, Conditional Access, PIM, app consent, and identity risks.
6. `Security fundamentals`: vulnerabilities, threat models, hardening, incident response, and secure configuration.
7. `Communication`: clear evidence, reproducible findings, risk explanation, remediation, and documentation.

### Explore both paths before deciding

#### Blue Team exploration
- Investigate sample Windows/Entra sign-in events and explain what happened.
- Create a basic detection query in a lab SIEM or log platform.
- Analyze a simulated phishing or account-compromise incident.
- Write an incident timeline, containment plan, and remediation report.

#### Red Team / penetration-testing exploration
- Assess an intentionally vulnerable application in an authorized training environment.
- Study web authentication and authorization flaws through PortSwigger Web Security Academy or OWASP Juice Shop.
- Assess an isolated Active Directory lab for configuration weaknesses and explain the defenses.
- Write a professional assessment report with scope, evidence, impact, and fixes.

#### Purple Team exploration
- Reproduce a harmless simulated security event in a lab.
- Observe what telemetry and alerts are generated.
- Improve the detection or configuration and retest.
- Document what the offensive and defensive views each revealed.

**Safety boundary:** Test only your own lab systems or targets where you have explicit authorization. Never publish real user data, credentials, or tokens.

### Certification roadmap — choose after exploring
| Certification | Focus | Recommendation |
|---|---|---|
| `SC-900` | Security, compliance, and identity fundamentals | Completed |
| `SC-300` | Microsoft identity and access administration | Current priority |
| `CompTIA Security+` | Broad cybersecurity fundamentals | Optional foundation; useful when required by target jobs |
| `AZ-104` | Azure administration and cloud infrastructure | Optional for cloud security or identity engineering |
| `SC-200` | Security operations, threat detection, and response | Consider if Blue Team work appeals |
| `eJPT` | Practical entry-level penetration testing | Consider if offensive assessment appeals |
| `PNPT` | Practical network/Active Directory penetration testing | Consider after offensive-security foundations |
| `OSCP` | Advanced practical penetration-testing skills | Later offensive-security milestone, not an immediate requirement |
| `SC-100` | Cybersecurity architecture | Long-term option for architecture, not a default next step |

**Default:** `SC-300 → IAM/security portfolio → foundational networking, Linux, scripting and logs → try both defensive and offensive labs → select the next certification based on interests and job requirements.`

You do not need to collect all these certifications. Hands-on work, documented projects, and interview readiness matter.

### Career roadmap after SC-300

#### Days 1–30 — Position yourself for cybersecurity
- Update your resume accurately with SC-900, SC-300 **once earned**, and real identity-related Help Desk experience.
- Apply to IAM Analyst, Identity Support, junior Entra and entry-level security jobs.
- Publish a clean IAM lab portfolio and a troubleshooting runbook.
- Begin networking, Linux, and Python fundamentals.

#### Days 31–60 — Try Blue Team and Red Team
- Complete two defensive labs: sign-in investigation and basic detection/response.
- Complete two authorized offensive labs: web app and Windows/AD security assessment.
- Write a short report for each, including what you observed, evidence, risk, and remediation.
- Compare the work you enjoyed: investigating alerts, hardening systems, finding weaknesses, or improving both.

#### Days 61–90 — Choose your next experiment
- Continue IAM/security job applications and interview practice.
- Build one deeper project in whichever area interests you most.
- Decide whether the next study track should be `SC-200` (defensive), `eJPT/PNPT` (offensive), or more cloud/identity engineering.
- Revisit the decision after additional labs or work experience; no need to commit permanently.

### Portfolio evidence checklist
- [ ] Identity lifecycle automation and least-privilege administration
- [ ] Conditional Access test, validation, and rollback runbook
- [ ] Enterprise app SSO and permission review
- [ ] PIM, access review, and governance walkthrough
- [ ] Windows/Entra log investigation with incident timeline
- [ ] Simple detection or alerting lab with documented tuning
- [ ] Authorized web or AD security assessment with remediation report
- [ ] Python/PowerShell automation with safe sample data
- [ ] A comparison note: what I enjoyed in Blue, Red, and Purple Team exercises

### Interview positioning
**Your story:** Experienced Help Desk professional who earned SC-900, is building SC-300 identity expertise, and is transitioning into cybersecurity through identity administration, security operations fundamentals, automation, and hands-on security labs.

Distinguish production experience from lab work. Use `Built and validated in a lab` when appropriate, and explain the controls required in production.

### Certification maintenance
Microsoft role-based certifications generally require annual renewal. Confirm current exam objectives, prerequisites, and availability on official certification pages before scheduling.

Official resources: [SC-300](https://learn.microsoft.com/en-us/credentials/certifications/exams/sc-300/) · [SC-200](https://learn.microsoft.com/en-us/credentials/certifications/security-operations-analyst/) · [SC-100](https://learn.microsoft.com/en-us/credentials/certifications/cybersecurity-architect-expert/) · [PortSwigger Web Security Academy](https://portswigger.net/web-security) · [OWASP Juice Shop](https://owasp.org/www-project-juice-shop/)
