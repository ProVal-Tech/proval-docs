---
id: '212f7065-e0b6-4333-8ac1-557a4cecb502'
title: 'Patch Report Overview'
title_meta: 'Patch Report Overview - Comprehensive Patching Information'
keywords: ['patching', 'report', 'compliance', 'machine', 'status', 'policy', 'inventory', 'uptime']
description: 'This document provides a detailed overview of a patch report, showcasing essential information for effective patch management, including patch configuration, status, and compliance metrics for various machines.'
tags: ['compliance', 'report']
draft: false
unlisted: false
---

## Summary

This dataview is very descriptive and reflects all the relevant information for patching in just one report, including patch configuration, patch status, and more.

## Columns

| Column                        | Description                                                                                   |
|-------------------------------|-----------------------------------------------------------------------------------------------|
| Client Name                   | Displays the name of the client                                                              |
| Machine Type                  | Displays whether the machine is a server or a workstation                                     |
| Location Name                 | Displays the name of the location                                                             |
| Uptime                        | Displays the uptime of the machine                                                            |
| OS Version                    | Displays the operating system version                                                          |
| Machine Name                  | Displays the name of the machine                                                               |
| OS                            | Displays the name of the operating system                                                     |
| Last Contact                  | Displays the last contact date of the machine                                                 |
| Last Inventory                | Displays the last inventory scan date of the machine                                          |
| WUA Version                   | Displays the WUA version on the machine                                                       |
| Install Policy                | Displays the Microsoft install policy active on the machine                                   |
| Reboot Policy                 | Displays the reboot policy active on the machine                                              |
| # of Approval Policies        | Displays the number of approval policies active on the machine                                 |
| Approval Policy               | Displays the name of the approval policies active                                             |
| Approved Patches              | Displays the number of approved patches for the machine                                       |
| Installed Patches             | Displays the number of installed patches on the machine                                       |
| Missing Patches               | Displays the number of missing patches on the machine                                         |
| Overall Compliance            | Displays the overall patch compliance of the machine                                          |
| Reboot Pending                | Displays whether the machine has a pending reboot                                             |
| Last Patched                  | Displays the last patch date of the machine                                                   |
| Last Scan                     | Displays the last patch scan date of the machine                                              |
| Missing Production Patches     | Displays the number of approved but not installed patches that have been in the Production stage for 3 or more days. |
