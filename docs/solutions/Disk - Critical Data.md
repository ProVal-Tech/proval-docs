---
id: '7907bbc0-a161-47b4-bd24-64aa3ccca910'
slug: /7907bbc0-a161-47b4-bd24-64aa3ccca910
title: 'Disk - Critical Data'
title_meta: 'Disk - Critical Data'
keywords: ['disk', 'data', 'gathering', 'monitor', 'performance', 'failure']
description: 'This document outlines a comprehensive solution for gathering hard drive failure data from target machines using an agnostic script. It includes the execution of the script within ConnectWise Automate, storage of data in a MySQL table, and monitoring for predictive hard drive failures, ensuring preventive maintenance of disk performance.'
tags: ['connectwise', 'database', 'performance', 'windows']
draft: false
unlisted: false
---

## Purpose

The solution summary focuses on gathering hard drive failure data from target machines using an agnostic script called EPM - Disk - Agnostic - Get-DiskInfo. This script returns a [system-object] with information about the physical disk, its performance, partitions, logical drives, and storage system. The solution also includes a ConnectWise Automate script, EPM - Disk - Script - Disk - Gather Critical Data, which executes the agnostic script and stores the data in a custom MySQL table. The data is displayed in a ConnectWise Automate dataview called CWM - Automate - Dataview - Disk - Critical Data. The solution includes two internal monitors: EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data, which runs the script once a week on Non-Virtual Windows workstations, and EPM - Disk - Internal Monitor - Predictive Hard Drive Failure, which alerts on any machine with detected errors over the past 7 days. Overall, the solution provides comprehensive data on hard drive performance and failure to aid in preventive maintenance.

## Associated Content

| Content                                                                 | Type            | Function                                                        |
|-------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------|
| [EPM - Disk - Agnostic - Get-DiskInfo](<../powershell/Get-DiskInfo.md>) | Agnostic script | PowerShell script to gather the data from the computer         |
| [EPM - Disk - Script - Disk - Gather Critical Data](<../cwa/scripts/Disk - Gather Critical Data.md>) | Automate Script  | To execute the agnostic script and fetch the data into Automate |
| [EPM - Disk - Custom Table - plugin_proval_cdi_data](<../cwa/tables/plugin_proval_cdi_data.md>) | Custom Table    | To store the data gathered by the script                        |
| [CWM - Automate - Dataview - Disk - Critical Data](<../cwa/dataviews/Disk - Critical Data.md>) | Dataview        | To display the data present in the custom table for all machines in one place |
| [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](<../cwa/monitors/Execute Script - Disk - Gather Critical Data.md>) | Internal Monitor | To execute the Automate script at a regular interval           |
| [EPM - Disk - Internal Monitor - Predictive Hard Drive Failure](<../cwa/monitors/Predictive Hard Drive Failure.md>) | Internal Monitor | To generate an alert for machines where the Automate script has detected issues |

## Implementation

- Import the [EPM - Disk - Script - Disk - Gather Critical Data](<../cwa/scripts/Disk - Gather Critical Data.md>) script.
- Import the [CWM - Automate - Dataview - Disk - Critical Data](<../cwa/dataviews/Disk - Critical Data.md>) dataview.
- Execute the script against any online Non-Virtual Windows workstation to generate the [EPM - Disk - Custom Table - plugin_proval_cdi_data](<../cwa/tables/plugin_proval_cdi_data.md>) table.
- Ensure the data for the machine is displayed in the dataview.
- Import the [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](<../cwa/monitors/Execute Script - Disk - Gather Critical Data.md>) Internal Monitor.
- Implement the [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](<../cwa/monitors/Execute Script - Disk - Gather Critical Data.md>) Internal Monitor; check the monitor's document for implementation and alert template.
- Import the [EPM - Disk - Internal Monitor - Predictive Hard Drive Failure](<../cwa/monitors/Predictive Hard Drive Failure.md>) Internal Monitor.
- Implement the [EPM - Disk - Internal Monitor - Predictive Hard Drive Failure](<../cwa/monitors/Predictive Hard Drive Failure.md>) Internal Monitor; check the monitor's document for implementation and alert template.



