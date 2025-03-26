---
id: '42c8f9a7-fc2e-4246-8c01-cbcc51068e6f'
slug: /42c8f9a7-fc2e-4246-8c01-cbcc51068e6f
title: 'CW RMM Solution - Malicious Software Removal Tool Scanning & Disabling'
title_meta: 'CW RMM Solution - Malicious Software Removal Tool Scanning & Disabling'
keywords: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
description: 'This solution details the deployment and removal solution of the Malicious Software Removal Tool and provide its implementation process'
tags: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
draft: false
unlisted: false
---

## Purpose
The solution provides feature to run the scanning using Malicious Software Removal Tool or disable/uninstall it completely.

## Deployment Content

| Content                                                                                          | Type          | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------|
| [Task - Malicious Software Removal Tool Scanning](/docs/ef14e376-ec97-4f0d-8563-1430fb47e97e) | Script | This script performs the endpoint scanning using the MSRT and provides an option to create a ticket if a failure is detected. It also saves the result to the custom field `MSRT Scanner Result` so that the agent gets excluded from the dynamic [Group - Malicious software removal tool scanning enable](/docs/b497ecf7-c8e2-4b6a-b779-94adfd831c98) if the task ran successfully. This script can be run on demand or by scheduling it to the [Group - Malicious software removal tool scanning enable](/docs/b497ecf7-c8e2-4b6a-b779-94adfd831c98). |
| [MSRT Custom fields](/docs/c6a36d73-01c8-4ef9-ace2-e9d6a4bc2363) | Custom Field | This document provides a detailed guide on creating custom fields for the MSRT (Malicious Software Removal Tool) in ConnectWise RMM. It includes instructions on how to set up the field, its properties, and its importance in associating MSRT with their respective organizations. It is utilized by the [Task - Malicious Software Removal Tool Scanning](/docs/ef14e376-ec97-4f0d-8563-1430fb47e97e) and [Task - Malicious Software Removal Tool Disable/Uninstall](/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e) tasks. |
| [Malicious software removal tool scanning enable](/docs/b497ecf7-c8e2-4b6a-b779-94adfd831c98) | Dynamic Group | This group includes the endpoints where the MSRT scanning needs to be enabled. |

## Disable/Uninstall Content
| Content                                                                                          | Type          | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------|
|  [Task - Malicious Software Removal Tool Disable/Uninstall](/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e)| Script | This script disables and uninstalls the MSRT from the endpoint and provided option to creates ticket if failure detected. It also save result to the custom field `MSRT Scanner Result` so that the agent gets excluded from the [Group - Malicious Software Removal Tool Uninstall-Disable](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4) if the task ran successfully. This script can run on demand as well or by scheduling it to the [Group - Malicious Software Removal Tool Uninstall-Disable](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4). |
| [MSRT Custom fields](/docs/c6a36d73-01c8-4ef9-ace2-e9d6a4bc2363) | Custom Field | This document provides a detailed guide on creating a custom fields for the MSRT(Malicious Software Removal Tool) in ConnectWise RMM. It includes instructions on how to set up the field, its properties, and its importance in associating MSRT with their respective organizations. It is utilized by the  [Task - Malicious Software Removal Tool Scanning](/docs/ef14e376-ec97-4f0d-8563-1430fb47e97e) and [Task - Malicious Software Removal Tool Disable/Uninstall](/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e) tasks. |
| [Group - Malicious Software Removal Tool Uninstall-Disable](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4) | Dynamic Group | This group includes the endpoint where the MSRT needed to be uninstalled and disabled. |

## Implementation

1. Create the custom fields [MSRT Custom fields](/docs/c6a36d73-01c8-4ef9-ace2-e9d6a4bc2363)
2. Create the tasks [Task - Malicious Software Removal Tool Disable/Uninstall](/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e) and [Task - Malicious Software Removal Tool Scanning](/docs/ef14e376-ec97-4f0d-8563-1430fb47e97e)
3. Create the groups [Group - Malicious Software Removal Tool Uninstall-Disable](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4) and [Group - Malicious software removal tool scanning enable](/docs/b497ecf7-c8e2-4b6a-b779-94adfd831c98)
4. Read the implementation instructions in the tasks document on how to implement them.
5. To implement the MSRT scanning [Task - Malicious Software Removal Tool Scanning](/docs/ef14e376-ec97-4f0d-8563-1430fb47e97e) you can schedule it on demand by scheduling the script directly to numerous machines by checking the endpoints from the `Devices` or you can check the company custom field `MSRT Scanner Enable` so that the endpoints of the company joins the group [Group - Malicious software removal tool scanning enable](/docs/b497ecf7-c8e2-4b6a-b779-94adfd831c98) and then we can schedule the script to the group so that the scanning will happen on them.
Note: The group will exclude the endpoints where the scanning found no infection.
6. Similarly we can schedule the disabling uninstall [Task - Malicious Software Removal Tool Disable/Uninstall](/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e) to numerous machines by checking the endpoints from the `Devices` or check the company custom field `MSRT Disable Uninstall` so that endpoints of the company join the group [Group - Malicious Software Removal Tool Uninstall-Disable](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4) and task can be scheduled on it to permanently disable the MSRT patches and scanning.
Note: The group will automatically remove the endpoints where the MSRT disabled successfully.



