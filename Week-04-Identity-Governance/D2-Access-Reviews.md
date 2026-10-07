# Week 4 Day 2 — Plan, Implement, and Manage Access Reviews

## Microsoft Learn Alignment

**Module:** Plan, implement, and manage access review

### Access Reviews

**Access review** → Periodic review of whether users should continue to have access.

Targets can include:

- groups
- applications
- external users

**How they connect:** Access reviews validate that existing access is still appropriate.

### Review Planning

Plan:

- what access is reviewed
- who reviews it
- review frequency
- review duration
- what happens after a denial

**How they connect:** Planning makes access reviews a governance process instead of a one-time task.

### Group and Application Reviews

Reviewers can determine whether users should retain access to:

- security groups
- Microsoft 365 groups
- enterprise applications

**How they connect:** Reviews identify stale or unnecessary access.

### Programmatic Access Reviews

**Programmatic review** → Uses automation/API capabilities to manage review operations.

Useful for organizations with repeatable governance requirements.

**How they connect:** Automation scales review administration.

### Review Findings

**Review finding** → Result showing whether access should be retained or removed.

**How they connect:** Findings drive remediation.

### Recurring Reviews

**Recurring access review** → Automatically repeats a review on a defined schedule.

**How they connect:** Recurrence turns access validation into continuous governance.

### Access Review Agent

**Access Review Agent** → Microsoft Entra capability supporting access-review workflows and recommendations.

Treat automated recommendations as governance assistance that still requires appropriate administrative oversight.

## Troubleshooting

**Target → Reviewer → Schedule → Findings → Decision → Remediation → Verify**

## Scenario

A guest still has access to a sensitive application six months after completing a project.

Use:

**Recurring access review + guest review + remediation**

## Interview Skill

Explain why access reviews are different from initial provisioning:

> Provisioning answers why access is granted. Access reviews determine whether that access should continue.
