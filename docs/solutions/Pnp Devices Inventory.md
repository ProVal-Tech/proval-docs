---
id: 'cwa-get-pnp-devices'
title: 'Get PnP Devices in Automate'
title_meta: 'Get PnP Devices in Automate'
keywords: ['pnp', 'devices', 'automate', 'information', 'script', 'dataview']
description: 'This document provides detailed instructions on how to display information about Plug and Play (PnP) devices in ConnectWise Automate. It includes associated scripts and custom tables necessary for implementation, as well as troubleshooting tips for common issues.'
tags: ['configuration', 'database', 'installation', 'report', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

Displays detailed information on [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play) into Automate.

## Associated Content

| Content                                                                                   | Type          | Function                                                                                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Get-PNPDevices [DV]](https://proval.itglue.com/DOC-5078775-10861683) | Script        | This script will collect information about the installed [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play) and stores it in the custom table [Plugin_ProVal_PnpDevices](https://proval.itglue.com/DOC-5078775-10861699). |
| [CWM - Automate - Custom Table - plugin_proval_pnpdevices](https://proval.itglue.com/DOC-5078775-10861699) | Custom Table  | To store the data grabbed by [CWM - Automate - Script - Get-PNPDevices [DV]](https://proval.itglue.com/DOC-5078775-10861683) script in order to feed into the [CWM - Automate - Dataview - Get-PNPDevices [Script]](https://proval.itglue.com/DOC-5078775-10861702) dataview. |
| [CWM - Automate - Dataview - Get-PNPDevices [Script]](https://proval.itglue.com/DOC-5078775-10861702) | Dataview      | This dataview was required to display [PnP Devices](https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-plug-and-play) information. The data is being populated by the [CWM - Automate - Script - Get-PNPDevices [DV]](https://proval.itglue.com/DOC-5078775-10861683) script. |

## Implementation

- Import the [CWM - Automate - Script - Get-PNPDevices [DV]](https://proval.itglue.com/DOC-5078775-10861683) script.
- Import the [CWM - Automate - Dataview - Get-PNPDevices [Script]](https://proval.itglue.com/DOC-5078775-10861702) dataview.
- Run the script against an online windows computer to create the table.
- Schedule the script to run at the regular frequency against the desired computers to keep the dataview up-to-date.

## FAQ

**Q:** The dataview is not populating anything after running the script for the first time.  
**A:** It's most probably because of the permissions, try running [CWM - Automate - Script - Update User Permissions for ProVal Custom Tables](https://proval.itglue.com/DOC-5078775-8056027) script.


