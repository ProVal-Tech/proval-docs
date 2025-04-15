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

- [Group Policy Audit](/docs/2e5f5f2b-7c81-4aec-a76a-623a465f959a)
- [plugin_proval_ad_gp](/docs/0e873ec4-0fcc-4131-bf33-1f74f8b28c80)
- [plugin_proval_ad_gpo](/docs/c7cf649a-dd80-4e9d-8c80-eb95b813b7c9)

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


