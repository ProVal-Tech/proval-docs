---
id: '595e85de-299d-4242-a569-f5367be6b1c9'
slug: /595e85de-299d-4242-a569-f5367be6b1c9
title: 'Unapproved Patches Count Audit'
title_meta: 'Unapproved Patches Count Audit'
keywords: ['patches', 'approval', 'policy', 'audit', 'unapproved', 'email', 'proval', 'urgent']
description: ''
tags: [patching, email, database]
draft: false
unlisted: false
---

## Summary  

The script creates an urgent ticket for ProVal if the number of unapproved patches changes by a certain percentage within a day or week. The threshold for this change can be set in the system properties, which are detailed later in this document.

## Sample Run

It is a client script and suggested to run once per day.  
![Image1](<../../../static/img/docs/595e85de-299d-4242-a569-f5367be6b1c9/Image1.png>)

## Variables

| Name                           | Description |
|--------------------------------|-------------|
| patch_denial_daily_threshold_percentage | Threshold in percentage to create a ticket if the difference between today's and yesterday's unapproved patch percentage exceeds this value. Gathered from the `patch_denial_daily_threshold_percentage` property. |
| patch_denial_weekly_threshold_percentage | Threshold in percentage to create a ticket if the difference between today's and last week's unapproved patch percentage exceeds this value. Gathered from the `patch_denial_weekly_threshold_percentage` property. |
| provalAlertsEmail              | ProVal's email address. Gathered from the `ProVal_Alerts_Email_Address` property. |
| currentUnapproved              | Details of the currently unapproved patches. |
| Unapproved                     | Number of currently unapproved patches. |
| Total                          | Total number of patches at the time of collection. |
| UnapprovedPercentage           | Percentage of unapproved patches out of the total number of patches. |
| ActiveApprovalPolicies         | Total number of currently active approval policies. |
| yesterdayUnapproved            | Number of patches that were unapproved yesterday. |
| yesterdayTotal                 | Total number of patches from yesterday. |
| yesterdayUnapprovedPercentage  | Percentage of unapproved patches from yesterday. |
| yesterdayActiveApprovalPolicies| Total number of approval policies that were active yesterday. |
| lastWeekUnapproved             | Number of patches that were unapproved last week. |
| lastWeekTotal                  | Total number of patches from last week. |
| lastWeekUnapprovedPercentage   | Percentage of unapproved patches from last week. |
| lastWeekActiveApprovalPolicies | Total number of approval policies that were active last week. |
| yesterdayIncrementComparision  | Comparison of the increment in unapproved patches percentage from yesterday. |
| yesterdayDecrementComparision  | Comparison of the decrement in unapproved patches percentage from yesterday. |
| weeklyIncrementComparision     | Comparison of the increment in unapproved patches percentage from last week. |
| weeklyDecrementComparision     | Comparison of the decrement in unapproved patches percentage from last week. |
| weeklyTicketGenerated          | A variable used to reset the week after creating a weekly ticket. A weekly ticket will be created as soon as the weekly threshold has been breached instead of waiting for the full 7 days. |

## Properties

| Name | Default | Required | Description |
|------|---------|----------|-------------|
| patch_denial_daily_threshold_percentage |  10  |  True  | Threshold in percentage to create a ticket if the difference between today's and yesterday's unapproved patch percentage exceeds this value. |
| patch_denial_weekly_threshold_percentage | 20  |  True  | Threshold in percentage to create a ticket if the difference between today's and last week's unapproved patch percentage exceeds this value. |
| ProVal_Alerts_Email_Address              |  alerts@provaltech.com  | True | ProVal's email address |

## Script States

| Name                           | Description |
|--------------------------------|-------------|
| yesterdayActiveApprovalPolicies| Total number of approval policies that were active yesterday. |
| yesterdayTotal                 | Total number of patches from yesterday. |
| yesterdayUnapproved            | Number of patches that were unapproved yesterday. |
| yesterdayUnapprovedPercentage  | Percentage of unapproved patches from yesterday. |
| lastWeekActiveApprovalPolicies | Total number of approval policies that were active last week. |
| lastWeekTotal                  | Total number of patches from last week. |
| lastWeekUnapproved             | Number of patches that were unapproved last week. |
| lastWeekUnapprovedPercentage   | Percentage of unapproved patches from last week. |
| lastWeekUpdateDate             | Date of the last week's update. |

**Note:** The script states can not be viewed from any computer as they will not be associated with any agent.

## Output

- Script log
- Email

## Sample AutoTask Ticket

**One day threshold violation:**  
![SampleYesterdayTicket](<../../../static/img/docs/595e85de-299d-4242-a569-f5367be6b1c9/SampleYesterdayTicket.png>)

**Week's threshold violation:**  
![SampleLastWeekTicket](<../../../static/img/docs/595e85de-299d-4242-a569-f5367be6b1c9/SampleLastWeekTicket.png>)

*The numbers shown in the sample tickets are for demonstration purposes only and will be different and more practical in the actual tickets.*