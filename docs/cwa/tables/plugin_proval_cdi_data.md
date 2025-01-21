---
id: '7a224177-45ff-4f2e-a8fe-a734a642a539'
title: 'plugin_proval_cdi_data'
title_meta: 'plugin_proval_cdi_data'
keywords: ['disk', 'critical', 'info', 'data', 'monitoring']
description: 'This document provides detailed information about the critical data collected from disk drives using the EPM Disk Agnostic Get-CriticalDiskInfo script. It outlines the dependencies, structure of the data tables, and the specific attributes recorded for each disk, ensuring effective monitoring and management of disk health and performance.'
tags: ['database', 'disk-encryption', 'performance', 'security', 'setup']
draft: false
unlisted: false
---

## Purpose

Holds populated data from [EPM - Disk - Agnostic - Get-CriticalDiskInfo](<../../powershell/Get-CriticalDiskInfo.md>)  
Created from [EPM - Disk - Script - Disk - Gather Critical Info](<../scripts/Disk - Gather Critical Info - Deprecated and replaced.md>)  

## Dependencies

- [EPM - Disk - Agnostic - Get-CriticalDiskInfo](<../../powershell/Get-CriticalDiskInfo.md>)  
- [EPM - Disk - Script - Disk - Gather Critical Info](<../scripts/Disk - Gather Critical Info - Deprecated and replaced.md>)  
- [CWM - Automate - Dataview - Disk - Critical Data](https://proval.itglue.com/DOC-5078775-9374639)  

## Tables

#### plugin_proval_cdi_data

| Column                     | Type           | Explanation                                      |
|---------------------------|----------------|--------------------------------------------------|
| ComputerID                | INT(11)        | Holds the ComputerID (Primary)                  |
| DriveID                   | VarChar(50)    | Holds the Populated DriveID (Primary)           |
| DriveModel                | VarChar(255)   | Holds the model of the drive                     |
| DriveManufacturer          | VarChar(255)   | Holds the manufacturer of the drive              |
| Firmware                  | VarChar(255)   | Holds the current firmware of the drive          |
| SerialNumber              | VarChar(255)   | Holds the drive serial number                    |
| DiskSize                  | VarChar(255)   | Holds the drive size displayed as "#### GB/MB" etc. |
| BufferSize                | VarChar(255)   | Holds the buffer size of the drive               |
| Interface                 | VarChar(255)   | Holds the drive's interface information          |
| TransferMode              | VarChar(255)   | Holds the drive's transfer mode information      |
| PowerOnCount              | INT(11)        | Holds the drive's power on count                 |
| PowerOnHours              | INT(11)        | Holds the drive's power on hours                 |
| HostReads                 | VarChar(255)   | Holds the drive's host read count                |
| HostWrites                | VarChar(255)   | Holds the drive's host write count               |
| Temperature               | VarChar(255)   | Holds the drive's temperature                    |
| HealthStatus              | VarChar(255)   | Holds the drive's current health status          |
| Features                  | VarChar(255)   | Holds the drive's available features             |
| APMLevel                  | VarChar(255)   | Holds the drive's APM level                      |
| AAMLevel                  | VarChar(255)   | Holds the drive's AAM level                      |
| CriticalWarnings          | INT(11)        | Holds the count of the drive's critical warnings |
| CompositeTemperature       | INT(11)        | Holds the drive's current composite temperature   |
| AvailableSpare            | INT(11)        | Holds the drive's available spare information    |
| AvailableSpareThreshold    | INT(11)        | Holds the drive's available spare threshold information |
| PercentageUsed            | INT(11)        | Holds the drive's percentage being used          |
| DataUnitsRead             | INT(11)        | Holds the amount of data units read for the drive|
| DataUnitsWritten          | INT(11)        | Holds the amount of data units written for the drive |
| HostReadCommands          | INT(11)        | Holds the amount of Host Read Commands for the drive |
| HostWriteCommands         | INT(11)        | Holds the amount of Host Write Commands for the drive |
| ControllerBusyTime        | INT(11)        | Holds the drive's controller busy time           |
| UnsafeShutdowns           | INT(11)        | Holds the number of unsafe shutdowns for the drive |
| IntegrityErrors           | INT(11)        | Holds the number of integrity errors for the drive |
| InformationalLogEntries   | INT(11)        | Holds the number of informational log entries for the drive |
| DateUpdated               | DATE           | Holds the date of the last check                 |



