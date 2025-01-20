---
id: '337526eb-1aa7-48a3-beab-ab66d2b7aea8'
title: 'Group Policy Audit in Active Directory'
title_meta: 'Group Policy Audit in Active Directory'
keywords: ['active-directory', 'gpo', 'security', 'audit', 'policy']
description: 'This document provides an overview of a dataview that displays information related to Group Policy Objects (GPOs) in Active Directory, focusing on security policies. It outlines dependencies, columns, and details necessary for auditing GPOs effectively.'
tags: ['active-directory', 'gpo', 'security']
draft: false
unlisted: false
---
## Summary

This dataview displays information related to Group Policy Objects in Active Directory, specifically related to security policies.

## Dependencies

**Custom tables**  
- [plugin_proval_ad_gpo](<../tables/plugin_proval_ad_gpo.md>)  
- [plugin_proval_ad_gposf](<../tables/plugin_proval_ad_gposf.md>)  

**Script**  
- [RSM - Active Directory - Script - Group Policy - Audit](<../scripts/Group Policy - Audit.md>)  
- [Start-GPOAudit](https://proval.itglue.com/DOC-5078775-7457846)  

## Columns

| Column         | Description                                                                                     |
|----------------|-------------------------------------------------------------------------------------------------|
| Client         | The name of the client                                                                          |
| Location       | The name of the location                                                                        |
| Source DC      | The name of the domain controller where the group policy is applied                            |
| Domain         | The name of the domain                                                                          |
| GPO            | The name of the Group Policy Object                                                             |
| Trustee        | The name of the user or group that the security filter is applying to                           |
| TrusteeType    | The type of trustee (User, Group, WellKnownGroup, etc.)                                        |
| GPO GUID       | The GUID of the Group Policy Object                                                              |
| ComputerEnabled | Denotes if the GPO has the Computer policies enabled                                           |
| UserEnabled    | Denotes if the GPO has the user policies enabled.                                              |
| CreatedTime    | When the GPO was created                                                                        |
| ModifiedTime   | The last time this GPO was modified                                                             |
| ReadTime       | Last time this GPO was read.                                                                    |














