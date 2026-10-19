# 02 — Plan, Implement, and Manage Access Review

## Main concept
**Regularly verify that existing access is still justified, then retain or remove access according to a documented decision and enforcement process.**

**Select resource → Choose reviewers → Collect decisions → Apply results → Repeat and audit**

## Core knowledge

### Plan access reviews
- `Access review` is a governance process for confirming that users still need access.
- Targets include supported `group membership`, `enterprise application assignments`, `access package assignments` and `privileged roles` through the relevant governance/PIM experiences.
- Choose review `scope`: all users, guests, inactive users or other supported targeting.
- Choose `reviewers`: selected reviewers, managers, group owners or users self-reviewing, where supported.
- `Review recurrence`: one-time, weekly, monthly, quarterly or other supported scheduling choices.
- `Duration`, reminders and notifications help ensure decisions arrive before the review ends.
- Confirm required `licensing` for the reviewer/target and feature before rollout; requirements vary by review type and product.

### Create and configure
1. Choose the access type and resource to review.
2. Set review scope, reviewers and schedule.
3. Choose whether reviewers see recommendations or justification.
4. Set what happens if reviewers do not respond.
5. Decide whether review results are applied automatically or by an administrator.
6. Start the review and validate notifications and reviewer access.

### Review decisions and recommendations
- `Approve`: retain the reviewed access.
- `Deny`: mark access for removal when results are applied.
- `Don't know / Not reviewed`: review outcomes require a defined fallback decision; they are not equivalent to approval.
- `Recommendations` may use inactivity/sign-in or other supported signals to assist reviewers; recommendations are not necessarily automatically enforced.
- `Apply results` is a separate concern from making a decision. Understand the configured automatic-application setting and any limitations of the target resource.
- A review's effect may be limited to the access relationship it evaluates; it does not necessarily revoke other routes to access.

### Automation and monitoring
- `Recurring access reviews` support continuous governance rather than one-time certification.
- `Microsoft Graph identity governance APIs` can create/manage supported reviews and retrieve decisions; permissions and API support must be checked.
- `Access Review Agent` may assist with review analysis/recommendations where available; human oversight and feature availability matter.
- Track completion rate, overdue reviewers, denials, applied changes and review history.
- Retain audit evidence of reviewers, decisions and enforcement.

## Exam decision table
| Scenario | Best concept |
|---|---|
| Quarterly confirmation of guest group membership | Recurring group access review |
| App owner must certify access | Enterprise app access review |
| Reviewer ignores deadline | Default decision for nonresponse |
| Decisions recorded but membership unchanged | Check apply-results setting and status |
| Reduce manual recurring review work | Scheduled reviews, reminders, supported automation |
| Need historical proof | Review decisions/history and audit records |

## Troubleshooting
`Review target → Reviewer scope → Schedule/notification → Decision status → Apply-results configuration → Membership/assignment → Audit history`

## Check understanding
1. How is an access review different from an access package?
2. Why can a Deny decision exist without immediate removal?
3. Which setting determines what happens when a reviewer never responds?

Official module: https://learn.microsoft.com/en-us/training/modules/plan-implement-manage-access-review/
