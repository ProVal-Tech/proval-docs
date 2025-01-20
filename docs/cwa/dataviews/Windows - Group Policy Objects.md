---
id: '1da4d5e9-4168-4c21-94cf-9b52fc565bf7'
title: 'GPO Audit Dataview'
title_meta: 'GPO Audit Dataview'
keywords: ['gpo', 'audit', 'policy', 'trustee', 'linked', 'information', 'output']
description: 'This document provides an overview of a dataview that displays information about Group Policy Objects (GPOs), including their applied policies, linkage locations, and trustees. It also outlines the dependencies required for the dataview to function and details the columns included in the output.'
tags: ['active-directory', 'report', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview shows information about GPOs, their applied policies, where they are linked to, and to what trustees they are applied to. The dataview output comes from dependent script.

## Dependencies

- [Start-GPOAudit](https://proval.itglue.com/DOC-5078775-7457846)
- [plugin_proval_ad_gpo](<../tables/plugin_proval_ad_gpo.md>)
- [RSM - Active Directory - Script - Group Policy - Audit](<../scripts/Group Policy - Audit.md>)

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














