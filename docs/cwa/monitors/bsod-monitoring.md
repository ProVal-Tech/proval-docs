---
id: '31b19c20-52f0-491d-a2d0-7827cf8723a0'
title: 'BSOD Monitoring'
title_meta: 'BSOD Monitoring'
keywords: ['BSOD', 'bluescreen', 'crashdump']
description: 'This remote monitor is designed to detect the agent where the BSOD has been detected in the past one hour.'
tags: ['bluescreen', 'alerting', 'application']
draft: false
unlisted: false
---

## Summary

This remote monitor is designed to detect the agent where the BSOD has been detected in the past one hour.

## Details

**Suggested "Limit to"**: `BSOD Monitoring (Searches)`

**Suggested Alert Style**: `Once`

**Suggested Alert Template**: `△ Custom - Ticket Creation - Computer`


| Check Action | Server Address | Check Type | Comparator | Interval | Result |
| ------------ | -------------- | ---------- | ---------- | -------- | ------ |
|   System     | 127.0.0.1      | Run File  | Does Not Contain | 3600 | Unhealthy |

## Dependencies
##### EDFs:

| Name | Type | Level | Section | Description | 
| ---- | ---- | ----- | ------- | ----------- | 
| BSOD Monitoring | Checkbox | Client | Monitoring | This EDF needs to be checked for the BSOD monitoring trigger because the monitor is limited to the search that is bound to it. | 
| BSOD Monitoring Exclude | Checkbox | Location | Exclusion | If this EDF is checked, then the location will be excluded from the BSOD monitoring. | 
| BSOD Monitoring Exclude | Checkbox | Computer | Exclusion | If this EDF is checked, then the computer will be excluded from the BSOD monitoring. |

## Target

Windows Machines: Should be run on all Windows machines.

Machines with client-EDF "BSOD Monitoring" checked should be applied to the remote monitor limit.

## Ticketing

##### Subject

Unhealthy - BSOD detected on %clientname%\%computername%

##### Body

Unhealthy - BSOD status %STATUS% on %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME% result %RESULT%. Refer to the csv file at path  "C:\ProgramData\_automation\script\BlueScreen\Export.csv" for more details.

## Implementation

Please follow the below document for importing the remote monitor with its pre-requisites.
- [import-remote-monitor-bsod-monitoring](<./import-remote-monitor-bsod-monitoring.md>)
