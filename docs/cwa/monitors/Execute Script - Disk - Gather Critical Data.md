---
id: 'cwa-epm-disk-internal-monitor-execute-script'
title: 'EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data'
title_meta: 'EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data'
keywords: ['disk', 'monitor', 'performance', 'data', 'windows', 'mysql']
description: 'The EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data is a ConnectWise Automate component designed to run a script on Non-Virtual Windows workstations weekly. It gathers critical disk data, analyzes performance, and stores results in a MySQL table for proactive monitoring.'
tags: ['monitoring', 'performance', 'windows', 'mysql', 'data']
draft: false
unlisted: false
---
## Summary

The EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data is an internal monitor component of the solution that runs the EPM - Disk - Script - Disk - Gather Critical Data script on Non-Virtual Windows workstations once a week. This script executes the EPM - Disk - Agnostic - Get-DiskInfo script, which gathers data about the physical disk, its performance, partitions, logical drives, and storage system. The monitor batches the process to run on 100 machines per hour and attempts to run the script twice a week on any computer identified by the monitor. The data gathered is stored in a custom MySQL table and displayed in a ConnectWise Automate dataview. The EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data component enables the user to monitor and analyze the hard drive's performance, proactively identifying issues before they result in failure.

## Implementation

- Replace the `<MONITORID>` in the Additional Condition with the ID of the monitor set.  
  
  Before:  
  ![Before](5078775/docs/12662477/images/17942675)  
  
  After:  
  ![After](5078775/docs/12662477/images/17942745)  

- Set the appropriate groups under the monitor target section. Suggested are Managed Windows Workstations group(s).  
  ![Groups](5078775/docs/12662477/images/17942779)  

## Dependencies

- [EPM - Disk - Script - Disk - Gather Critical Data](https://proval.itglue.com/DOC-5078775-10677468)  
- [EPM - Disk - Custom Table - plugin_proval_cdi_data](https://proval.itglue.com/DOC-5078775-9371714)  
- [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338)  

## Target

Managed Windows Workstations

## Alert Template

△ Custom - Autofix - Initiate script - Disk - Gather Critical Data  

Note: The alert template must be running the [EPM - Disk - Script - Disk - Gather Critical Data](https://proval.itglue.com/DOC-5078775-10677468) script.

