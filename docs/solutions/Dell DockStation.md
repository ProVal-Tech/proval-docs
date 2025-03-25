---
id: '2e4ec512-945a-4b3d-ba18-53553b08f4ca'
slug: /2e4ec512-945a-4b3d-ba18-53553b08f4ca
title: 'Dell DockStation'
title_meta: 'Dell DockStation'
keywords: ['dell', 'dockstation', 'workstation', 'inventory', 'monitor']
description: 'This document outlines the steps to detect Dell Dockstation on Dell workstations using associated scripts and monitors. It provides a comprehensive guide on implementation and configuration for effective detection and inventory management.'
tags: ['software']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to detect Dell Dockstation on Dell workstations.

## Associated Content

| Content                                                                                 | Type          | Function                                                             |
|-----------------------------------------------------------------------------------------|---------------|----------------------------------------------------------------------|
| [Script - Get-DellDockStation](<../cwa/scripts/Get-DellDockStation.md>)             | Script        | Detects the Dell Dockstation on the Dell Workstations               |
| [Internal Monitor - Execute Script - Get-DellDockStation](<../cwa/monitors/Execute Script - Get-DellDockStation.md>) | Monitor       | Executes the [Get-DellDockStation](<../cwa/scripts/Get-DellDockStation.md>) script once every 2 days |
| [Dataview - Dell Dockstation Inventory](<../cwa/dataviews/Dell Dockstation Inventory.md>) | Dataview      | Populates the available Dockstations Inventory for the Dell Workstations |
| `△ Custom - Execute Script - Get-DellDockStation`                                     | Alert Template | This alert template is used with the monitor [Execute Script - Get-DellDockStation](<../cwa/monitors/Execute Script - Get-DellDockStation.md>) to run the script [Get-DellDockStation](<../cwa/scripts/Get-DellDockStation.md>) as an autofix. |

## Implementation

1. Import the following contents from the `ProSync` plugin:
   - [Script - Get-DellDockStation](<../cwa/scripts/Get-DellDockStation.md>)
   - [Internal Monitor - Execute Script - Get-DellDockStation](<../cwa/monitors/Execute Script - Get-DellDockStation.md>)
   - [Dataview - Dell Dockstation Inventory](<../cwa/dataviews/Dell Dockstation Inventory.md>)
   - Alert Template - `△ Custom - Execute Script - Get-DellDockStation`

2. ![Image](../../static/img/Dell-DockStation/image_1.png)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - Get-DellDockStation](<../cwa/monitors/Execute Script - Get-DellDockStation.md>)
       - `△ Custom - Execute Script - Get-DellDockStation`
       - Right-click and select "Run Now" to start the monitor.


