---
id: '8a8b76b2-aa25-419c-b193-aa98f54ef274'
title: 'Disk Information Display'
title_meta: 'Disk Information Display for Critical Disk Data'
keywords: ['disk', 'information', 'critical', 'data', 'gather', 'client', 'computer', 'drive', 'manufacturer', 'health']
description: 'This document provides an overview of the Disk Information Display, which gathers critical disk data from the EPM - Disk - Agnostic - Get-CriticalDiskInfo script and stores it in a custom table. It includes details about the columns and dependencies involved in the process.'
tags: ['disk']
draft: false
unlisted: false
---
## Summary

This Dataview displays the Disk information gathered from [EPM - Disk - Agnostic - Get-CriticalDiskInfo](<../../powershell/Get-CriticalDiskInfo.md>). This is called from the [Disk - Gather Critical Info](<../scripts/Disk - Gather Critical Info - Deprecated and replaced.md>) automate script and stores that data in the automate custom table [plugin_proval_cdi_data](<../tables/plugin_proval_cdi_data.md>).

## Dependencies

- [EPM - Disk - Script - Disk - Gather Critical Info](<../scripts/Disk - Gather Critical Info - Deprecated and replaced.md>)
- [EPM - Disk - Custom Table - plugin_proval_cdi_data](<../tables/plugin_proval_cdi_data.md>)
- [EPM - Disk - Agnostic - Get-CriticalDiskInfo](<../../powershell/Get-CriticalDiskInfo.md>)

## Columns

| Column                | Description                                                              |
|----------------------|--------------------------------------------------------------------------|
| Client               | The name of the Client for the displayed computer                        |
| ComputerName         | The name of the computer                                                 |
| DriveID              | The ID of the Drive                                                     |
| Model                | The drive model                                                         |
| Manufacturer         | The Manufacturer of the drive                                           |
| Firmware             | The Drives' firmware                                                    |
| SerialNumber         | The serial number of the drive                                          |
| DiskSize             | The size of the drive                                                   |
| BufferSize           | The buffer size of the drive if known, unknown if unknown              |
| Rotation Rate        | The rotation rate of the drive, will display SSD if no rotation rate   |
| Interface            | The drives' interface                                                   |
| Transfer Mode        | The drives' transfer mode                                               |
| PowerOnCount         | The drives' power on count                                              |
| PowerOnHours         | The drives' power on hours                                              |
| HostReads            | The drives' host reads                                                 |
| HowtWrites           | The drives' host writes                                                |
| Temperature          | The drives' temperature                                                |
| HealthStatus         | The drives' health status                                              |
| Features             | The drives' features                                                   |
| APMLevel             | The drives' APM level                                                  |
| AAMLevel             | The drives' AAM level                                                  |
| CriticalWarnings      | The number of critical warnings for this drive                          |
| CompositeTemperature  | The drives' composite temperature                                       |
| AvailableSpare       | The drives' available spare value                                       |
| AvailableSpareThreshold | The drives' available spare threshold value                             |
| PercentageUsed       | The percent of the drive being used                                     |
| DataUnitsRead        | The amount of data units read by the drive                              |
| DataUnitsWritten     | The amount of data units written by the drive                           |
| HostReadCommands     | The amount of host read commands logged on this drive                   |
| HostWriteCommands    | The amount of host write commands logged on this drive                  |
| ControllerBusyTime   | The total amount of time the controller logged as busy                  |
| UnsafeShutdowns      | The amount of unsafe shutdowns logged on the drive                      |
| IntegrityErrors      | The amount of integrity errors logged on the drive                      |
| InformationalLogEntries | The amount of informational log entries logged on the drive           |
| DateUpdated          | The Date that this information was gathered                             |













