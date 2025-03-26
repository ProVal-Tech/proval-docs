---
id: '485b0ab5-8ce4-400c-9ba6-dff7967988aa'
slug: /485b0ab5-8ce4-400c-9ba6-dff7967988aa
title: 'Get - Printer Driver Inventory'
title_meta: 'Get - Printer Driver Inventory'
keywords: ['printer', 'driver', 'inventory', 'automate', 'script']
description: 'This document provides a comprehensive guide on how to pull installed print driver version information into ConnectWise Automate. It includes associated scripts, custom tables, and dataviews necessary for effective implementation and troubleshooting.'
tags: ['installation', 'networking', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution will pull installed print driver version information into Automate.

## Associated Content

| Content                                                                                       | Type         | Function                                                                                                                                                                                                                     |
|-----------------------------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](/docs/92357c7e-dc65-400a-9d61-4d3243a334d4) | Script       | This script will collect information about the printer drivers and store it in the [plugin_proval_Printer_driver](/docs/21b8a07c-6756-415e-93c0-97e7eca8dbae) table.                                                 |
| [CWM - Automate - Custom Table - plugin_proval_Printer_driver](/docs/21b8a07c-6756-415e-93c0-97e7eca8dbae) | Custom Table | To store the data collected by the [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](/docs/92357c7e-dc65-400a-9d61-4d3243a334d4) script in order to feed into the [CWM - Automate - Dataview - Printer Driver Inventory [Script]](<../cwa/dataviews/Printer Driver Inventory Script.md>) dataview. |
| [CWM - Automate - Dataview - Printer Driver Inventory [Script]](<../cwa/dataviews/Printer Driver Inventory Script.md>) | Dataview     | The dataview is required to display installed [Printer Driver](https://www.technipages.com/definition/printer-driver) information. The data is populated by the [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](/docs/92357c7e-dc65-400a-9d61-4d3243a334d4) script. |

## Implementation

- Import the [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](/docs/92357c7e-dc65-400a-9d61-4d3243a334d4) script.
- Import the [CWM - Automate - Dataview - Printer Driver Inventory [Script]](<../cwa/dataviews/Printer Driver Inventory Script.md>) dataview.
- Run the script against an online Windows computer to create the table.
- Schedule the script to run once per week or bi-weekly against the managed Windows machines.

## FAQ

**Q:** The dataview is not populating anything after running the script for the first time.  
**A:** It's most likely due to permissions. Try running the [CWM - Automate - Script - Update User Permissions for ProVal Custom Tables](/docs/7819fc75-aeae-457b-a451-59221396e900) script.


