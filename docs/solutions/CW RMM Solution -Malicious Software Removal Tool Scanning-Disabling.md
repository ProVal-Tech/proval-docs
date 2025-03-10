---
id: '42c8f9a7-fc2e-4246-8c01-cbcc51068e6f'
title: 'CW RMM Solution - Malicious Software Removal Tool Scanning & Disabling'
title_meta: 'CW RMM Solution - Malicious Software Removal Tool Scanning & Disabling'
keywords: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
description: 'This solution details the deployment and removal solution of the Malicious Software Removal Tool and its implementation'
tags: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
draft: false
unlisted: false
---

## Purpose
The solution provides feature to run the scanning using Malicious Software Removal Tool or disable/uninstall it completely.

## Deployment Content

| Content                                                                                          | Type          | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------|
| [Malicious Software Removal Tool Scanning](<../cwrmm/tasks/Malicious Software Removal Tool Scanning.md>) | Script | This script performs the endpoint scanning using the MSRT and provides an option to create a ticket if a failure is detected. It also saves the result to the custom field `MSRT Scanner Result` so that the agent gets excluded from the dynamic group [Malicious software removal tool scanning enable](<../cwrmm/groups/Malicious Software Removal Tool Scanning Enable.md>) if the task ran successfully. This script can be run on demand or by scheduling it to the group [Malicious software removal tool scanning enable](<../cwrmm/groups/Malicious Software Removal Tool Scanning Enable.md>). |
| [MSRT Custom fields](<../cwrmm/custom-fields/MSRT Custom Fields.md>) | Custom Field | This document provides a detailed guide on creating custom fields for the MSRT (Malicious Software Removal Tool) in ConnectWise RMM. It includes instructions on how to set up the field, its properties, and its importance in associating MSRT with their respective organizations. It is utilized by the [Malicious Software Removal Tool Scanning](<../tasks/Malicious Software Removal Tool Scanning.md>) and [Malicious Software Removal Tool Disable/Uninstall](<../tasks/Malicious Software Removal Tool Disable-Uninstall.md>) tasks. |
| [Malicious software removal tool scanning enable](<../cwrmm/groups/Malicious Software Removal Tool Scanning Enable.md>) | Dynamic Group | This group includes the endpoints where the MSRT scanning needs to be enabled. |

## Disable/Uninstall Content
| Content                                                                                          | Type          | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------|
| [Malicious Software Removal Tool Disable/Uninstall](<../tasks/Malicious Software Removal Tool Disable-Uninstall.md>) | Script | This script disables and uninstalls the MSRT from the endpoint and provided option to creates ticket if failure detected. It also save result to the custom field `MSRT Scanner Result` so that the agent gets excluded from the dynamic group [Malicious Software Removal Tool Uninstall-Disable group](<../groups/Malicious Software Removal Tool Uninstall-Disable.md>) if the task ran successfully. This script can run on demand as well or by scheduling it to the group [Malicious Software Removal Tool Uninstall-Disable group](<../groups/Malicious Software Removal Tool Uninstall-Disable.md>). |
| [MSRT Custom fields](<../custom-fields/MSRT Custom Fields.md>) | Custom Field | This document provides a detailed guide on creating a custom fields for the MSRT(Malicious Software Removal Tool) in ConnectWise RMM. It includes instructions on how to set up the field, its properties, and its importance in associating MSRT with their respective organizations. It is utilized by the [Malicious Software Removal Tool Scanning](<../tasks/Malicious Software Removal Tool Scanning.md>) and [Malicious Software Removal Tool Disable/Uninstall](<../tasks/Malicious Software Removal Tool Disable-Uninstall.md>) tasks. |
| [Malicious Software Removal Tool Uninstall-Disable group](<../groups/Malicious Software Removal Tool Uninstall-Disable.md>) | Dynamic Group | This group includes the endpoint where the MSRT needed to be uninstalled and disabled. |

## Implementation

1. Create the custom fields [MSRT Custom fields](<../custom-fields/MSRT Custom Fields.md>)
2. Create the tasks [Malicious Software Removal Tool Scanning](<../tasks/Malicious Software Removal Tool Scanning.md>) and [Malicious Software Removal Tool Disable/Uninstall](<../tasks/Malicious Software Removal Tool Disable-Uninstall.md>)
3. Create the groups [Malicious Software Removal Tool Uninstall-Disable group](<../groups/Malicious Software Removal Tool Uninstall-Disable.md>) and [Malicious software removal tool scanning enable](<../groups/Malicious Software Removal Tool Scanning Enable.md>)
4. Read the implementation instructions in the tasks document on how to implement them.
5. To implement the MSRT scanning [Malicious Software Removal Tool Scanning](<../tasks/Malicious Software Removal Tool Scanning.md>) you can schedule it on demand by scheduling the script directly to numerous machines by checking the endpoints from the `Devices` or you can check the company custom field `MSRT Scanner Enable` so that the endpoints of the company joins the group [Malicious software removal tool scanning enable](<../groups/Malicious Software Removal Tool Scanning Enable.md>) and then we can schedule the script to the group so that the scanning will happen on them.
Note: The group will exclude the endpoints where the scanning found no infection.
6. Similarly we can schedule the disabling uninstall script [Malicious Software Removal Tool Disable/Uninstall](<../tasks/Malicious Software Removal Tool Disable-Uninstall.md>) to numerous machines by checking the endpoints from the `Devices` or check the company custom field `MSRT Disable Uninstall` so that endpoints of the company join the group [Malicious Software Removal Tool Uninstall-Disable group](<../groups/Malicious Software Removal Tool Uninstall-Disable.md>) and task can be scheduled on it to permanently disable the MSRT patches and scanning.
Note: The group will automatically remove the endpoints where the MSRT disabled successfully.




