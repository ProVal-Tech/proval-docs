---
id: 'cwa_printer_driver_inventory'
title: 'Printer Driver Inventory Collection'
title_meta: 'Printer Driver Inventory Collection'
keywords: ['printer', 'drivers', 'inventory', 'windows', 'collection']
description: 'This document outlines a script designed to collect and store information about printer drivers on Windows computers. It details the process, dependencies, and output of the script, ensuring that users can effectively manage printer driver inventories within their systems.'
tags: ['windows', 'printer', 'database', 'setup', 'report']
draft: false
unlisted: false
---
## Summary

This script will collect information about the printer drivers on the target and will store it in the [plugin_proval_Printer_driver](https://proval.itglue.com/DOC-5078775-10854819) Table.

Intended Target: Windows Computers

## Sample Run

![Sample Run](5078775/docs/10854806/images/15106298)

## Dependencies

- [CWM - Automate - Custom Table - plugin_proval_Printer_driver](https://proval.itglue.com/DOC-5078775-10854819)
- [CWM - Automate - Solution - Get - Printer Driver Inventory](https://proval.itglue.com/DOC-5078775-10854823)
- [CWM - Automate - Dataview - Printer Driver Inventory [Script]](https://proval.itglue.com/DOC-5078775-10854809)

## Variables

| Name              | Description                                                                                          |
|-------------------|------------------------------------------------------------------------------------------------------|
| InsertStatement    | Results of the PowerShell script's attempt to retrieve the [Printers Driver](https://docs.microsoft.com/en-us/powershell/module/printmanagement/get-printerdriver) information. |

## Process

1. Create the [plugin_proval_Printer_driver](https://proval.itglue.com/DOC-5078775-10854819) table if it already does not exist.
2. Run the PowerShell script to retrieve information about installed Printer Drivers.
3. Verify the Outcome.
4. Parse the Outcome to ensure SQL compatibility.
5. Insert the data to the [plugin_proval_Printer_driver](https://proval.itglue.com/DOC-5078775-10854819) Table.
6. Log any Failures.

## Output

- Script Log
- Custom Table
- Dataview

