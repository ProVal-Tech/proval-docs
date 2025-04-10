---
id: 'f79eac19-1ead-42bb-903b-8f3bc7dc4bd1'
slug: /f79eac19-1ead-42bb-903b-8f3bc7dc4bd1
title: 'Battery Report'
title_meta: 'Battery Report'
keywords: ['battery', 'report', 'health', 'capacity', 'cycle', 'manufacturer', 'client', 'location']
description: 'This document provides detailed information about the battery report, including dependencies, columns, and calculations for battery health and performance metrics.'
tags: ['battery', 'performance', 'report']
draft: false
unlisted: false
---

## Summary

This document displays the battery report information.

## Dependencies

- [EPM - Data Collection - Automate - Script Get - Battery Report](/docs/59738aa7-5495-4e4d-a36a-cc8af2643865)
- [EPM - Data Collection - Custom Table - plugin_proval_batteries](/docs/5507c4d8-9cfc-4d67-9c84-7cbad5a37de1)
- [CWM - Automate - Script - Property - Set](/docs/2b64bf00-b8b2-499b-b9d2-70d218f18cfb)

## Columns

| Column                 | Description                                                                                                                                                     |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ComputerID            | The Computer ID in Automate.                                                                                                                                 |
| BatteryID             | The alphanumeric battery ID.                                                                                                                                  |
| Client                | The client the target belongs to.                                                                                                                             |
| Location              | The location the target belongs to.                                                                                                                           |
| Name                  | The computer name.                                                                                                                                              |
| BatteryState          | "Ok" if above 70 percent, "Poor" if between 30 and 70, "Very Poor" if between 15 and 30, and "Replace Soon" if lower than 15 percent; calculated by FullChargeCapacity * 100 / DesignCapacity. |
| BatteryHealthPercentage| Health percentage of the battery, calculated by FullChargeCapacity * 100 / DesignCapacity.                                                                     |
| Chemistry             | The battery chemistry.                                                                                                                                          |
| FullChargeCapacity     | The full charge capacity of the battery.                                                                                                                      |
| DesignCapacity        | The design capacity of the battery.                                                                                                                            |
| CycleCount            | The battery's cycle count.                                                                                                                                     |
| LastScanTime          | The last time the battery report script ran.                                                                                                                  |
| LongTerm              | The value for long term received from the agnostic script.                                                                                                    |
| ManufactureDate       | The manufacture date of the battery.                                                                                                                            |
| Manufacturer          | The battery manufacturer.                                                                                                                                      |
| RelativeCapacity      | The relative capacity of the battery.                                                                                                                           |
| SerialNumber          | The battery serial number.                                                                                                                                     |
| ClientID              | Not displayed but used.                                                                                                                                       |
| LocationID            | Not displayed but used.                                                                                                                                       |
| ThresholdViolation     | True if FullChargeCapacity * 100 / DesignCapacity is greater than the threshold set.                                                                          |



