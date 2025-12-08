---
id: 'db122f12-3d6b-48ae-8c8b-e9de9797ecad'
slug: /db122f12-3d6b-48ae-8c8b-e9de9797ecad
title: 'Install Windows 11 24H2 - Compatible Machines'
title_meta: 'Install Windows 11 24H2 - Compatible Machines'
keywords: ['windows','monitor', 'readiness','compatibility', 'upgrade']
description: 'It executes Windows 11 Installer script on compatible Windows 10 machines.'
tags:  ['database', 'report', 'setup', 'update', 'windows']
draft: False
unlisted: false
---

## Summary

The monitor set is configured to execute **[Windows 11 installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad)** script on compatible Windows 10 and Windows 11 machines to install **Windows 11 24H2**. The monitor includes a time-gate to ensure the script only runs during off-hours, specifically between **6:00 PM and 6:00 AM**, to avoid disruptions during working hours as the process involves a forced computer reboot.

To control the rollout pace, the monitor selects a randomized, limited batch of machines per client each night (defaulting to 4 machines unless a custom limit is defined). For machines where the initial execution fails, the script will retry every 48 hours. A maximum of three attempts will be made per machine before it is excluded from future runs.

## Dependencies

- [Solution: Windows 10 ESU Licensing and Auditing](/docs/7fe6a52b-79fd-487b-8009-523996e74d11)
- [Solution: Windows 11 Compatibility Audit](/docs/f0bb3ffc-60cb-484c-b7fa-27a386ac664c)  
- [Script: Windows 11 installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad)  
- [Solution : Windows 11 Installation](/docs/00b08a60-f202-42db-9f67-a76ea29289fa)  
- Alert Template: △ Custom - Install Windows 11 - Compatible Machines

## Target

Global

## EDF

| Name | Type | Level | Section | Description |
| --- | --- | --- | --- | --- |
| **Enable Windows 11 Installation** | Check-Box | Client | Default | Enables automation for the client (Windows 10 upgrades). |
| **Enable Windows 11 Feature Update** | Check-Box | Client | Default | Enables automation for the client (Windows 11 version updates). |
| **Exclude Windows 11 Installation** | Check-Box | Location | Exclusions | Exclude location from the automation. |
| **Exclude Windows 11 Installation** | Check-Box | Computer | Exclusions | Exclude specific computer from the automation. |
| **Windows 11 Installation Attempts** | Text | Computer | Default | A non-editable EDF, updated by the installer script to track failure counts. |
| **ESU Detection** | Text | Computer | Default | Stores ESU status (e.g., 'ESU Activated'). Used to exclude paying ESU machines. |
| **Windows 11 - Machines per Night** | Text | Client | Default | Defines the daily batch limit for the client. If blank, defaults to 5. |
