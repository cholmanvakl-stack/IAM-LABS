# Week 4 Day 1 — Plan and Implement Entitlement Management

## Microsoft Learn Alignment

**Module:** Plan and implement entitlement management

### Entitlement Management

**Entitlement management** → Automates access requests, approvals, assignments, reviews, and lifecycle for resources.

**How they connect:** Entitlement management turns repeated access administration into a controlled lifecycle process.

### Access Packages

**Access package** → A bundle of resources that users can request.

Resources can include:

- groups
- applications
- SharePoint sites
- other supported resources

**How they connect:** Access packages provide a standardized access bundle instead of granting resources one at a time.

### Resource Catalogs

**Catalog** → Collection of resources available for entitlement management.

**How they connect:** Catalogs organize resources that can be included in access packages.

### Terms of Use

**Terms of use** → Conditions users may need to accept before receiving access.

**How they connect:** Terms of use add an explicit user acknowledgement step to access governance.

### External User Lifecycle

**External-user lifecycle management** → Controls how guest access is requested, approved, reviewed, and removed.

**How they connect:** Governance extends to external identities instead of treating guests as permanent accounts.

### Connected Organizations

**Connected organization** → Defines an external organization whose users may request access through entitlement management.

**How they connect:** Connected organizations make external collaboration more controlled and repeatable.

### Per-User Entitlements

**Per-user entitlement** → The access rights currently assigned to an individual through governance processes.

**How they connect:** Per-user entitlements show what access a person actually has and why.

## Troubleshooting

**Catalog → Package → Policy → Request → Approval → Assignment → Lifecycle → Result**

Check each stage rather than manually granting access when a request fails.

## Scenario

A contractor needs access to several applications for 90 days.

Use:

**Access package + approval policy + expiration/lifecycle controls**

rather than manually assigning each application.

## Interview Skill

Explain entitlement management as:

> A controlled way to package, request, approve, assign, review, and automatically remove access.
