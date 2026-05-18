---
id: '8baa6eac-f4b6-45c1-a060-971d30c1b249'
slug: /8baa6eac-f4b6-45c1-a060-971d30c1b249
title: 'Missing Patches Agent Count'
title_meta: 'Missing Patches Agent Count'
keywords: ['patching', 'report', 'compliance', 'status', 'approval', 'installed', 'missing']
description: 'This dataview shows the missing patches count on total machines, in which it shows the count for online and offline machines separately, where the patches were missing.'
tags: ['compliance', 'patching', 'report', 'security', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-18
---

## Summary

This dataview shows the missing patches count on total machines, in which it shows the count for online and offline machines separately, where the patches were missing.


## Columns

| Column | Description |
| ------ | ----------- |
| Hotfix Title | The title or name of the patch. May be empty if the patch metadata is unavailable. |
| Hotfix KB | The Knowledge Base (KB) ID associated with the patch. May be missing if not provided. |
| Hotfix Category | The classification of the patch (e.g., Security, Drivers, Critical Updates). May be blank if not categorized. |
| Hotfix Date Added | The date when the patch was discovered or recorded in the Automate system. |
| Hotfix Approved | Indicates whether the patch is approved for deployment. |
| Hotfix Installed | Indicates the installation status of the patch (e.g., Installed, Failed, Not Attempted). |
| Severity | The severity level of the patch (e.g., Critical, Important, Moderate, Low). |
| CVSS Score | The CVSS (Common Vulnerability Scoring System) score assigned to the patch by Microsoft or relevant sources. |
| Hotfix Uninstallable | Indicates whether the patch can be uninstalled (`1` = Yes, `0` = No). |
| Total Pending | The total number of machines where the patch is pending installation. |
| Online Pending | The number of online agents where the patch is pending installation. |
| Offline Pending | The number of offline agents where the patch is pending installation. |

## Changelog

### 2026-05-18

- Initial version of the documentation.