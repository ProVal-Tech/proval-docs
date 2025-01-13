---
id: 'cwa-gpo-audit-dataview'
title: 'GPO Audit Dataview'
title_meta: 'GPO Audit Dataview'
keywords: ['gpo', 'audit', 'policy', 'trustee', 'linked', 'information', 'output']
description: 'This document provides an overview of a dataview that displays information about Group Policy Objects (GPOs), including their applied policies, linkage locations, and trustees. It also outlines the dependencies required for the dataview to function and details the columns included in the output.'
tags: ['active-directory', 'configuration', 'report', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview shows information about GPOs, their applied policies, where they are linked to, and to what trustees they are applied to. The dataview output comes from dependent script.

## Dependencies

- [Start-GPOAudit](https://proval.itglue.com/DOC-5078775-7457846)
- [plugin_proval_ad_gpo](https://proval.itglue.com/DOC-5078775-7948720)
- [RSM - Active Directory - Script - Group Policy - Audit](https://proval.itglue.com/DOC-5078775-15193954)

## Columns

| Column          | Description                                      |
|-----------------|--------------------------------------------------|
| Client          | Client Name                                      |
| Location        | Location Name                                    |
| Source DC       | DC Server Name                                   |
| Domain          | Domain joined detail of DC                       |
| GPO             | Applied GPO policy                               |
| GPO GUID        | GPO GUID information                             |
| ComputerEnabled  | Shows if the Computer section of the GPO is enabled. |
| UserEnabled     | Shows if the User section of the GPO is enabled. |
| Created Time    | GPO created date and time information           |
| Modified Time   | GPO last modified date and time                 |
| Read Time       | GPO last check time                              |
| OU Links        | Created OUs path                                 |




