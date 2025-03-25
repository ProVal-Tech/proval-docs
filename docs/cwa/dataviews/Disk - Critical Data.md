---
id: '8a8b76b2-aa25-419c-b193-aa98f54ef274'
slug: /8a8b76b2-aa25-419c-b193-aa98f54ef274
title: 'Disk - Critical Data'
title_meta: 'Disk - Critical Data'
keywords: ['disk', 'information', 'critical', 'data', 'gather', 'client', 'computer', 'drive', 'manufacturer', 'health']
description: 'This document provides an overview of the Disk Information Display, which gathers critical disk data from the EPM - Disk - Agnostic - Get-CriticalDiskInfo script and stores it in a custom table. It includes details about the columns and dependencies involved in the process.'
tags: ['disk']
draft: false
unlisted: false
---

## Summary

This Dataview displays the disk information gathered from [EPM - Disk - Agnostic - Get-CriticalDiskInfo](<../../powershell/Get-CriticalDiskInfo.md>). This is called from the [Disk - Gather Critical Info](<../scripts/Disk - Gather Critical Info - Deprecated and replaced.md>) automation script and stores that data in the custom table [plugin_proval_cdi_data](<../tables/plugin_proval_cdi_data.md>).

## Dependencies

- [EPM - Disk - Script - Disk - Gather Critical Info](<../scripts/Disk - Gather Critical Info - Deprecated and replaced.md>)
- [EPM - Disk - Custom Table - plugin_proval_cdi_data](<../tables/plugin_proval_cdi_data.md>)
- [EPM - Disk - Agnostic - Get-CriticalDiskInfo](<../../powershell/Get-CriticalDiskInfo.md>)

## Columns

| Column                | Description                                                              |
|----------------------|--------------------------------------------------------------------------|
| Client               | The name of the client for the displayed computer                        |
| ComputerName         | The name of the computer                                                 |
| DriveID              | The ID of the drive                                                      |
| Model                | The drive model                                                         |
| Manufacturer         | The manufacturer of the drive                                           |
| Firmware             | The drive's firmware                                                    |
| SerialNumber         | The serial number of the drive                                          |
| DiskSize             | The size of the drive                                                   |
| BufferSize           | The buffer size of the drive if known; unknown if not known            |
| Rotation Rate        | The rotation rate of the drive; will display SSD if no rotation rate   |
| Interface            | The drive's interface                                                   |
| Transfer Mode        | The drive's transfer mode                                               |
| PowerOnCount         | The drive's power-on count                                              |
| PowerOnHours         | The drive's power-on hours                                              |
| HostReads            | The drive's host reads                                                  |
| HostWrites           | The drive's host writes                                                 |
| Temperature          | The drive's temperature                                                 |
| HealthStatus         | The drive's health status                                               |
| Features             | The drive's features                                                    |
| APMLevel             | The drive's APM level                                                  |
| AAMLevel             | The drive's AAM level                                                  |
| CriticalWarnings     | The number of critical warnings for this drive                          |
| CompositeTemperature  | The drive's composite temperature                                       |
| AvailableSpare       | The drive's available spare value                                       |
| AvailableSpareThreshold | The drive's available spare threshold value                             |
| PercentageUsed       | The percentage of the drive being used                                   |
| DataUnitsRead        | The amount of data units read by the drive                              |
| DataUnitsWritten     | The amount of data units written by the drive                           |
| HostReadCommands     | The number of host read commands logged on this drive                   |
| HostWriteCommands    | The number of host write commands logged on this drive                  |
| ControllerBusyTime   | The total amount of time the controller was logged as busy              |
| UnsafeShutdowns      | The number of unsafe shutdowns logged on the drive                      |
| IntegrityErrors      | The number of integrity errors logged on the drive                      |
| InformationalLogEntries | The number of informational log entries logged on the drive           |
| DateUpdated          | The date that this information was gathered                             |



