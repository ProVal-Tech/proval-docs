---
id: '2e4ec512-945a-4b3d-ba18-53553b08f4ca'
title: 'Detect Dell Dockstation on Dell Workstations'
title_meta: 'Detect Dell Dockstation on Dell Workstations'
keywords: ['dell', 'dockstation', 'workstation', 'inventory', 'monitor']
description: 'This document outlines the steps to detect Dell Dockstation on Dell workstations using associated scripts and monitors. It provides a comprehensive guide on implementation and configuration for effective detection and inventory management.'
tags: ['configuration', 'monitor', 'inventory', 'alert', 'software']
draft: false
unlisted: false
---
## Purpose

The purpose of this solution is to detect Dell Dockstation on Dell workstations.

## Associated Content

| Content                                                                                 | Type    | Function                                                             |
|-----------------------------------------------------------------------------------------|---------|----------------------------------------------------------------------|
| [Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073374)       | Script  | Detects the Dell Dockstation on the Dell Workstations               |
| [Internal Monitor - Execute Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073356) | Monitor | Executes the [Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073374) script once per 02 days |
| [Dataview - Dell Dockstation Inventory](https://proval.itglue.com/DOC-5078775-15073363) | Dataview | Populates the available Dockstations Inventory for the Dell Workstations |
| `△ Custom - Execute Script - Get-DellDockStation`                                     | Alert Template | This alert template is used with monitor [Execute Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073356) to run script [Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073374) as an autofix. |

## Implementation

1. Import the following contents from `ProSync` plugin:
   - [Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073374)
   - [Internal Monitor - Execute Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073356)
   - [Dataview - Dell Dockstation Inventory](https://proval.itglue.com/DOC-5078775-15073363)
   - Alert Template - `△ Custom - Execute Script - Get-DellDockStation`

2. ![Image](../../static/img/Dell-DockStation/image_1.png)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Internal Monitor - Execute Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073356)
       - `△ Custom - Execute Script - Get-DellDockStation`
       - Right-click and Run Now to start the monitor.






