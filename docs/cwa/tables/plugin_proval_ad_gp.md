---
id: 'cwa-group-policy-audit'
title: 'Group Policy Audit Overview'
title_meta: 'Group Policy Audit Overview'
keywords: ['audit', 'gpo', 'group', 'policy', 'configuration']
description: 'This document provides an overview of the Group Policy Audit script, detailing its purpose, dependencies, and the structure of the data it retrieves regarding audited group policies.'
tags: ['configuration', 'audit', 'gpo', 'windows']
draft: false
unlisted: false
---
## Purpose

Displays the list of audited group policies from the script @Group Policy Audit.

## Dependencies

@group Policy Audit  
[Start-GPOAudit](https://proval.itglue.com/DOC-5078775-7457846)  

## Table

#### plugin_proval_ad_gp

| Column       | Type     | Explanation                                                                                   |
|--------------|----------|-----------------------------------------------------------------------------------------------|
| GPOGUID      | VARCHAR  | The GUID of the GPO that contains the group policy.                                          |
| ComputerID   | INT      | The Automate ComputerID of the supplying domain controller.                                   |
| Type         | VARCHAR  | The type of policy (User or Computer)                                                        |
| Extension    | VARCHAR  | The parent extension type of the group policy.                                               |
| Property     | VARCHAR  | The extension property that is being set by the group policy.                                |
| PropertyData | TEXT     | The additional configuration data relating to the target group policy extension property.     |

