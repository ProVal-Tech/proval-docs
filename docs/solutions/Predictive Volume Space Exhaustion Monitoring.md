---
id: 'a367bf9d-8782-4500-a1b8-adbb757f23fc'
title: 'Predictive Volume Space Exhaustion Monitoring'
title_meta: 'Predictive Volume Space Exhaustion Monitoring'
keywords: ['monitor', 'volume', 'exhaustion', 'forecast', 'utilization']
description: 'This document outlines the implementation and configuration of a Predictive Volume Exhaustion Monitor, which tracks drive space utilization trends and provides forecasts on when drive space will be fully occupied. It includes details on associated content, implementation steps, and frequently asked questions.'
tags: []
draft: false
unlisted: false
---

## Purpose

The goal of this solution is to monitor the trend of drive space utilization and provide forecasts on the number of days until the drive space is fully occupied.

## Associated Content

| Content                                                                                     | Type            | Function                     |
|---------------------------------------------------------------------------------------------|-----------------|------------------------------|
| [Predictive Volume Exhaustion Monitor Creation](<../cwa/scripts/Predictive Volume Exhaustion Monitor Creation.md>) | Automate Script | Generates remote monitors.   |
| [Get-VolumeExhaustionEstimate](<../powershell/Get-VolumeExhaustionEstimate.md>)              | Agnostic Script | Used by the remote monitors. |
| [Volume Space Prediction](<../cwa/monitors/EPM - Disk - Remote Monitor - Volume Space Prediction.md>)                  | Remote Monitor  | Used for alerting.          |
| [Volume Space Sampling](<../cwa/monitors/EPM - Disk - Remote Monitor - Volume Space Sampling.md>)                    | Remote Monitor  | Used for auditing.          |
| [Volume Exhaustion Estimations [Remote Monitor]](<../cwa/dataviews/Volume Exhaustion Estimations Remote Monitor.md>) | Dataview        | Displays the audited data.  |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Predictive Volume Exhaustion Monitor Creation](<../cwa/scripts/Predictive Volume Exhaustion Monitor Creation.md>)
   - [Dataview - Volume Exhaustion Estimations [Remote Monitor]](<../cwa/dataviews/Volume Exhaustion Estimations Remote Monitor.md>)

2. Reload the system cache:
   ![Reload Cache](../../static/img/Predictive-Volume-Space-Exhaustion-Monitoring/image_1.png)

3. Debug the [Predictive Volume Exhaustion Monitor Creation](<../cwa/scripts/Predictive Volume Exhaustion Monitor Creation.md>) script against any random client with the `Set_Environment` parameter set to `1` to create the system properties and the extra data fields used by the script. This will also remove the deprecated version of the solution from the environment.
   ![Debugging](../../static/img/Predictive-Volume-Space-Exhaustion-Monitoring/image_2.png)

4. Set the `System Properties` and `EDFs` as required.

5. Navigate to System > Configuration > Dashboard > Management > Scheduled Scripts
   - Schedule the [Predictive Volume Exhaustion Monitor Creation](<../cwa/scripts/Predictive Volume Exhaustion Monitor Creation.md>) script to run once per day after hours.
   ![Schedule Script](../../static/img/Predictive-Volume-Space-Exhaustion-Monitoring/image_3.png)

## Notes

- By default, the solution will create [Volume Space Sampling](<../cwa/monitors/EPM - Disk - Remote Monitor - Volume Space Sampling.md>) monitors. The following system properties will be enabled as imported:
  - PVE_Monitoring_Server_Enable
  - PVE_Monitoring_Workstation_Enable
  - PVE_Monitoring_Server_AuditOnly
  - PVE_Monitoring_Workstation_AuditOnly
- Global settings can be overridden at the client/location or computer levels using the EDFs outlined in the relevant document.

## FAQ

**Q:** How do I enable auditing across the entire environment?  
**A:** Setting the following system properties to `1` will enable auditing across the entire environment:
- PVE_Monitoring_Server_Enable
- PVE_Monitoring_Workstation_Enable
- PVE_Monitoring_Server_AuditOnly
- PVE_Monitoring_Workstation_AuditOnly

Setting the `_AuditOnly` properties will enable the [Volume Space Sampling](<../cwa/monitors/EPM - Disk - Remote Monitor - Volume Space Sampling.md>) monitors instead of the [Volume Space Prediction](<../cwa/monitors/EPM - Disk - Remote Monitor - Volume Space Prediction.md>). The audited data is displayed by the [Volume Exhaustion Estimations [Remote Monitor]](<../cwa/dataviews/Volume Exhaustion Estimations Remote Monitor.md>) dataview.



