---
id: 'c7cf649a-dd80-4e9d-8c80-eb95b813b7c9'
slug: /c7cf649a-dd80-4e9d-8c80-eb95b813b7c9
title: 'plugin_proval_ad_gpo'
title_meta: 'plugin_proval_ad_gpo'
keywords: ['group', 'policy', 'audit', 'active', 'directory']
description: 'This document provides an overview of the audited group policy objects retrieved from the Group Policy Audit script, detailing their attributes and dependencies for effective management and reporting in Active Directory environments.'
tags: ['active-directory', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This document displays the list of audited group policy objects from the script @Group Policy Audit.

## Dependencies

- [Group Policy Audit](../scripts/group-policy-audit.md)

## Table

#### plugin_proval_ad_gpo

| Column           | Type      | Explanation                                                       |
|------------------|-----------|-------------------------------------------------------------------|
| GUID             | VARCHAR   | The GUID of the GPO.                                             |
| ComputerID       | INT       | The Automate ComputerID of the supplying domain controller.      |
| Name             | VARCHAR   | The name of the GPO.                                            |
| Domain           | VARCHAR   | The domain that the GPO is under.                               |
| ComputerEnabled   | TINYINT   | Denotes if the GPO has the Computer policies enabled.           |
| UserEnabled       | TINYINT   | Denotes if the GPO has the User policies enabled.               |
| CreatedTime       | DATETIME  | When the GPO was created.                                       |
| ModifiedTime      | DATETIME  | Last time this GPO was modified.                                |
| ReadTime          | DATETIME  | Last time this GPO was read.                                    |
| LinksTo           | TEXT      | Comma-separated list of OUs that this GPO links to.            |


