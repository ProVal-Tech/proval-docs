---
id: 'db122f12-3d6b-48ae-8c8b-e9de9797ecad'
slug: /db122f12-3d6b-48ae-8c8b-e9de9797ecad
title: 'Install Windows 11 - Compatible Machines'
title_meta: 'Install Windows 11 - Compatible Machines'
keywords: ['windows','monitor', 'readiness','compatibility', 'upgrade']
description: 'It executes Windows 11 Installer script on compatible Windows 10 machines.'
tags:  ['database', 'report', 'setup', 'update', 'windows']
draft: False
unlisted: false
---

## Summary
The monitor set is configured to execute [Script: Windows 11 installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad) on compatible Windows 10 machines. The script runs during off-hours, specifically between 6:00 PM and 6:00 AM, to avoid disruptions during working hours, as the process involves a forced computer reboot. For machines where the initial execution fails, the script will retry once per week. A maximum of three attempts will be made per machine.

## Dependencies
[Solution: Windows 11 Compatibility Audit](/docs/f0bb3ffc-60cb-484c-b7fa-27a386ac664c)  
[Script: Windows 11 installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad)  
[Solution : Windows 11 Installation](/docs/00b08a60-f202-42db-9f67-a76ea29289fa)  
Alert Template: △ Custom - Install Windows 11 - Compatible Machines

## Target

Global

## EDF

| Name                             | Type       | Level    | Section     | Description                                                                 |
|----------------------------------|------------|----------|-------------|-----------------------------------------------------------------------------|
| Enable Windows 11 Installation   | Check-Box  | Client   | Default     | Enables automation for the client.                                         |
| Exclude Windows 11 Installation  | Check-Box  | Location | Exclusions  | Exclude location from the automation.                                      |
| Exclude Windows 11 Installation  | Check-Box  | Computer | Exclusions  | Exclude location from the computer.                                        |
| Windows 11 Installation Attempts | Text       | Computer | Default     | A non-editable EDF, updated by Windows 11 Installer script to keep track of the number of scripts run. |