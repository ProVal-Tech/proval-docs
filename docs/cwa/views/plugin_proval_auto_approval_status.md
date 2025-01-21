---
id: 'ae8ce64f-816a-4e84-8052-f8e131dde389'
title: 'plugin_proval_auto_approval_status'
title_meta: 'plugin_proval_auto_approval_status'
keywords: ['approval', 'audit', 'policy', 'dataview', 'mysql']
description: 'This document presents information on auto-approve category details related to approval policies. It is intended for use in creating a dataview called Approval Policy - Auto Approve/Ignore/Deny Audit, and outlines dependencies, views, and characteristics examined in the audit process.'
tags: ['database', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

This document presents auto-approve category information about approval policies. It is being used to create a dataview, [Approval Policy - Auto Approve/Ignore/Deny Audit](<../dataviews/Approval Policy - Auto ApproveIgnoreDeny Audit.md>). 

**Note:** This view cannot be created for clients with MySQL version 5.6 since it contains multiple SELECTs within the FROM section.

## Dependencies

The script, [Create View plugin_proval_auto_approval_status](<../scripts/View - Create (plugin_proval_auto_approval_status).md>), can be used to import this dataview.

## Views

#### plugin_proval_auto_approval_status

| Column                                           | Type     | Explanation                                                                                               |
|--------------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------|
| Examined Characteristics                          | varchar  | The section of the policy being audited. (Approved, Denied, Ignored)                                    |
| ID                                               | int      | The ID of the Approval Policy                                                                              |
| Approval Policy                                  | varchar  | Name of the Approval Policy.                                                                                |
| Examined Characteristics - Category Status       | varchar  | Whether category filtering is enabled for the audited characteristic.                                      |
| Examined Characteristics - Categories            | longtext | List of the categories that are either approved, denied, or ignored. For detailed information on this, refer to the [Patch Approval Category Detailed Info](<../dataviews/Patch Approval Category Detailed Info.md>) dataview documentation. |
| Examined Characteristics - Severity Status       | varchar  | Whether severity filtering is enabled for the audited characteristic.                                      |
| Unspecified Severity                             | varchar  | Whether the patches with unspecified severity are approved, ignored, or denied.                           |
| Low Severity                                    | varchar  | Whether the patches with low severity are approved, ignored, or denied.                                   |
| Moderate Severity                                | varchar  | Whether the patches with moderate severity are approved, ignored, or denied.                              |
| Important Severity                               | varchar  | Whether the patches with important severity are approved, ignored, or denied.                             |
| Critical Severity                                | varchar  | Whether the patches with critical severity are approved, ignored, or denied.                              |
| Examined Characteristics - Title Status         | varchar  | Whether title filtering is enabled for the audited characteristic.                                        |
| Examined Characteristics - By Titles             | text     | List of the titles that are either approved, denied, or ignored.                                          |
| Examined Characteristics - CVSS Status           | varchar  | Whether the patches are approved on the basis of CVSS score or not.                                      |
| Examined Characteristics - CVSS >                | varchar  | CVSS score above which auto-approval of patches is applied.                                              |



