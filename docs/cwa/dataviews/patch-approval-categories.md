---
id: '43b35510-f264-429f-a06e-e0ea7822cfc1'
title: 'Patch Approval Categories'
title_meta: 'Patch Approval Categories'
keywords: ['patches', 'approval', 'policy', 'audit', 'category']
description: 'This document provides detailed information regarding the auto-approval, denial, or ignoring of patches based on their category for each approval policy. It includes a summary of the relevant columns and dependencies for understanding the approval process.'
tags: ['patching', 'database']
draft: false
unlisted: false
---

## Summary

This dataview provides detailed information about the patches that are auto-approved, denied, or ignored based on their category for each approval policy.

## Dependencies

The [Auto Approval Policies](<./auto-approval-policies.md>) dataview should be reviewed to understand the exact purpose of this document.

## Columns

| Column                     | Description                                                                                                          |
|---------------------------|----------------------------------------------------------------------------------------------------------------------|
| Approval Policy           | Name of the Approval Policy.                                                                                         |
| Category                  | Category of the patch, such as Updates, Upgrades, Exchange, Office 365, Bing, Drivers, etc.                       |
| Category Approval Status   | Indicates whether the auto policy mentioned in the next column is disabled or enabled. This includes whether approval is enabled or disabled, denial is enabled or disabled, or if it is ignored, or if nothing is set against that category for that Approval Policy. |
| Auto Policy               | The policy applied to that Patch Category for that Approval Policy, such as Approved, Denied, or Ignored.          |
