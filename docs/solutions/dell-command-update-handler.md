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
  date: 2026-03-12
---

## Purpose

This solution is built to perform the Dell Command Update scanning audit and updates using agnostic script.

## Deprecate Content

- It is a replacement for the solution [Dell command update]

## Associated Audit Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Dell Command Update - Install/Upgrade + Command Handler [DV,Param,Autofix]](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)      | Script| Run this script with the monitor or on-demand to the dell machines without passing the arguments for the auditing. |
| [Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b) | Monitor | This monitor fetches the online Dell Windows agent and executes the Dell Command Handler scanning using [script](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) if the deployment EDFs are checked. |
| [Table - pvl_dellcommand_audit](/docs/21a8afce-3a1c-4bdf-b2d2-a5581583e27c) | Table | This table stores the dell command scan data fetched by the [script](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276). |
| [Dell Command Scan Audit [Script]](/docs/08c932b0-f79a-4c37-bfbe-c2aade829abb) | Dataview | This dataview collects the information of the Dell updates available on the Dell machine. |
| **Alert Template - △ Custom - Execute Script - Dell Command Scan** | Alert Template | This is required to be applied with the [Monitor - Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b) to let the [Script - Dell Command Update - Install/Upgrade + Command Handler [DV,Param,Autofix]](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) runs on the detected Dell agent for the dell command audit |


## Implementation

- Import the [Script - Dell Command Update - Install/Upgrade + Command Handler [DV,Param,Autofix]](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276)
- Import the [Monitor - Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b) 
- Import the [Dataview - Dell Command Scan Audit [Script]](/docs/08c932b0-f79a-4c37-bfbe-c2aade829abb) 
- Import the **Alert Template - △ Custom - Execute Script - Dell Command Scan**
- Run the [Script - Dell Command Update - Install/Upgrade + Command Handler [DV,Param,Autofix]](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) with `SetEnvironment` = 1, just after importing it, so that if creates the required table and the EDFs.
- Reload the system cache
- Apply the **Alert Template - △ Custom - Execute Script - Dell Command Scan** with the [Monitor - Dell Command Update Scan](/docs/f42c31ea-ee44-4c51-b7b1-04b595f1368b).
- Right click and run now and reset the monitor for setting the auditing.

### Automation

- Schedule the [Dell Command Update - Install/Upgrade + Command Handler [DV,Param,Autofix]](/docs/2ab976d5-8a03-49e6-9d72-ad529631d276) script on the Dell machines with the desired arguments set to perform upgrade on a weekly or bi-weekly basis. Refer to the script documentation for the brief instructions on arguments availability. 


## FAQ

**Q. Is the same script does the upgrade and auditing both?**

**A.** Yes, if the script ran without passing the arguments, it will perform the auditing and store the data to the [Table - pvl_dellcommand_audit](/docs/21a8afce-3a1c-4bdf-b2d2-a5581583e27c).
And for upgrade, it is required to pass the arguments, in that case no auditing will be done.

**Q. Does the monitor created only performs the auditing automation?**

**A.** Yes

## Changelog

### 2026-03-12

- Updated the script to use the [Agnostic - Initialize-DellCommandUpdate](/docs/aa963f3d-f149-4bfa-8fdc-30f12c21ce7f) to fetch the dell command scanned update using automation as well as the update feature if arguments passed.
- Introduced [Dataview - Dell Command Scan Audit [Script]](/docs/08c932b0-f79a-4c37-bfbe-c2aade829abb) to show the detailed Dell updates.
- Deprecated below:
  - Monitor `Dell Command Update Handler - Run Scan Command`
  - Dataview `Dell Command Update Handler - Audit [Script]`

### 2025-04-10

- Initial version of the document