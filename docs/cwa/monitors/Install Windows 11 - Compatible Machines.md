---
id: 'db122f12-3d6b-48ae-8c8b-e9de9797ecad'
title: 'Install Windows 11 - Compatible Machines'
title_meta: 'Install Windows 11 - Compatible Machines'
keywords: ['windows','monitor', 'readiness','compatibility', 'upgrade']
description: 'It executes Windows 11 Installer script on compatible Windows 10 machines.'
tags:  ['database', 'report', 'setup', 'update', 'windows']
draft: False
unlisted: false
---

## Summary
The monitor set is configured to execute [Windows 11 Installer](<../scripts/Windows 11 Installer.md>) on compatible Windows 10 machines. The script runs during off-hours, specifically between 6:00 PM and 6:00 AM, to avoid disruptions during working hours, as the process involves a forced computer reboot. For machines where the initial execution fails, the script will retry once per week. A maximum of three attempts will be made per machine.


## Dependencies
[Windows 11 Compatibility Audit](<../../solutions/Windows 11 Compatibility Audit.md>)  
[Install Windows 11](<../scripts/Install Windows 11.md>)

## Target
Global

## EDF
| Name                             | Type       | Level    | Section     | Description                                                                 |
|----------------------------------|------------|----------|-------------|-----------------------------------------------------------------------------|
| Enable Windows 11 Installation   | Check-Box  | Client   | Default     | Enables automation for the client.                                         |
| Exclude Windows 11 Installation  | Check-Box  | Location | Exclusions  | Exclude location from the automation.                                      |
| Exclude Windows 11 Installation  | Check-Box  | Computer | Exclusions  | Exclude location from the computer.                                        |
| Windows 11 Installation Attempts | Text       | Computer | Default     | A non-editable EDF, updated by Windows 11 Installer script to keep track of the number of scripts run. |
