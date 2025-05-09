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
| [EPM - Disk - Agnostic - Get-DiskInfo](/docs/5cba460d-9322-4c3b-9630-55cb46d57b1a) | Agnostic script | PowerShell script to gather the data from the computer         |
| [EPM - Disk - Script - Disk - Gather Critical Data](/docs/687261c3-e6d7-46bc-84f6-506007d47142) | Automate Script  | To execute the agnostic script and fetch the data into Automate |
| [EPM - Disk - Custom Table - plugin_proval_cdi_data](/docs/7a224177-45ff-4f2e-a8fe-a734a642a539) | Custom Table    | To store the data gathered by the script                        |
| [CWM - Automate - Dataview - Disk - Critical Data](/docs/8a8b76b2-aa25-419c-b193-aa98f54ef274) | Dataview        | To display the data present in the custom table for all machines in one place |
| [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](/docs/9568d3f6-e271-45c8-9554-3a476f7eb5e4) | Internal Monitor | To execute the Automate script at a regular interval           |
| [EPM - Disk - Internal Monitor - Predictive Hard Drive Failure](/docs/fbd607cd-0450-4fca-9f2c-2567a2af58d3) | Internal Monitor | To generate an alert for machines where the Automate script has detected issues |

## Implementation

- Import the [EPM - Disk - Script - Disk - Gather Critical Data](/docs/687261c3-e6d7-46bc-84f6-506007d47142) script.
- Import the [CWM - Automate - Dataview - Disk - Critical Data](/docs/8a8b76b2-aa25-419c-b193-aa98f54ef274) dataview.
- Execute the script against any online Non-Virtual Windows workstation to generate the [EPM - Disk - Custom Table - plugin_proval_cdi_data](/docs/7a224177-45ff-4f2e-a8fe-a734a642a539) table.
- Ensure the data for the machine is displayed in the dataview.
- Import the [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](/docs/9568d3f6-e271-45c8-9554-3a476f7eb5e4) Internal Monitor.
- Implement the [EPM - Disk - Internal Monitor - Execute Script - Disk - Gather Critical Data](/docs/9568d3f6-e271-45c8-9554-3a476f7eb5e4) Internal Monitor; check the monitor's document for implementation and alert template.
- Import the [EPM - Disk - Internal Monitor - Predictive Hard Drive Failure](/docs/fbd607cd-0450-4fca-9f2c-2567a2af58d3) Internal Monitor.
- Implement the [EPM - Disk - Internal Monitor - Predictive Hard Drive Failure](/docs/fbd607cd-0450-4fca-9f2c-2567a2af58d3) Internal Monitor; check the monitor's document for implementation and alert template.

