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
| [Script - Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0)             | Script        | Detects the Dell Dockstation on the Dell Workstations               |
| [Internal Monitor - Execute Script - Get-DellDockStation](/docs/131057f0-24aa-418c-90f7-b0f316a5b9a8) | Monitor       | Executes the [Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0) script once every 2 days |
| [Dataview - Dell Dockstation Inventory](/docs/8551929f-3af4-45ac-9edf-00f733193d56) | Dataview      | Populates the available Dockstations Inventory for the Dell Workstations |
| `△ Custom - Execute Script - Get-DellDockStation`                                     | Alert Template | This alert template is used with the monitor [Execute Script - Get-DellDockStation](/docs/131057f0-24aa-418c-90f7-b0f316a5b9a8) to run the script [Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0) as an autofix. |

## Implementation

1. Import the following contents from the `ProSync` plugin:
   - [Script - Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0)
   - [Internal Monitor - Execute Script - Get-DellDockStation](/docs/131057f0-24aa-418c-90f7-b0f316a5b9a8)
   - [Dataview - Dell Dockstation Inventory](/docs/8551929f-3af4-45ac-9edf-00f733193d56)
   - Alert Template - `△ Custom - Execute Script - Get-DellDockStation`

2. ![Image](../../static/img/docs/2e4ec512-945a-4b3d-ba18-53553b08f4ca/image_1.webp)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - Get-DellDockStation](/docs/131057f0-24aa-418c-90f7-b0f316a5b9a8)
       - `△ Custom - Execute Script - Get-DellDockStation`
       - Right-click and select "Run Now" to start the monitor.
