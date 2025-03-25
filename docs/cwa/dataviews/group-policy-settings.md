---
id: 'ea24f672-d2cd-41bc-8b62-2dcd20085d29'
slug: /ea24f672-d2cd-41bc-8b62-2dcd20085d29
title: 'Group Policy Settings'
title_meta: 'Group Policy Settings'
keywords: ['gpo', 'audit', 'policy', 'settings', 'active-directory']
description: 'This document provides a comprehensive overview of the GPO Audit Dataview, detailing the information about Group Policy Objects (GPOs), their applied policies, and settings. It includes dependencies and a breakdown of the data columns for better understanding and utilization.'
tags: ['active-directory', 'gpo']
draft: false
unlisted: false
---

## Summary

This dataview shows information about GPOs, their applied policies, and settings.

## Dependencies

- [Group Policy Audit](../scripts/group-policy-audit.md)
- [plugin_proval_ad_gp](<../tables/plugin_proval_ad_gp.md>)
- [plugin_proval_ad_gpo](<../tables/plugin_proval_ad_gpo.md>)

## Columns

| Column       | Description                                       |
|--------------|---------------------------------------------------|
| Client       | Client name.                                     |
| Location     | Location name.                                   |
| Source DC    | DC Server Name.                                  |
| Domain       | Domain joined detail of DC.                      |
| GPO          | Applied GPO policy.                              |
| GPO GUID     | GPO GUID information.                            |
| Setting Type | Displays Computer or User settings.              |
| Extension    | Displays GPO extensions.                          |
| Property     | Displays properties of the Group policies.       |
| PropertyData | Displays detailed information for the GPO settings. |


