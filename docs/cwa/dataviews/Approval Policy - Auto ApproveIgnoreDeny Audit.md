---
id: '1b296878-9915-4c2b-9d2e-f9ee09059cc9'
title: 'Approval Policy - Auto ApproveIgnoreDeny Audit'
title_meta: 'Approval Policy - Auto ApproveIgnoreDeny Audit'
keywords: ['approval', 'policy', 'settings', 'proval', 'filters']
description: 'This document provides an overview of the dataview used to examine the Auto Approve, Auto Ignore, and Auto Deny settings of Approval Policies, detailing the various characteristics and statuses related to patch approvals.'
tags: []
draft: false
unlisted: false
---

## Summary

The dataview can be used to view the Auto Approve, Auto Ignore, and Auto Deny settings of all the Approval Policies.

## Dependencies

[plugin_proval_auto_approval_status](<../views/plugin_proval_auto_approval_status.md>)

## Columns

| Column                                         | Description                                                                                                                                                              |
|------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Examined Characteristics                       | For which characteristics the Approval Policy is being examined? Approved, Denied, or Ignored.                                                                         |
| ID                                             | The ID of the Approval Policy.                                                                                                                                         |
| Approval Policy                                | Name of the Approval Policy.                                                                                                                                           |
| Examined Characteristics - Category Status      | Whether the category filtering is enabled for that examined characteristic. For example, whether approved by category, ignored by category, or denied by category is turned on or not. |
| Examined Characteristics - Categories           | Group_Concat list of the categories that are either approved, denied, or ignored. For detailed information on this, one can refer to the [Patch Approval Category Detailed Info](<./Patch Approval Category Detailed Info.md>) dataview. |
| Examined Characteristics - Severity Status      | Whether the severity filtering is enabled for that examined characteristic. For example, whether approved by severity, ignored by severity, or denied by severity is turned on or not. |
| Unspecified Severity                           | Whether the patches with unspecified severity are approved, ignored, or denied.                                                                                        |
| Low Severity                                   | Whether the patches with low severity are approved, ignored, or denied.                                                                                               |
| Moderate Severity                              | Whether the patches with moderate severity are approved, ignored, or denied.                                                                                          |
| Important Severity                             | Whether the patches with important severity are approved, ignored, or denied.                                                                                         |
| Critical Severity                              | Whether the patches with critical severity are approved, ignored, or denied.                                                                                          |
| Examined Characteristics - Title Status        | Whether the title filtering is enabled for that examined characteristic. For example, whether approved by title, ignored by title, or denied by title is turned on or not. |
| Examined Characteristics - By Titles           | Group_Concat list of the titles that are either approved, denied, or ignored.                                                                                         |
| Examined Characteristics - CVSS Status         | Whether the patches are approved on the basis of CVSS score or not.                                                                                                   |
| Examined Characteristics - CVSS >              | CVSS score above which auto-approval of patches is applied.                                                                                                          |



