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

| Column                          | Description |
|---------------------------------|-------------|
| Hotfix Title                    | The title or name of the patch. May be empty if the patch metadata is unavailable. |
| Hotfix KB                       | The Knowledge Base (KB) ID associated with the patch. May be missing if not provided. |
| Hotfix Category                 | The classification of the patch (e.g., Security, Drivers, Critical Updates). May be blank if not categorized. |
| Hotfix Date Added               | The date when the patch was discovered or recorded in the Automate system. |
| Severity                        | The severity level of the patch (e.g., Critical, Important, Moderate, Low). Displays 'Not Available' if missing. |
| Total Pending                   | The total number of machines where the patch is pending installation. |
| Online Pending                  | The number of online agents where the patch is pending installation. |
| Offline Pending                 | The number of offline agents where the patch is pending installation. |
| Total Pending Servers           | The number of servers where the patch is pending installation. |
| Total Pending Workstations      | The number of workstations where the patch is pending installation. |
| Reboot Pending                  | The total number of machines requiring a reboot after patch installation. |
| Reboot Pending Servers          | The number of servers requiring a reboot after patch installation. |
| Reboot Pending Workstations     | The number of workstations requiring a reboot after patch installation. |


## Changelog

### 2026-05-19

- QA engineer asked to add a reboot pending sections and get rid of the data that are irrelevant and giving false outcome.

### 2026-05-18

- Initial version of the documentation.