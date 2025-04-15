---
id: '337526eb-1aa7-48a3-beab-ab66d2b7aea8'
slug: /337526eb-1aa7-48a3-beab-ab66d2b7aea8
title: 'Group Policy Object Security Filtering'
title_meta: 'Group Policy Object Security Filtering'
keywords: ['active-directory', 'gpo', 'security', 'audit', 'policy']
description: 'This document provides an overview of a dataview that displays information related to Group Policy Objects (GPOs) in Active Directory, focusing on security policies. It outlines dependencies, columns, and details necessary for auditing GPOs effectively.'
tags: ['active-directory', 'gpo', 'security']
draft: false
unlisted: false
---

## Summary

This dataview displays information related to Group Policy Objects in Active Directory, specifically concerning security policies.

## Dependencies

- [Group Policy Audit](/docs/2e5f5f2b-7c81-4aec-a76a-623a465f959a)
- [plugin_proval_ad_gpo](/docs/c7cf649a-dd80-4e9d-8c80-eb95b813b7c9)  
- [plugin_proval_ad_gposf](/docs/8fa8c78e-04a4-4495-8cfe-44aef7b48035)  


## Columns

| Column          | Description                                                                                     |
|-----------------|-------------------------------------------------------------------------------------------------|
| Client          | The name of the client                                                                          |
| Location        | The name of the location                                                                        |
| Source DC       | The name of the domain controller where the group policy is applied                            |
| Domain          | The name of the domain                                                                          |
| GPO             | The name of the Group Policy Object                                                             |
| Trustee         | The name of the user or group that the security filter is applying to                           |
| TrusteeType     | The type of trustee (User, Group, WellKnownGroup, etc.)                                        |
| GPO GUID        | The GUID of the Group Policy Object                                                              |
| ComputerEnabled  | Indicates if the GPO has the Computer policies enabled                                          |
| UserEnabled     | Indicates if the GPO has the user policies enabled.                                            |
| CreatedTime     | The time when the GPO was created                                                                |
| ModifiedTime    | The last time this GPO was modified                                                             |
| ReadTime        | The last time this GPO was read.                                                                |


