---
id: '899b54a9-001d-4d76-8735-fb436c2fc9c1'
slug: /899b54a9-001d-4d76-8735-fb436c2fc9c1
title: 'Printer Driver Inventoy Script'
title_meta: 'Printer Driver Inventoy Script'
keywords: ['printer', 'driver', 'inventory', 'dataview', 'script']
description: 'This document provides an overview of the Dataview that displays installed Printer Driver information obtained from the CWM - Automate - Script - Get - Printer Driver Inventory [DV] script. It includes details about dependencies and the columns available in the Dataview for better management and reporting of printer drivers across client systems.'
tags: ['report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The Dataview displays the installed [Printer Driver](https://www.technipages.com/definition/printer-driver) information obtained by the [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](/docs/92357c7e-dc65-400a-9d61-4d3243a334d4) script.

## Dependencies

- [CWM - Automate - Custom Table - plugin_proval_Printer_driver](/docs/21b8a07c-6756-415e-93c0-97e7eca8dbae)
- [CWM - Automate - Solution - Get - Printer Driver Inventory](/docs/485b0ab5-8ce4-400c-9ba6-dff7967988aa)
- [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](/docs/92357c7e-dc65-400a-9d61-4d3243a334d4)

## Columns

| Column                 | Description                                           |
|-----------------------|-------------------------------------------------------|
| Client Name           | Client Name                                          |
| Location Name         | Location Name                                        |
| Computer Name         | Computer Name                                        |
| Operating System      | Operating System                                     |
| OS Type               | Whether Server or Workstation                         |
| Chassis               | Whether Physical Machine/Virtual Machine/Laptop      |
| Printer Name          | Printer Name                                         |
| Printer Environment    | Printer Environment, e.g., Windows x64 or Windows x86|
| Manufacturer          | Printer Manufacturer                                  |
| Driver Version        | Printer Driver Version                                |
| Script Run Time       | Last run time of [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](/docs/92357c7e-dc65-400a-9d61-4d3243a334d4) |
| Last Contact          | Last Contact with RMM                                |
| Days Since Last Contact| Days Since Last Contact with RMM                     |


