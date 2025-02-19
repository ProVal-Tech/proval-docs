---
id: '1da4d5e9-4168-4c21-94cf-9b52fc565bf7'
title: 'Group Policy Objects'
title_meta: 'Group Policy Objects'
keywords: ['gpo', 'audit', 'policy', 'trustee', 'linked', 'information', 'output']
description: 'This document provides an overview of a dataview that displays information about Group Policy Objects (GPOs), including their applied policies, linkage locations, and trustees. It also outlines the dependencies required for the dataview to function and details the columns included in the output.'
tags: ['active-directory', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview shows information about GPOs, their applied policies, where they are linked, and to which trustees they are applied. The dataview output comes from a dependent script.

## Dependencies

- [Group Policy Audit](../scripts/group-policy-audit.md)
- [plugin_proval_ad_gpo](<../tables/plugin_proval_ad_gpo.md>)

## Columns

| Column          | Description                                      |
|-----------------|--------------------------------------------------|
| Client          | Client Name                                      |
| Location        | Location Name                                    |
| Source DC       | DC Server Name                                   |
| Domain          | Domain joined detail of DC                       |
| GPO             | Applied GPO policy                               |
| GPO GUID        | GPO GUID information                             |
| Computer Enabled | Indicates if the Computer section of the GPO is enabled. |
| User Enabled     | Indicates if the User section of the GPO is enabled. |
| Created Time    | GPO creation date and time information           |
| Modified Time   | GPO last modified date and time                 |
| Read Time       | GPO last check time                              |
| OU Links        | Created OUs path                                 |




