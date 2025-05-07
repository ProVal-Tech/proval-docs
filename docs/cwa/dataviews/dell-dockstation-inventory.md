---
id: '8551929f-3af4-45ac-9edf-00f733193d56'
slug: /8551929f-3af4-45ac-9edf-00f733193d56
title: 'Dell Dockstation Inventory'
title_meta: 'Dell Dockstation Inventory'
keywords: ['dockstations', 'inventory', 'dell', 'workstations', 'monitoring']
description: 'This document provides an overview of the available Dockstations Inventory for Dell Workstations, including details on dependencies, columns, and descriptions gathered by the Get-DellDockStation script.'
tags: ['bios', 'dell', 'installation']
draft: false
unlisted: false
---

## Summary

This dataview populates the available Dockstations Inventory for the Dell Workstations that has been gathered by the [Script - Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0).

## Dependencies

- [CWM - Automate - Script - Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0)
- [CWM - Automate - Internal Monitor - Execute Script - Get-DellDockStation](/docs/131057f0-24aa-418c-90f7-b0f316a5b9a8)

## Columns

| Column               | Description                                        |
|---------------------|----------------------------------------------------|
| computerid          | Computer ID of the machine                         |
| Machine Name        | Name of the machine                                |
| Client              | Client name                                        |
| Location            | Location name                                      |
| Operating System    | Operating system of the machine                    |
| Last Contact        | The last contact of the machine                    |
| Bios Name           | BIOS name of the machine                           |
| Bios MFG            | Manufacturer of the machine                        |
| Dock Manufacturer    | Manufacturer of the dockstation                    |
| Dock Model          | Model of the dockstation                            |
| Dock Serial Number   | Serial number of the dockstation                   |
| Dock Version        | Version of the dockstation                          |
| Dock Description     | Description of the dockstation                      |
| Install Date        | Dockstation install date                           |
| Manufacture Date    | Manufacture date of the dockstation                |
| Dock Name           | Name of the dockstation                            |
| Script Last Ran     | Last time the [CWM - Automate - Script - Get-DellDockStation](/docs/910bdf04-c4ab-413d-a1a6-aafcd6d583d0) executed on the machine |
