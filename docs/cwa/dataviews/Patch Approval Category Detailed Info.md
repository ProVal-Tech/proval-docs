---
id: 'cwa-patch-approval-policy-summary'
title: 'Patch Approval Policy Summary'
title_meta: 'Patch Approval Policy Summary'
keywords: ['patches', 'approval', 'policy', 'audit', 'category']
description: 'This document provides detailed information regarding the auto approval, denial, or ignoring of patches based on their category for each approval policy. It includes a summary of the relevant columns and dependencies for understanding the approval process.'
tags: ['approval', 'category', 'policy', 'audit', 'updates', 'upgrades', 'office365']
draft: false
unlisted: false
---
## Summary

Detailed information of the patches that are auto approved or denied or ignored on the basis of the Category for each approval policy.

## Dependencies

[Approval Policy - Auto Approve/Ignore/Deny Audit](https://proval.itglue.com/DOC-5078775-8988669) dataview should be reviewed in order to understand the exact purpose of this one.

## Columns

| Column                     | Description                                                                                                          |
|---------------------------|----------------------------------------------------------------------------------------------------------------------|
| Approval Policy           | Name of the Approval Policy.                                                                                         |
| Category                  | Category of the patch. Like, Updates, Upgrades, Exchange, Office 365, Bing, Drivers, etc.                          |
| Category Approval Status   | The auto policy mentioned in the next column is disabled or enabled. Like Approval is enabled or disabled, deny is enabled or disabled or is ignored or nothing set against that category for that Approval Policy. |
| Auto Policy               | The policy that is applied on that Patch Category for that Approval Policy. Like Approved, Denied or Ignored.       |



