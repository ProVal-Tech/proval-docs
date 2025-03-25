---
id: '92357c7e-dc65-400a-9d61-4d3243a334d4'
slug: /92357c7e-dc65-400a-9d61-4d3243a334d4
title: 'Get - Printer Driver Inventory DV'
title_meta: 'Get - Printer Driver Inventory DV'
keywords: ['printer', 'drivers', 'inventory', 'windows', 'collection']
description: 'This document outlines a script designed to collect and store information about printer drivers on Windows computers. It details the process, dependencies, and output of the script, ensuring that users can effectively manage printer driver inventories within their systems.'
tags: ['database', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script collects information about the printer drivers on the target system and stores it in the [plugin_proval_Printer_driver](<../tables/plugin_proval_Printer_driver.md>) table.

**Intended Target:** Windows Computers

## Sample Run

![Sample Run](../../../static/img/Get---Printer-Driver-Inventory-DV/image_1.png)

## Dependencies

- [CWM - Automate - Custom Table - plugin_proval_Printer_driver](<../tables/plugin_proval_Printer_driver.md>)
- [CWM - Automate - Solution - Get - Printer Driver Inventory](<../../solutions/Get - Printer Driver Inventory.md>)
- [CWM - Automate - Dataview - Printer Driver Inventory [Script]](<../dataviews/Printer Driver Inventory Script.md>)

## Variables

| Name              | Description                                                                                          |
|-------------------|------------------------------------------------------------------------------------------------------|
| InsertStatement    | Results of the PowerShell script's attempt to retrieve the [Printers Driver](https://docs.microsoft.com/en-us/powershell/module/printmanagement/get-printerdriver) information. |

## Process

1. Create the [plugin_proval_Printer_driver](<../tables/plugin_proval_Printer_driver.md>) table if it does not already exist.
2. Run the PowerShell script to retrieve information about installed printer drivers.
3. Verify the outcome.
4. Parse the outcome to ensure SQL compatibility.
5. Insert the data into the [plugin_proval_Printer_driver](<../tables/plugin_proval_Printer_driver.md>) table.
6. Log any failures.

## Output

- Script Log
- Custom Table
- Dataview


