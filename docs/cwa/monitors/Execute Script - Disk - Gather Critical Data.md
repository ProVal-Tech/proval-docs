---
id: '9568d3f6-e271-45c8-9554-3a476f7eb5e4'
title: 'EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data'
title_meta: 'EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data'
keywords: ['disk', 'monitor', 'performance', 'data', 'windows', 'mysql']
description: 'The EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data is a ConnectWise Automate component designed to run a script on non-virtual Windows workstations weekly. It gathers critical disk data, analyzes performance, and stores results in a MySQL table for proactive monitoring.'
tags: ['mysql', 'performance', 'windows']
draft: false
unlisted: false
---

## Summary

The EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data is an internal monitor component of the solution that runs the EPM - Disk - Script - Disk - Gather Critical Data script on non-virtual Windows workstations once a week. This script executes the EPM - Disk - Agnostic - Get-DiskInfo script, which gathers data about the physical disk, its performance, partitions, logical drives, and storage system. The monitor batches the process to run on 100 machines per hour and attempts to run the script twice a week on any computer identified by the monitor. The data gathered is stored in a custom MySQL table and displayed in a ConnectWise Automate dataview. The EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data component enables the user to monitor and analyze the hard drive's performance, proactively identifying issues before they result in failure.

## Implementation

- Replace the `\\<MONITORID>` in the Additional Condition with the ID of the monitor set.  

  Before:  
  ![Before](../../../static/img/Execute-Script---Disk---Gather-Critical-Data/image_1.png)  

  After:  
  ![After](../../../static/img/Execute-Script---Disk---Gather-Critical-Data/image_2.png)  

- Set the appropriate groups under the monitor target section. Suggested are Managed Windows Workstations group(s).  
  ![Groups](../../../static/img/Execute-Script---Disk---Gather-Critical-Data/image_3.png)  

## Dependencies

- [EPM - Disk - Script - Disk - Gather Critical Data](<../scripts/Disk - Gather Critical Data.md>)  
- [EPM - Disk - Custom Table - plugin_proval_cdi_data](<../tables/plugin_proval_cdi_data.md>)  
- [CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)  

## Target

Managed Windows Workstations

## Alert Template

△ Custom - Autofix - Initiate script - Disk - Gather Critical Data  

Note: The alert template must be running the [EPM - Disk - Script - Disk - Gather Critical Data](<../scripts/Disk - Gather Critical Data.md>) script.

