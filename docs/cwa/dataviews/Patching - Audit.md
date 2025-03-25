---
id: '663fd322-b49a-49b9-aeb8-2bb621c36388'
slug: /663fd322-b49a-49b9-aeb8-2bb621c36388
title: 'Patching - Audit'
title_meta: 'Patching - Audit'
keywords: ['patching', 'report', 'compliance', 'status', 'override', 'policy', 'approval', 'installed', 'missing', 'last', 'agent']
description: 'This document provides a detailed overview of a comprehensive patching report dataview, including essential columns such as patching configuration, patch status, and compliance metrics for effective machine management.'
tags: ['compliance', 'patching', 'report', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This Dataview is very descriptive and reflects all the relevant information for patching in just one report, including patching configuration, patch status, and more.

## Columns

| Column                                 | Description                                                              |
|----------------------------------------|--------------------------------------------------------------------------|
| Client                                 | Displays the name of the client                                          |
| Location                               | Displays the name of the location                                        |
| Agent Name                             | Displays the name of the machine                                         |
| Operating System                       | Displays the name of the operating system on the machine                 |
| Machine Class                          | Displays whether the machine is a laptop, workstation, or server        |
| WUA Version                            | Displays the WUA of the operating system                                 |
| MS Install Policy                      | Displays the Microsoft update policy applied on the machine              |
| MS Install Override Active             | Displays if the patching override is set on the machine                 |
| Third Party Install Policy             | Displays if the third-party install is set on the machine               |
| Third Party Install Override Active     | Displays if the third-party patching override is set on the machine     |
| Reboot Policy                          | Displays the reboot policy active on the machine                         |
| Reboot Override Active                 | Displays if the reboot override is set on the machine                   |
| # of Approval Policies                 | Displays the number of approval policies active on the machine           |
| Approval Policy                        | Displays the name of the approval policies active                       |
| Approved Patches                       | Displays the number of approved patches for the machine                  |
| Installed Patches                      | Displays the number of installed patches on the machine                  |
| Missing Patches                        | Displays the number of missing patches on the machine                    |
| Compliance Percentage                  | Displays the patch compliance percentage for the machine                 |
| Reboot Pending                         | Displays whether the machine has a pending reboot                       |
| Last Patched                           | Displays the last patch date of the machine                              |
| Last Patch Scan                        | Displays the last patch scan date of the machine                         |
| Last Agent Contact                     | Displays the last agent contact of the machine                           |
| Last Agent Inventory                   | Displays the last agent inventory of the machine                         |
| Agent Uptime                           | Displays the uptime of the machines in minutes                           |
| Daytime Patching                       | Displays whether daytime patching is enabled or disabled on the machine  |
| Days Since Last Patched                | Displays the number of days since the last patch was applied            |
| Days Since Last Patch Scan             | Displays the number of days since the last patch scan                   |
| Days Since Last Agent Contact          | Displays the number of days since the last agent contact                |
| Days Since Last Agent Inventory        | Displays the number of days since the last agent inventory              |



