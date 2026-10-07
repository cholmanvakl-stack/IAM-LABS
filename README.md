# IAM-LABS

Microsoft Entra ID / Identity and Access Administrator (SC-300) learning, labs, PowerShell automation, troubleshooting, and portfolio documentation.

## Project Goal

Build practical Microsoft Entra administration skills for:
- SC-300 exam preparation
- IAM administrator interviews
- real-world identity operations
- an employer-facing GitHub portfolio

## Build Model

**Microsoft Learn evaluation → learning material → concise exam notes → hands-on lab → evidence → PowerShell/Graph → troubleshooting → interview practice → documentation**

## Roadmap

| Week | Microsoft Learn path | Days |
|---|---|---:|
| 1 | Implement an identity management solution using Microsoft Entra ID | 4 |
| 2 | Implement an authentication and access management solution | 6 |
| 3 | Implement access management for apps | 4 |
| 4 | Plan and implement an identity governance strategy | 4 |

Each day contains:
- a learning document
- a dedicated lab
- evidence/screenshot placeholders
- validation criteria
- staged troubleshooting

## Repository Structure

```text
IAM-LABS/
├── Week-01-Identity-Management/
│   ├── D1...D4 learning
│   └── Labs/
├── Week-02-Authentication-&-Access-Management/
│   ├── D1...D6 learning
│   └── Labs/
├── Week-03-App-Access-Management/
│   ├── D1...D4 learning
│   └── Labs/
├── Week-04-Identity-Governance/
│   ├── D1...D4 learning
│   └── Labs/
└── PowerShell/
    ├── 00-Setup/
    ├── 01-Identity-Administration/
    ├── 02-External-Identities/
    ├── 03-Authentication-Access/
    ├── 04-Applications/
    ├── 05-Governance/
    └── 06-Hybrid-Identity/
```

## PowerShell Strategy

PowerShell is the automation layer for the lab:
- Microsoft Graph SDK
- Microsoft Entra PowerShell
- read-only reporting first
- parameterized administrative actions
- least-privilege permissions
- repeatable identity operations
- troubleshooting/reporting scripts

Never commit credentials, secrets, access tokens, or certificates.

## Evidence Strategy

Labs contain placeholders for screenshots and validation evidence. Screenshots can be added during the actual lab pass without changing the learning architecture.

Use evidence to show:
1. configuration
2. action
3. resulting state
4. logs/verification
5. troubleshooting when something fails

## Troubleshooting Model

Default:

**Identity → Scope → Policy/Role → Configuration → Logs → Resource/Application → Result**

Process-specific models expand this sequence when required, for example:

**Source → Scope → Engine/Agent → Errors → Connectivity → Result**

## Portfolio Outcome

The completed repository should demonstrate that the administrator can understand, configure, automate, troubleshoot, and explain Microsoft Entra identity and access controls rather than only memorize exam terminology.

## Current Status

The learning backbone, day-level labs, and initial PowerShell automation framework are built. Screenshots and tenant-specific evidence are intentionally left for the hands-on execution pass.
