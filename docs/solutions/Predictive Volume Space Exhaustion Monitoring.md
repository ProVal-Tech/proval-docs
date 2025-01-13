---
id: 'cwa-predictive-volume-exhaustion-monitor'
title: 'Predictive Volume Exhaustion Monitor'
title_meta: 'Predictive Volume Exhaustion Monitor'
keywords: ['monitor', 'volume', 'exhaustion', 'forecast', 'utilization']
description: 'This document outlines the implementation and configuration of a Predictive Volume Exhaustion Monitor, which tracks drive space utilization trends and provides forecasts on when drive space will be fully occupied. It includes details on associated content, implementation steps, and frequently asked questions.'
tags: ['monitoring', 'configuration', 'audit', 'dataview', 'scripting']
draft: false
unlisted: false
---
## Purpose

The goal of the solution is to monitor the trend of drive space utilization and provide forecasts on the number of days until the drive space is fully occupied.

## Associated Content

| Content                                                                                     | Type            | Function                     |
|---------------------------------------------------------------------------------------------|-----------------|------------------------------|
| [Predictive Volume Exhaustion Monitor Creation](https://proval.itglue.com/DOC-5078775-16284178) | Automate Script | Generates remote monitors.   |
| [Get-VolumeExhaustionEstimate](https://proval.itglue.com/DOC-5078775-9652826)              | Agnostic Script | Used by the remote monitors. |
| [Volume Space Prediction](https://proval.itglue.com/DOC-5078775-16290374)                  | Remote Monitor  | Used for alerting.          |
| [Volume Space Sampling](https://proval.itglue.com/DOC-5078775-16290380)                    | Remote Monitor  | Used for auditing.          |
| [Volume Exhaustion Estimations [Remote Monitor]](https://proval.itglue.com/DOC-5078775-16284179) | Dataview        | Displays the audited data.  |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Predictive Volume Exhaustion Monitor Creation](https://proval.itglue.com/DOC-5078775-16284178)
   - [Dataview - Volume Exhaustion Estimations [Remote Monitor]](https://proval.itglue.com/DOC-5078775-16284179)

2. Reload the system cache:
   ![Reload Cache](../../static/img/Predictive-Volume-Space-Exhaustion-Monitoring/image_1.png)

3. Debug the [Predictive Volume Exhaustion Monitor Creation](https://proval.itglue.com/DOC-5078775-16284178) script against any random client with the `Set_Environment` parameter set to `1` to create the system properties and the extra data fields used by the script. It will also remove the deprecated version of the solution from the environment.
   ![Debugging](../../static/img/Predictive-Volume-Space-Exhaustion-Monitoring/image_2.png)

4. Set the `System Properties` and `EDFs` as required.

5. Navigate to System > Configuration > Dashboard > Management > Scheduled Scripts
   - Schedule the [Predictive Volume Exhaustion Monitor Creation](https://proval.itglue.com/DOC-5078775-16284178) script to run once per day during afterhours.
   ![Schedule Script](../../static/img/Predictive-Volume-Space-Exhaustion-Monitoring/image_3.png)

## Notes

- By default, the solution will create [Volume Space Sampling](https://proval.itglue.com/DOC-5078775-16290380) monitors. The following System properties will be enabled as imported:
  - PVE_Monitoring_Server_Enable
  - PVE_Monitoring_Workstation_Enable
  - PVE_Monitoring_Server_AuditOnly
  - PVE_Monitoring_Workstation_AuditOnly
- Global settings can be overridden at the client/location or computer levels using the EDFs outlined in X document.

## FAQ

**Q:** How to enable the auditing across the entire environment?  
**A:** Setting the following system properties to `1` will enable the auditing across the entire environment:
- PVE_Monitoring_Server_Enable
- PVE_Monitoring_Workstation_Enable
- PVE_Monitoring_Server_AuditOnly
- PVE_Monitoring_Workstation_AuditOnly

Setting the `_AuditOnly` properties will enable the [Volume Space Sampling](https://proval.itglue.com/DOC-5078775-16290380) monitors instead of [Volume Space Prediction](https://proval.itglue.com/DOC-5078775-16290374). The audited data is displayed by the [Volume Exhaustion Estimations [Remote Monitor]](https://proval.itglue.com/DOC-5078775-16284179) dataview.



