---
id: '06e1e902-b204-498e-a31f-9de7879c528e'
title: 'Update Orchestrator Bouncer'
title_meta: 'Update Orchestrator Bouncer'
keywords: ['update', 'orchestrator', 'bouncer', 'windows', 'script', 'patching']
description: 'This document provides instructions on how to implement the Update Orchestrator Bouncer script, which attempts to disable the update orchestrator solution on Windows endpoints by renaming or removing specific directories. It includes details on manual execution, dependencies, and deployment methods.'
tags: ['patching', 'windows']
draft: false
unlisted: false
---

## Summary

This script will attempt to "neuter" the update orchestrator solution on endpoints by renaming or removing a directory.

## Manual Run

This script does not have any parameters and can be run against any online Windows device.

## Dependencies

None. This script can be run against any Windows device.

## Create Script

**Update Orchestrator Bouncer**

To implement this script, please create a new "PowerShell" style script in the system.

![Image 1](../../../static/img/Update-Orchestrator-Bouncer/image_6.png)  
![Image 2](../../../static/img/Update-Orchestrator-Bouncer/image_7.png)  

- **Name:** Update Orchestrator Bouncer  
- **Description:** Will attempt to "neuter" the update orchestrator solution on endpoints by renaming or removing a directory.  
- **Category:** Patching  

![Image 3](../../../static/img/Update-Orchestrator-Bouncer/image_8.png)  

## Script

![Image 4](../../../static/img/Update-Orchestrator-Bouncer/image_9.png)  
Paste the below PowerShell script directly into the "Script" field.

```
$RebootPath = 'C://Windows//System32//Tasks//Microsoft//Windows//UpdateOrchestrator//reboot'
$BakPath = 'C://Windows//System32//Tasks//Microsoft//Windows//UpdateOrchestrator//reboot.bak'
if (Test-Path $RebootPath) {
    if (Test-Path $BakPath) {
        Remove-Item -Path $BakPath -Force -Confirm:$False
    }
    Move-Item -Path $RebootPath -Destination $BakPath -Force -Confirm:$False
    return 'Renamed the Reboot File'
} else {
    return 'Reboot File Not Found'
}
```

## Script Deployment

The script is intended to run from the ["CW RMM - Custom Monitor - Update Orchestrator Bouncer"](https://proval.itglue.com/5078775/docs/13460540#version=published&amp;documentMode=edit) monitor as the "Run Automated Task."

This script can also run manually against any Windows-based device.

## Output

- Script log
