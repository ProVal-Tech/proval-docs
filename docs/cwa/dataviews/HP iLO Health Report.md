---
id: '163aca22-cc56-45ee-9732-3873c6117e60'
title: 'iLO Health Report Display'
title_meta: 'iLO Health Report Display - ConnectWise Automate'
keywords: ['ilo', 'health', 'report', 'client', 'status', 'device', 'firmware', 'network', 'memory', 'storage']
description: 'This document provides an overview of the iLO health report display, detailing the health status of iLO devices including connection status, firmware revision, and various hardware health metrics. It also outlines dependencies and the specific columns included in the report.'
tags: ['firmware', 'memory', 'report', 'storage']
draft: false
unlisted: false
---
## Summary

Displays iLO health information from the table [plugin_proval_ilo_health_report](<../tables/plugin_proval_ilo_health_report.md>).

## Dependencies

- [plugin_proval_ilo_health_report](<../tables/plugin_proval_ilo_health_report.md>)
- [EPM - Data Collection - Script - HP iLO - Health Report - Get](<../scripts/HP iLO - Health Report - Get.md>)
- [EPM - Data Collection - Agnostic - Get-HPiLOHealthReport](<../../powershell/Get-HPiLOHealthReport.md>)

## Columns

| Column                   | Explanation                                                                                               |
|-------------------------|-----------------------------------------------------------------------------------------------------------|
| Client                  | The name of the client for this iLO device.                                                              |
| Location                | The name of the location for this iLO device.                                                            |
| DataCollectionTime      | Data Collection Time                                                                                      |
| iloDevice               | Name of the iLO device stored in the password entry, if the name is not present in the password entry than the hostname fetched from the device will be displayed |
| IP                      | The IP address of the iLO device.                                                                         |
| ConnectionStatus        | The returned connection status of the iLO device.                                                        |
| HostModel               | The model of the host of the iLO device.                                                                 |
| HostSerialNumber        | The serial number of the host of the iLO device.                                                         |
| ILOModel                | The model of the iLO device.                                                                              |
| ILOSerialNumber         | The serial number of the iLO device.                                                                      |
| ILOFirmwareRevision      | The firmware revision of the iLO device.                                                                  |
| AgentlessManagementService | Status of the AMS.                                                                                       |
| BatteryStatus           | Health status of the battery.                                                                             |
| BIOSHardwareStatus      | Health status of the BIOS hardware.                                                                        |
| FanStatus               | Health status of the fans.                                                                                |
| FanRedundancy           | Redundancy status of the fans.                                                                            |
| MemoryStatus            | Health status of the RAM.                                                                                 |
| NetworkStatus           | Health status of the network card(s).                                                                     |
| PowerSuppliesStatus     | Health status of the PSUs.                                                                                |
| PowerSuppliesRedundancy | Redundancy status of the PSUs.                                                                            |
| PowerSuppliesMismatch    | Shows if the PSUs are improperly paired.                                                                  |
| ProcessorStatus         | Health status of the CPUs.                                                                                 |
| StorageStatus           | Health status of the storage.                                                                              |
| TemperatureStatus       | Health status based on the temperature.                                                                    |
| Hostname                | Hostname of the iLO device (if available).                                                                |
| Status                  | Overall status of the iLO device.                                                                         |
| StatusInfo              | Additional information about the overall iLO status.                                                     |
| ScriptRunTIme          | Last Run time of the Script to gather data                                                                |













