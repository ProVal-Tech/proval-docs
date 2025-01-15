---
id: '663fd322-b49a-49b9-aeb8-2bb621c36388'
title: 'Comprehensive Patching Report Dataview'
title_meta: 'Comprehensive Patching Report Dataview'
keywords: ['patching', 'report', 'compliance', 'status', 'override', 'policy', 'approval', 'installed', 'missing', 'last', 'agent']
description: 'This document provides a detailed overview of a comprehensive patching report dataview, including essential columns such as patching configuration, patch status, and compliance metrics for effective machine management.'
tags: ['report', 'patching', 'compliance', 'security', 'windows', 'update']
draft: false
unlisted: false
---
## Summary

This Dataview is very descriptive and reflects all the relevant information for patching in just one report including Patching configuration, Patch status, etc.

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
| MS Install Override Active             | Displays if the Patching override is set or not on the machine          |
| Third Party Install Policy             | Displays if the Third Party install is set or not                       |
| Third Party Install Override Active     | Displays if the Third-Party Patching override is set or not on the machine |
| Reboot Policy                          | Displays the reboot policy active on the machine                         |
| Reboot Override Active                 | Displays if the reboot override is set on the machine or not            |
| # of Approval Policies                 | Displays the number of approval policies active on the machine           |
| Approval Policy                        | Displays the name of the approval policies active                        |
| Approved Patches                       | Displays the number of approved patches for the machine                  |
| Installed Patches                      | Displays the number of installed patches on the machine                  |
| Missing Patches                        | Displays the number of missing patches on the machine                    |
| Compliance percentage                  | Displays the patch compliance in percentage for the machine              |
| Reboot Pending                         | Displays whether the machine has a pending reboot                       |
| Last Patched                           | Displays the last patch date of the machine                              |
| Last Patch Scan                        | Displays the last patch scan date of the machine                         |
| Last Agent Contact                     | Displays the last agent contact of the machine                           |
| Last Agent Inventory                   | Displays the last agent inventory of the machine                         |
| Agent Uptime                           | Displays the uptime of the machines in minutes                           |
| Daytime Patching                       | Displays whether the Daytime patching is enabled or disabled on the machine |
| Days Since Last Patched                | Days Since Last Patched                                                  |
| Days Since Last Patch Scan             | Days Since Last Patch Scan                                               |
| Days Since Last Agent Contact          | Days Since Last Agent Contact                                            |
| Days Since Last Agent Inventory        | Days Since Last Agent Inventory                                          |







