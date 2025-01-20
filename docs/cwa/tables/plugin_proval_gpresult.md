---
id: 'aa42a0b1-19e4-411c-860f-ec05f0d1bf7d'
title: 'GPResult Data Storage'
title_meta: 'GPResult Data Storage'
keywords: ['gpresult', 'gpo', 'active-directory', 'management', 'database']
description: 'This document outlines the process of storing GPResult information gathered from the Group Policy. It details the dependencies required for the script, the database table structure, and the significance of each column in the context of Group Policy Objects (GPO).'
tags: ['active-directory', 'database', 'gpo', 'security']
draft: false
unlisted: false
---
## Purpose

Stores gpresult information from the script [EPM - Windows Configuration - Script - Group Policy - Gather GPResult Data](<../scripts/Group Policy - Gather GPResult Data.md>)

## Dependencies

- [EPM - Windows Configuration - Script - Group Policy - Gather GPResult Data](<../scripts/Group Policy - Gather GPResult Data.md>)
- [EPM - Windows Configuration - Agnostic - Get-GPResult](<../../powershell/Get-GPResult.md>)

## Tables

#### plugin_proval_gpresult

| Column        | Type      | Explanation                                                                                     |
|---------------|-----------|-------------------------------------------------------------------------------------------------|
| ComputerID    | INT       | The ComputerID of the audited agent.                                                           |
| Type          | VARCHAR   | The type of GPO (User/Computer)                                                                |
| Principal     | VARCHAR   | The [UPN](https://www.codetwo.com/kb/upn/) that the GPO is applied in the context of.         |
| Domain        | VARCHAR   | The AD domain that the GPO is applied from.                                                    |
| SOM           | VARCHAR   | The [scope of management](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-gpod/4b293f38-2e0b-48e6-9df6-ec3fd8c48512) for the GPO. |
| Name          | VARCHAR   | The name of the GPO.                                                                            |
| Enabled       | TINYINT   | Shows if the GPO is enabled.                                                                    |
| IsValid       | TINYINT   | Shows if the GPO is valid in the current context.                                              |
| AccessDenied   | TINYINT   | Shows if access was denied to apply the GPO.                                                   |
| SecurityFilter | VARCHAR   | Shows the security filters that were applied that led to the GPO application.                  |













