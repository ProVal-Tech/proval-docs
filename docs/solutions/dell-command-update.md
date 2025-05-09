---
id: '0e57bbbb-cc88-4183-ba7c-e67ca0918112'
slug: /0e57bbbb-cc88-4183-ba7c-e67ca0918112
title: 'Dell Command Update'
title_meta: 'Dell Command Update'
keywords: ['dell', 'update', 'execution', 'workstations', 'commands']
description: 'This document outlines the process for executing Dell Command | Update CLI commands on Dell Workstations and provides a comprehensive display of the results. It includes associated content, implementation steps, and relevant links for further assistance.'
tags: ['dell', 'installation', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

Execute the [Dell Command | Update CLI commands](https://www.dell.com/support/manuals/en-us/command-update/dellcommandupdate_rg/dell-command-%7C-update-cli-commands?guid=guid-92619086-5f7c-4a05-bce2-0d560c15e8ed&lang=en-us) against the Dell Workstations and display the results in one place.

## Associated Content

| Content                                                                                                                                                  | Type            | Function                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|----------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - ProVal - Production - Dell Command Update Handler - Run Scan Command](/docs/cbdea50e-32ca-413e-863d-bbf15836cb1b)             | Internal Monitor | Detects Dell Workstations running Windows 10 or 11, where the [Script - Dell Command Update - Install/Upgrade + Command Handler](/docs/91cc7f02-1c0d-4303-81f2-91fd0d275747) script has not executed in the past week.                                                                                                                                                                                                                                                                                      |
| △ Custom - Execute Script - Dell Command Update Handler [Scan]                                                                                         | Alert Template   | Executes the [Script - Dell Command Update - Install/Upgrade + Command Handler](/docs/91cc7f02-1c0d-4303-81f2-91fd0d275747) script against the machines detected by the [Monitor - ProVal - Development - Dell Command Update Handler - Run Scan Command](/docs/cbdea50e-32ca-413e-863d-bbf15836cb1b) monitor set.                                                                                                                                                                                    |
| [Script - Dell Command Update - Install/Upgrade + Command Handler](/docs/91cc7f02-1c0d-4303-81f2-91fd0d275747)                                   | Script           | This script uses the "Dell Command | Update" application to carry out commands on Dell Workstations. If the application isn't already installed, it will install it. If a version older than 4.3 is present, it will upgrade the application to v4.6, as only versions 4.3 and up support the "Dell Command | Update" commands.                                                                                                                                                          |
| [Dataview - Dell Command Update Handler - Audit [Script]](/docs/1a188004-4007-40dc-8c44-d64d3c0d2bb8)                                            | Dataview        | Displays the last execution result of the [Script - Dell Command Update - Install/Upgrade + Command Handler](/docs/91cc7f02-1c0d-4303-81f2-91fd0d275747) script for the Dell Workstations.                                                                                                                                                                                                                                                                                                                      |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Dell Command Update - Install/Upgrade + Command Handler](/docs/91cc7f02-1c0d-4303-81f2-91fd0d275747)
   - [Dataview - Dell Command Update Handler - Audit [Script]](/docs/1a188004-4007-40dc-8c44-d64d3c0d2bb8)
   - [Internal Monitor - ProVal - Production - Dell Command Update Handler - Run Scan Command](/docs/cbdea50e-32ca-413e-863d-bbf15836cb1b)
   - Alert Template - `△ Custom - Execute Script - Dell Command Update Handler [Scan]`

2. Reload System Cache  
   ![Reload System Cache](../../static/img/docs/91cc7f02-1c0d-4303-81f2-91fd0d275747/image_1.webp)

3. Set up the [Internal Monitor - ProVal - Production - Dell Command Update Handler - Run Scan Command](/docs/cbdea50e-32ca-413e-863d-bbf15836cb1b) with the following Alert Template:
   - `△ Custom - Execute Script - Dell Command Update Handler [Scan]`
   - Right-click the monitor and select 'Run Now and Reset Monitor' to start the auditing process.

**Note:** The systems must be compatible with the installation of Dell Command Update. For further details on compatible systems, please visit the compatible systems section of the link below:  
[Dell Command | Update Windows Universal Application | Driver Details | Dell US](https://www.dell.com/support/home/en-us/drivers/DriversDetails?driverId=0XNVX)