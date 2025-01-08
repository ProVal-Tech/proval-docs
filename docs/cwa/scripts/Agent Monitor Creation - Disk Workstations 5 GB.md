---
id: 'cwa-create-remote-monitors-for-hard-drives'
title: 'Create Remote Monitors for Detected Hard Drives'
title_meta: 'Create Remote Monitors for Detected Hard Drives'
keywords: ['remote', 'monitors', 'hard', 'drives', 'disk', 'space', 'alerts']
description: 'This document provides a detailed overview of a script designed to create remote monitors for detected hard drives at the agent level. It outlines the dependencies, variables, system properties, and the process involved in setting up disk space monitoring, including the time saved by automation and sample run images.'
tags: ['monitoring', 'disk', 'alerts', 'workstation', 'sql', 'threshold']
draft: false
unlisted: false
---
## Summary

This script creates remote monitors for detected hard drives at the agent level and sets the script state to note that the SensorID already has a monitor assigned to it.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](5078775/docs/8165873/images/11397867)

## Dependencies

- `@WorkstationDiskThreshold` - system properties.
- `@Agent Monitor Creation - Disk* - WRAPPER [Globals]`

## Variables

| Variable Name   | Description                                                                                   |
|------------------|-----------------------------------------------------------------------------------------------|
| interval         | Sets the internal and as ProVal standard it is set to 300                                    |
| MinMBytesFree    | Using system properties "WorkstationDiskThreshold" set for the monitor. In this case, it is 5000 MB |
| MinSizeMB        | The minimum size of the drive should be at least 16 GB                                       |
| reportcategory    | The report category for the alerts.                                                          |
| ticketcategory    | The ticket category will be set on the monitor so the tickets/alerts will go to the defined board |
| alerttemplate     | The alert template will be set on the remote monitor.                                        |

### System Properties

| Name                     | Example | Required | Description                                                                       |
|--------------------------|---------|----------|-----------------------------------------------------------------------------------|
| WorkstationDiskThreshold  | 5000    | True     | Workstation Disk Threshold set for the monitor. In this case, it is 5000 MB      |

### Script States

| Name                                                                 | Example | Description                                           |
|----------------------------------------------------------------------|---------|-------------------------------------------------------|
| [MonitorIDDiskSpace-@sqldriveid@](https://proval.itglue.com/5078775/docs/MonitorIDDiskSpace-@sqldriveid@) |         | To note that the SensorID already has a monitor assigned to it |

## Process

This script runs some SQL commands to create monitors for detected hard drives at the agent level and sets the script state to note that the SensorID already has a monitor assigned to it. 

**ONLY 1 LINE SHOULD BE ENABLED BELOW.**
- Line 22 - If enabled, will only work for C drives.
- Line 23 - If enabled, will work for ALL drives (Default)

**Note:** To adjust the thresholds please adjust line 7 to the desired MB free, adjust line 5 to match that (in GB), and line 18 to use the appropriate alert template for thorough disk cleanup.

The script runs as a subscript inside the "Agent Monitor Creation - Disk* - WRAPPER [Globals]" script.

## Output

Creates Disk Space Remote Monitors on the internal drives of a workstation.

