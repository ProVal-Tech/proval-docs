---
id: '0e873ec4-0fcc-4131-bf33-1f74f8b28c80'
title: 'plugin_proval_ad_gp'
title_meta: 'plugin_proval_ad_gp'
keywords: ['audit', 'gpo', 'group', 'policy', 'configuration']
description: 'This document provides an overview of the Group Policy Audit script, detailing its purpose, dependencies, and the structure of the data it retrieves regarding audited group policies.'
tags: ['gpo', 'windows']
draft: false
unlisted: false
---

## Purpose

This document displays the list of audited group policies from the script @Group Policy Audit.

## Dependencies

- [Group Policy Audit](../scripts/group-policy-audit.md)

## Table

#### plugin_proval_ad_gp

| Column       | Type     | Explanation                                                                                   |
|--------------|----------|-----------------------------------------------------------------------------------------------|
| GPOGUID      | VARCHAR  | The GUID of the GPO that contains the group policy.                                          |
| ComputerID   | INT      | The Automate ComputerID of the supplying domain controller.                                   |
| Type         | VARCHAR  | The type of policy (User or Computer).                                                       |
| Extension    | VARCHAR  | The parent extension type of the group policy.                                               |
| Property     | VARCHAR  | The extension property that is being set by the group policy.                                |
| PropertyData | TEXT     | The additional configuration data relating to the target group policy extension property.     |



