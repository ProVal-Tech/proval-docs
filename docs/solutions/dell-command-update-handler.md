---
id: '5c6d840b-852a-41df-a5e2-08d7d7af564a'
slug: /5c6d840b-852a-41df-a5e2-08d7d7af564a
title: 'Dell Command Update Handler'
title_meta: 'Dell Command Update Handler'
keywords: ['dell', 'workstation', 'update', 'installation', 'firmware', 'bios', 'driver']
description: 'This solution is built to perform the Dell Command Update scanning audit and updates.'
tags: ['bios', 'firmware', 'installation', 'software', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-06
---

## Purpose

This solution is built to perform the Dell Command Update scanning audit and updates using agnostic script.

## Deprecate Content

- It is a replacement for the solution [Dell command update](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)

## Associated Audit Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)      | Script| Run this script with the monitor or on-demand to the dell machines without passing the arguments for the auditing. |
| [Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b) | Monitor | This monitor fetches the online Dell Windows agent and executes the Dell Command Handler scanning using [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) if the deployment EDFs are checked. |
| [Table - pvl-dellcommand-audit](/docs/21a8afce-3a1c-4bdf-b2d2-a5581583e27c) | Table | This table stores the dell command scan data fetched by the [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276). |
| [Dell Command Scan Audit](/docs/08c932b0-f79a-4c37-bfbe-c2aade829abb) | Dataview | This dataview collects the information of the Dell updates available on the Dell machine. |
| **Alert Template - △ Custom - Execute Script - Dell Command Scan** | Alert Template | This is required to be applied with the [Monitor - Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b) to let the [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) runs on the detected Dell agent for the dell command audit |

## Associated Update Content 

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)      | Script| Schedule this script on the Dell machines with the arguments set to perform upgrade on a weekly or bi-weekly basis. Refer to the script documentation for the brief instructions on arguments availability. |

## Implementation

- Import the [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)
- Import the [Monitor - Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b) 
- Import the [Dataview - Dell Command Scan Audit](/docs/08c932b0-f79a-4c37-bfbe-c2aade829abb) 
- Import the **Alert Template - △ Custom - Execute Script - Dell Command Scan**

- Run the [Script - Dell Command Update - InstallUpgrade + Command Handler](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) with `SetEnvironment` = 1, just after importing it, so that if creates the required table and the EDFs.
- Reload the system cache
- Apply the **Alert Template - △ Custom - Execute Script - Dell Command Scan** with the [Monitor - Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b).
- Right click and run now and reset the monitor for setting the auditing.

## FAQ

- Is the same script does the upgrade and auditing both
Yes, if the script ran without passing the arguments, it will perform the auditing and store the data to the [Table - pvl-dellcommand-audit](/docs/21a8afce-3a1c-4bdf-b2d2-a5581583e27c).
And for upgrade, it is required to pass the arguments, in that case no auditing will be done.

- Does the monitor created only performs the auditing automation
Yes

## Changelog

2026-03-06