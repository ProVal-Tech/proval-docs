---
id: 'f92a5e4c-9ade-4cb9-ba9f-4e8b7d6ae0da'
slug: /f92a5e4c-9ade-4cb9-ba9f-4e8b7d6ae0da
title: 'Pnp Devices Inventory'
title_meta: 'Pnp Devices Inventory'
keywords: ['pnp', 'devices', 'automate', 'information', 'script', 'dataview']
description: 'This document provides detailed instructions on how to display information about Plug and Play (PnP) devices in ConnectWise Automate. It includes associated scripts and custom tables necessary for implementation, as well as troubleshooting tips for common issues.'
tags: ['database', 'installation', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

Displays detailed information on [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play) in Automate.

## Associated Content

| Content                                                                                   | Type          | Function                                                                                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Get-PNPDevices [DV]](/docs/9d2c62e4-37a5-4d37-867c-c0cda13bdef9) | Script        | This script collects information about the installed [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play) and stores it in the custom table [Plugin_ProVal_PnpDevices](/docs/d0d38e82-7faf-4e0f-86b3-81b01a9f18fb). |
| [CWM - Automate - Custom Table - plugin_proval_pnpdevices](/docs/d0d38e82-7faf-4e0f-86b3-81b01a9f18fb) | Custom Table  | To store the data collected by the [CWM - Automate - Script - Get-PNPDevices [DV]](/docs/9d2c62e4-37a5-4d37-867c-c0cda13bdef9) script in order to feed into the [CWM - Automate - Dataview - Get-PNPDevices [Script]](/docs/f0f7231c-f13b-46a0-baa6-aebb8640adaf) dataview. |
| [CWM - Automate - Dataview - Get-PNPDevices [Script]](/docs/f0f7231c-f13b-46a0-baa6-aebb8640adaf) | Dataview      | This dataview is required to display [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play) information. The data is populated by the [CWM - Automate - Script - Get-PNPDevices [DV]](/docs/9d2c62e4-37a5-4d37-867c-c0cda13bdef9) script. |

## Implementation

- Import the [CWM - Automate - Script - Get-PNPDevices [DV]](/docs/9d2c62e4-37a5-4d37-867c-c0cda13bdef9) script.
- Import the [CWM - Automate - Dataview - Get-PNPDevices [Script]](/docs/f0f7231c-f13b-46a0-baa6-aebb8640adaf) dataview.
- Run the script against an online Windows computer to create the table.
- Schedule the script to run at regular intervals against the desired computers to keep the dataview up to date.

## FAQ

**Q:** The dataview is not populating anything after running the script for the first time.  
**A:** It's most likely due to permissions. Try running the [CWM - Automate - Script - Update User Permissions for ProVal Custom Tables](/docs/7819fc75-aeae-457b-a451-59221396e900) script.

