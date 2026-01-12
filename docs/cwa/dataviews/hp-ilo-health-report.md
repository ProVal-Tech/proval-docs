---
id: '163aca22-cc56-45ee-9732-3873c6117e60'
slug: /163aca22-cc56-45ee-9732-3873c6117e60
title: 'HP iLO Health Report'
title_meta: 'HP iLO Health Report'
keywords: ['ilo', 'health', 'report', 'client', 'status', 'device', 'firmware', 'network', 'memory', 'storage']
description: 'This document provides an overview of the iLO health report display, detailing the health status of iLO devices including connection status, firmware revision, and various hardware health metrics. It also outlines dependencies and the specific columns included in the report.'
tags: ['firmware', 'memory', 'report', 'storage']
draft: false
unlisted: false
---

## Summary

Displays iLO health information from the table [plugin_proval_ilo_health_report](/docs/d6e5e2a7-ecb8-4262-92a1-cc322b4af3b6).

## Dependencies

- [Custom Table - plugin_proval_ilo_health_report](/docs/d6e5e2a7-ecb8-4262-92a1-cc322b4af3b6)
- [Script - HP iLO - Health Report - Get](/docs/f28ef90e-ba80-4ba1-9bd6-e4aa4c2b549a)
- [Solution - HP iLO Health Check](/docs/7bd9dad1-d463-468b-a3b1-2eef8e060352)

## Columns

| Column                   | Explanation                                                                                               |
|-------------------------|-----------------------------------------------------------------------------------------------------------|
| Client                  | The name of the client for this iLO device.                                                              |
| Location                | The name of the location for this iLO device.                                                            |
| DataCollectionTime      | The time when the data was collected.                                                                     |
| iloDevice               | The name of the iLO device stored in the password entry. If the name is not present, the hostname fetched from the device will be displayed. |
| IP                      | The IP address of the iLO device.                                                                         |
| ConnectionStatus        | The returned connection status of the iLO device.                                                        |
| HostModel               | The model of the host of the iLO device.                                                                 |
| HostSerialNumber        | The serial number of the host of the iLO device.                                                         |
| ILOModel                | The model of the iLO device.                                                                              |
| ILOSerialNumber         | The serial number of the iLO device.                                                                      |
| ILOFirmwareRevision      | The firmware revision of the iLO device.                                                                  |
| AgentlessManagementService | Status of the Agentless Management Service (AMS).                                                       |
| BatteryStatus           | Health status of the battery.                                                                             |
| BIOSHardwareStatus      | Health status of the BIOS hardware.                                                                        |
| FanStatus               | Health status of the fans.                                                                                |
| FanRedundancy           | Redundancy status of the fans.                                                                            |
| MemoryStatus            | Health status of the RAM.                                                                                 |
| NetworkStatus           | Health status of the network card(s).                                                                     |
| PowerSuppliesStatus     | Health status of the power supply units (PSUs).                                                          |
| PowerSuppliesRedundancy | Redundancy status of the PSUs.                                                                            |
| PowerSuppliesMismatch    | Indicates if the PSUs are improperly paired.                                                              |
| ProcessorStatus         | Health status of the CPUs.                                                                                 |
| StorageStatus           | Health status of the storage.                                                                              |
| TemperatureStatus       | Health status based on the temperature.                                                                    |
| Hostname                | Hostname of the iLO device (if available).                                                                |
| Status                  | Overall status of the iLO device.                                                                         |
| StatusInfo              | Additional information about the overall iLO status.                                                     |
| ScriptRunTime           | Last run time of the script to gather data.                                                               |