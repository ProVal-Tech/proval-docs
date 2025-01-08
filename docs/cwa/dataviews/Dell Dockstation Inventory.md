---
id: 'cwa-dockstations-inventory'
title: 'Dockstations Inventory for Dell Workstations'
title_meta: 'Dockstations Inventory for Dell Workstations'
keywords: ['dockstations', 'inventory', 'dell', 'workstations', 'monitoring']
description: 'This document provides an overview of the available Dockstations Inventory for Dell Workstations, including details on dependencies, columns, and descriptions gathered by the Get-DellDockStation script.'
tags: ['inventory', 'dell', 'monitoring', 'client', 'location', 'operating-system', 'bios', 'dock', 'installation', 'manufacture', 'script']
draft: false
unlisted: false
---
## Summary

This dataview populates the available Dockstations Inventory for the Dell Workstations that has been gathered by the [Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073374).

## Dependencies

- [CWM - Automate - Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073374)
- [CWM - Automate - Internal Monitor - Execute Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073356)

## Columns

| Column               | Description                                        |
|---------------------|----------------------------------------------------|
| computerid          | Computerid of the machine                          |
| Machine Name        | Name of the Machine                                |
| Client              | Client Name                                        |
| Location            | Location Name                                      |
| Operating System    | Operating System of the machine                    |
| LastContact         | The last Contact of the machine                    |
| BiosName            | BiosName of the Machine                            |
| BiosMFG             | Manufacturer of the machine                        |
| Dock Manufacturer    | Manufacturer of the Dockstation                    |
| Dock Model          | Model of the Dockstation                            |
| Dock SerialNumber   | SerialNumber of the Dockstation                    |
| Dock Version        | Version of the Dockstation                          |
| Dock Description     | Description of Dockstation                          |
| Install Date        | Dockstation install date                           |
| Manufacture Date    | Manufacture Date of DockStation                    |
| Dock Name           | Name of Dockstation                                |
| Script Last Ran     | Last Time the [CWM - Automate - Script - Get-DellDockStation](https://proval.itglue.com/DOC-5078775-15073374) executed on the machine |

