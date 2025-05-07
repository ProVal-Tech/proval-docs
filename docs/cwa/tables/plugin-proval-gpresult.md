---
id: 'aa42a0b1-19e4-411c-860f-ec05f0d1bf7d'
slug: /aa42a0b1-19e4-411c-860f-ec05f0d1bf7d
title: 'plugin_proval_gpresult'
title_meta: 'plugin_proval_gpresult'
keywords: ['gpresult', 'gpo', 'active-directory', 'management', 'database']
description: 'This document outlines the process of storing GPResult information gathered from the Group Policy. It details the dependencies required for the script, the database table structure, and the significance of each column in the context of Group Policy Objects (GPO).'
tags: ['active-directory', 'database', 'gpo', 'security']
draft: false
unlisted: false
---

## Purpose

Stores GPResult information from the script [EPM - Windows Configuration - Script - Group Policy - Gather GPResult Data](/docs/53bcdcef-8942-4602-bc24-7db1b2cf29ae).

## Dependencies

- [EPM - Windows Configuration - Script - Group Policy - Gather GPResult Data](/docs/53bcdcef-8942-4602-bc24-7db1b2cf29ae)
- [EPM - Windows Configuration - Agnostic - Get-GPResult](/docs/f5d71bf9-29a7-4aa3-a349-0378cb97575a)

## Tables

#### plugin_proval_gpresult

| Column          | Type      | Explanation                                                                                     |
|-----------------|-----------|-------------------------------------------------------------------------------------------------|
| ComputerID      | INT       | The ComputerID of the audited agent.                                                           |
| Type            | VARCHAR   | The type of GPO (User/Computer).                                                                |
| Principal       | VARCHAR   | The [UPN](https://www.codetwo.com/kb/upn/) that the GPO is applied in the context of.         |
| Domain          | VARCHAR   | The AD domain that the GPO is applied from.                                                    |
| SOM             | VARCHAR   | The [scope of management](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-gpod/4b293f38-2e0b-48e6-9df6-ec3fd8c48512) for the GPO. |
| Name            | VARCHAR   | The name of the GPO.                                                                            |
| Enabled         | TINYINT   | Indicates if the GPO is enabled.                                                                |
| IsValid         | TINYINT   | Indicates if the GPO is valid in the current context.                                          |
| AccessDenied    | TINYINT   | Indicates if access was denied to apply the GPO.                                               |
| SecurityFilter   | VARCHAR   | Indicates the security filters that were applied that led to the GPO application.              |
