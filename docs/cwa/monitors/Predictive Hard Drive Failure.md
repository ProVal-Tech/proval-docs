---
id: 'fbd607cd-0450-4fca-9f2c-2567a2af58d3'
title: 'EPM - Disk - Internal Monitor - Predictive Hard Drive Failure'
title_meta: 'EPM - Disk - Internal Monitor - Predictive Hard Drive Failure'
keywords: ['monitor', 'harddrive', 'failure', 'alert', 'maintenance', 'data', 'system']
description: 'The EPM - Disk - Internal Monitor - Predictive Hard Drive Failure component detects potential hard drive failures by alerting users about errors detected in the past week, enabling proactive maintenance to prevent data loss or system failure.'
tags: []
draft: false
unlisted: false
---
## Summary

The EPM - Disk - Internal Monitor - Predictive Hard Drive Failure is an internal monitor component of the solution that detects potential hard drive failures. It alerts the user about any machine where the EPM - Disk - Script - Disk - Gather Critical Data script has detected errors over the past 7 days. This monitor helps to predict potential hard drive failures and enables proactive maintenance, preventing data loss or system failure.

## Dependencies

- [EPM - Disk - Script - Disk - Gather Critical Data](<../scripts/Disk - Gather Critical Data.md>)
- [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](<./Execute Script - Disk - Gather Critical Data.md>)
- [EPM - Disk - Custom Table - plugin_proval_cdi_data](<../tables/plugin_proval_cdi_data.md>)
- [CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)

## Implementation

- Replace the `\<MONITORID>` in the Additional Condition with the ID of the monitor set.  
  Before:  
  ![Before](../../../static/img/Predictive-Hard-Drive-Failure/image_1.png)  
  After:  
  ![After](../../../static/img/Predictive-Hard-Drive-Failure/image_2.png)

## Target

Global as the monitor set is limited to the machines detected within the [EPM - Disk - Custom Table - plugin_proval_cdi_data](<../tables/plugin_proval_cdi_data.md>) table.

## Ticketing

**Subject:**  
`DRV - Predictive HDD failure detected on %COMPUTERNAME% at %CLIENTNAME%`

**Ticket Body on Failure:**  
`A predictive failure has been detected on this machine - %COMPUTERNAME% at %CLIENTNAME%  
Current Status - %RESULT%  
%FIELDNAME%`

**Ticket Body on Success:**  
`This computer is no longer detected as being a predictive failure.`

**%FIELDNAME%:**  
`The Drive information is outlined below:`  
```
Drive Manufacturer: \<Drive Manufacturer>
Drive Model: \<Drive Model>
Disk Size: \<Disk Size in GB>
Disk Interface: \<Disk Interface>
```

## Alert Template

△ Custom - Ticket Creation - Computer












