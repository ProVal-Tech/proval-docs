---
id: '9568d3f6-e271-45c8-9554-3a476f7eb5e4'
slug: /9568d3f6-e271-45c8-9554-3a476f7eb5e4
title: 'Execute Script - Disk - Gather Critical Data'
title_meta: 'Execute Script - Disk - Gather Critical Data'
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
  ![Before](../../../static/img/docs/9568d3f6-e271-45c8-9554-3a476f7eb5e4/image_1.png)  

  After:  
  ![After](../../../static/img/docs/9568d3f6-e271-45c8-9554-3a476f7eb5e4/image_2.png)  

- Set the appropriate groups under the monitor target section. Suggested are Managed Windows Workstations group(s).  
  ![Groups](../../../static/img/docs/9568d3f6-e271-45c8-9554-3a476f7eb5e4/image_3.png)  

## Dependencies

- [EPM - Disk - Script - Disk - Gather Critical Data](/docs/687261c3-e6d7-46bc-84f6-506007d47142)  
- [EPM - Disk - Custom Table - plugin_proval_cdi_data](/docs/7a224177-45ff-4f2e-a8fe-a734a642a539)  
- [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035)  

## Target

Managed Windows Workstations

## Alert Template

△ Custom - Autofix - Initiate script - Disk - Gather Critical Data  

Note: The alert template must be running the [EPM - Disk - Script - Disk - Gather Critical Data](/docs/687261c3-e6d7-46bc-84f6-506007d47142) script.

