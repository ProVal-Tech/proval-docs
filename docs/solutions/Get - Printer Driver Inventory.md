---
id: '485b0ab5-8ce4-400c-9ba6-dff7967988aa'
title: 'Printer Driver Inventory in Automate'
title_meta: 'Printer Driver Inventory in Automate'
keywords: ['printer', 'driver', 'inventory', 'automate', 'script']
description: 'This document provides a comprehensive guide on how to pull installed print driver version information into ConnectWise Automate. It includes associated scripts, custom tables, and dataviews necessary for effective implementation and troubleshooting.'
tags: ['installation', 'networking', 'report', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

This Solution will pull installed print driver version information into Automate.

## Associated Content

| Content                                                                                       | Type         | Function                                                                                                                                                                                                                     |
|-----------------------------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](<../cwa/scripts/Get - Printer Driver Inventory DV.md>) | Script       | This script will collect information about the printer drivers and will store it in the [plugin_proval_Printer_driver](<../cwa/tables/plugin_proval_Printer_driver.md>) Table.                                                 |
| [CWM - Automate - Custom Table - plugin_proval_Printer_driver](<../cwa/tables/plugin_proval_Printer_driver.md>) | Custom Table | To store the data grabbed by [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](<../cwa/scripts/Get - Printer Driver Inventory DV.md>) script in order to feed into the [CWM - Automate - Dataview - Printer Driver Inventory [Script]](<../cwa/dataviews/Printer Driver Inventoy Script.md>) dataview. |
| [CWM - Automate - Dataview - Printer Driver Inventory [Script]](<../cwa/dataviews/Printer Driver Inventoy Script.md>) | Dataview     | The Dataview was required to display installed [Printer Driver](https://www.technipages.com/definition/printer-driver) information. The data is being populated by the [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](<../cwa/scripts/Get - Printer Driver Inventory DV.md>) script. |

## Implementation

- Import the [CWM - Automate - Script - Get - Printer Driver Inventory [DV]](<../cwa/scripts/Get - Printer Driver Inventory DV.md>) script.
- Import the [CWM - Automate - Dataview - Printer Driver Inventory [Script]](<../cwa/dataviews/Printer Driver Inventoy Script.md>) dataview.
- Run the script against an online windows computer to create the table.
- Schedule the script to run once per week or bi-weekly against the Managed Windows Machines.

## FAQ

**Q:** The dataview is not populating anything after running the script for the first time.  
**A:** It's most probably because of the permissions, try running [CWM - Automate - Script - Update User Permissions for ProVal Custom Tables](<../cwa/scripts/MySQL - Permission - Set Custom Table Permissions.md>) script.












