---
id: '9d2c62e4-37a5-4d37-867c-c0cda13bdef9'
title: 'Collect PnP Devices Information'
title_meta: 'Collect PnP Devices Information'
keywords: ['pnp', 'devices', 'windows', 'inventory', 'script']
description: 'This document provides a detailed overview of a script designed to collect information about installed Plug and Play (PnP) devices on Windows computers and store the data in a custom table. It includes a summary of the process, dependencies, variables, and expected output.'
tags: ['database', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will collect information about the installed [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play) and store it in the custom table [Plugin_ProVal_PnpDevices](<../tables/Plugin_ProVal_PNPDevices.md>).

**Intended Target:** Windows Computers

## Sample Run

![Sample Run](../../../static/img/Get-PNPDevices-DV/image_1.png)

## Dependencies

- [CWM - Automate - Dataview - Get-PNPDevices [Script]](<../dataviews/Get-PNPDevices Script.md>)
- [CWM - Automate - Solution - PnP Devices Inventory](<../../solutions/Pnp Devices Inventory.md>)
- [CWM - Automate - Custom Table - plugin_proval_pnpdevices](<../tables/Plugin_ProVal_PNPDevices.md>)

## Variables

| Name            | Description                                                                                       |
|-----------------|---------------------------------------------------------------------------------------------------|
| InsertStatement | Result of the PowerShell script that attempts to retrieve the [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play) information |

## Process

1. Create the [Plugin_ProVal_PnpDevices](<../tables/Plugin_ProVal_PNPDevices.md>) table if it does not already exist.
2. Run the PowerShell script to retrieve information about installed [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play).
3. Verify the outcome.
4. Parse the outcome to ensure SQL compatibility.
5. Insert the data into the [Plugin_ProVal_PnpDevices](<../tables/Plugin_ProVal_PNPDevices.md>) table.
6. Log any failures.

## Output

- Script Log
- Dataview

