---
id: 'cwa-gpo-audit-dataview'
title: 'GPO Audit Dataview'
title_meta: 'GPO Audit Dataview - Overview of Group Policy Objects'
keywords: ['gpo', 'audit', 'policy', 'link', 'dc', 'client', 'location', 'enabled', 'enforced', 'computer', 'user', 'created', 'modified', 'read']
description: 'This document provides a comprehensive overview of the GPO Audit Dataview, detailing the information about Group Policy Objects (GPOs), their applied policies, and their linkage within Active Directory environments. It outlines the dependencies required for implementation and describes the columns used to present the data effectively.'
tags: ['active-directory', 'gpo', 'configuration', 'report', 'security', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview shows information about GPOs, their applied policies, and where they are linked to.

## Dependencies

- [Start-GPOAudit](https://proval.itglue.com/DOC-5078775-7457846)
- [plugin_proval_ad_gpo](https://proval.itglue.com/DOC-5078775-7948720)
- [plugin_proval_ad_gpolinks](https://proval.itglue.com/DOC-5078775-7950170)
- [RSM - Active Directory - Script - Group Policy - Audit](https://proval.itglue.com/DOC-5078775-15193954)

## Columns

| Column          | Description                                        |
|-----------------|----------------------------------------------------|
| Client          | Client name.                                      |
| Location        | Location name.                                    |
| Source DC       | DC Server Name.                                   |
| Domain          | Domain joined detail of DC.                       |
| GPO             | Applied GPO policy.                               |
| GPO GUID        | GPO GUID information.                             |
| Link Path       | The complete path of the linked GPO.             |
| Link Enabled    | Displays if the GPO link is enabled (True/False).|
| Enforced        | Displays if the GPO link is enforced (True/False).|
| ComputerEnabled  | Shows if the Computer section of the GPO is enabled. |
| UserEnabled     | Shows if the User section of the GPO is enabled. |
| Created Time    | GPO created date and time information.           |
| Modified Time   | GPO last modified date and time.                 |
| Read Time       | GPO last check time.                              |


