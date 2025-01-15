---
id: 'd6e5e2a7-ecb8-4262-92a1-cc322b4af3b6'
title: 'HP iLO Health Report Table'
title_meta: 'HP iLO Health Report Table Documentation'
keywords: ['hp', 'ilo', 'health', 'report', 'device', 'status']
description: 'This document provides details about the HP iLO Health Report table, including its purpose, dependencies, and the structure of the data it stores about HP iLO devices. It outlines the columns, data types, and explanations for each entry, helping users understand the health information collected by the script.'
tags: ['database', 'report', 'health', 'status', 'monitoring']
draft: false
unlisted: false
---
## Purpose

This table stores health information about HP iLO devices. It is filled by the script [HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-10072559) and is used by the dataview [HP iLO Health Report](https://proval.itglue.com/DOC-5078775-10072561).

## Dependencies

- [EPM - Data Collection - Script - HP iLO - Health Report - Get](https://proval.itglue.com/DOC-5078775-10072559)
- [EPM - Data Collection - Agnostic - Get-HPiLOHealthReport](https://proval.itglue.com/DOC-5078775-10072511)

## Tables

### plugin_proval_ilo_health_report

| Column                       | Type     | Explanation                                            |
|------------------------------|----------|-------------------------------------------------------|
| ClientID                     | INT      | The client ID of the scanning computer.               |
| LocationID                   | INT      | The location ID of the scanning computer.             |
| IP                           | VARCHAR  | The IP address of the iLO device.                     |
| ConnectionStatus             | VARCHAR  | The returned connection status of the iLO device.     |
| HostModel                    | VARCHAR  | The model of the host of the iLO device.             |
| HostSerialNumber             | VARCHAR  | The serial number of the host of the iLO device.     |
| ILOModel                     | VARCHAR  | The model of the iLO device.                          |
| ILOSerialNumber              | VARCHAR  | The serial number of the iLO device.                  |
| ILOFirmwareRevision          | VARCHAR  | The firmware revision of the iLO device.              |
| AgentlessManagementService    | VARCHAR  | Status of the AMS.                                    |
| BatteryStatus                | VARCHAR  | Health status of the battery.                          |
| BIOSHardwareStatus           | VARCHAR  | Health status of the BIOS hardware.                   |
| FanStatus                    | VARCHAR  | Health status of the fans.                            |
| FanRedundancy                | VARCHAR  | Redundancy status of the fans.                        |
| MemoryStatus                 | VARCHAR  | Health status of the RAM.                             |
| NetworkStatus                | VARCHAR  | Health status of the network card(s).                 |
| PowerSuppliesStatus          | VARCHAR  | Health status of the PSUs.                            |
| PowerSuppliesRedundancy      | VARCHAR  | Redundancy status of the PSUs.                        |
| PowerSuppliesMismatch        | VARCHAR  | Shows if the PSUs are improperly paired.              |
| ProcessorStatus              | VARCHAR  | Health status of the CPUs.                            |
| StorageStatus                | VARCHAR  | Health status of the storage.                          |
| TemperatureStatus            | VARCHAR  | Health status based on the temperature.               |
| Hostname                     | VARCHAR  | Hostname of the iLO device (if available).           |
| Status                       | VARCHAR  | Overall status of the iLO device.                     |
| StatusInfo                   | VARCHAR  | Additional information about the overall iLO status.  |
| LastRun                      | DATETIME | The last time the Script was run.                     |
| Computerid                   | INT      | Computerid                                           |







