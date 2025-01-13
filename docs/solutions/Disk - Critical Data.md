---
id: 'cwa-disk-critical-data-gathering'
title: 'Disk Critical Data Gathering Solution'
title_meta: 'Disk Critical Data Gathering Solution'
keywords: ['disk', 'data', 'gathering', 'monitor', 'performance', 'failure']
description: 'This document outlines a comprehensive solution for gathering hard drive failure data from target machines using an agnostic script. It includes the execution of the script within ConnectWise Automate, storage of data in a MySQL table, and monitoring for predictive hard drive failures, ensuring preventive maintenance of disk performance.'
tags: ['connectwise', 'database', 'monitoring', 'performance', 'windows']
draft: false
unlisted: false
---
## Purpose

The solution summary focuses on gathering hard drive failure data from target machines using an agnostic script called EPM - Disk - Agnostic - Get-DiskInfo. This script returns a [system-object] with information about the physical disk, its performance, partitions, logical drives, and storage system. The solution also includes a ConnectWise Automate script, EPM - Disk - Script - Disk - Gather Critical Data, which executes the agnostic script and stores the data in a custom MySQL table. The data is displayed in a ConnectWise Automate dataview called CWM - Automate - Dataview - Disk - Critical Data. The solution also includes two internal monitors: EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data, which runs the script once a week on Non-Virtual Windows workstations, and EPM - Disk - Internal Monitor - Predictive Hard Drive Failure, which alerts on any machine with detected errors over the past 7 days. Overall, the solution provides comprehensive data on hard drive performance and failure to aid in preventive maintenance.

## Associated Content

| Content                                                                 | Type            | Function                                                        |
|-------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------|
| [EPM - Disk - Agnostic - Get-DiskInfo](https://proval.itglue.com/DOC-5078775-10677479) | Agnostic script | PowerShell script to gather the data from the computer         |
| [EPM - Disk - Script - Disk - Gather Critical Data](https://proval.itglue.com/DOC-5078775-10677468) | Automate Script  | To execute the agnostic script and to fetch the data into Automate |
| [EPM - Disk - Custom Table - plugin_proval_cdi_data](https://proval.itglue.com/DOC-5078775-9371714) | Custom Table    | To store the data gathered by the script                        |
| [CWM - Automate - Dataview - Disk - Critical Data](https://proval.itglue.com/DOC-5078775-9374639) | Dataview        | To display the data present in the custom table for all the machines at a single place |
| [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](https://proval.itglue.com/DOC-5078775-12662477) | Internal Monitor | To execute the Automate script at a regular interval           |
| [EPM - Disk - Internal Monitor - Predictive Hard Drive Failure](https://proval.itglue.com/DOC-5078775-12662475) | Internal Monitor | To generate an alert for the machines where the Automate script had detected issues |

## Implementation

- Import the [EPM - Disk - Script - Disk - Gather Critical Data](https://proval.itglue.com/DOC-5078775-10677468) script.
- Import the [CWM - Automate - Dataview - Disk - Critical Data](https://proval.itglue.com/DOC-5078775-9374639) dataview.
- Execute the script against any online Non-Virtual Windows Workstation to generate the [EPM - Disk - Custom Table - plugin_proval_cdi_data](https://proval.itglue.com/DOC-5078775-9371714) table.
- Ensure the data for the machine is displayed in the dataview.
- Import the [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](https://proval.itglue.com/DOC-5078775-12662477) Internal Monitor.
- Implement the [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](https://proval.itglue.com/DOC-5078775-12662477) Internal Monitor, check the monitor's document for implementation and alert template.
- Import the [EPM - Disk - Internal Monitor - Predictive Hard Drive Failure](https://proval.itglue.com/DOC-5078775-12662475) Internal Monitor.
- Implement the [EPM - Disk - Internal Monitor - Predictive Hard Drive Failure](https://proval.itglue.com/DOC-5078775-12662475) Internal Monitor, check the monitor's document for implementation and alert template.



