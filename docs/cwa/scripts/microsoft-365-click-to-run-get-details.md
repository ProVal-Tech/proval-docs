---
id: 'ce16526d-84b5-4e58-928b-13a29195056e'
slug: /ce16526d-84b5-4e58-928b-13a29195056e
title: 'Microsoft 365 - Click-to-Run - Get Details'
title_meta: 'Microsoft 365 - Click-to-Run - Get Details'
keywords: ['microsoft', 'office', 'update', 'channel', 'automation', 'edf']
description: 'This document provides an overview of the script that retrieves the installed Microsoft Click-to-Run Office version, verifies auto-update settings, and stores the Update channel information in a custom table for monitoring and management purposes.'
tags: ['office', 'update']
draft: false
unlisted: false
---

## Summary

This script retrieves the installed Microsoft Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the Update channel. It then stores this information in the custom table [pvl_m365_update_channel_audit](/docs/18823b31-4222-4881-82f8-bc284af806cb).

**File Path:** `C:/ProgramData/_Automation/Script/Get-M365UpdateChannel/Get-M365UpdateChannel.ps1`  
**File Hash (SHA256):** `1CAED911E914A8F8C9EBA29D244459F4DA2B09780EB8ED720FB55F2519E06D19`  
**File Hash (MD5):** `E58115561CA743E1D9BCF56CAF13C839`  

## Sample Run

**First Run:** Execute the script against any online Windows machine with the `Set_Environment` parameter set to `1` to create the custom table and EDFs used by the solution.

![First Run](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_1.webp)

**Regular Run:**  

![Regular Run](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_2.webp)

## Client Level EDF

| Name            | Example          | Type      | Section        | Details                                                                                                                                       |
|-----------------|------------------|-----------|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Update Channel   | Current Channel  | DropDown  | Microsoft 365  | Select the Update Channel from the drop-down menu to set for the client's computers. Available options are: <ul><li>Current Channel</li><li>Monthly Enterprise Channel</li><li>Semi-Annual Enterprise Channel</li><li>Beta Channel</li><li>None</li></ul> Leave it blank or set it to `None` to disable the Automation for the client. |

![Client Level EDF](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_3.webp)

**Note:** The EDF is used by the [Microsoft 365 - Set Update Channel - Current](/docs/68e362d9-521f-417b-93e3-81adc169b559) script and the [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/44e0a674-9e54-47ad-be29-6c93611db0b2) internal monitor.

## Computer Level EDF

| Name            | Example          | Type      | Section        | Details                                                                                                                                       |
|-----------------|------------------|-----------|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Update Channel   | Current Channel  | DropDown  | Microsoft 365  | Select the Update Channel from the drop-down menu to set for the computer. Available options are: <ul><li>Current Channel</li><li>Monthly Enterprise Channel</li><li>Semi-Annual Enterprise Channel</li><li>Beta Channel</li><li>None</li></ul> Set it to `None` to disable the Automation for the computer. The Computer Level EDF can be used to override the value set in the Client Level EDF. |

![Computer Level EDF](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_4.webp)

**Note:** The EDF is used by the [Microsoft 365 - Set Update Channel - Current](/docs/68e362d9-521f-417b-93e3-81adc169b559) script and the [Microsoft 365 - Click-to-Run - Set Update Channel](/docs/44e0a674-9e54-47ad-be29-6c93611db0b2) internal monitor.

## Output

- Script log
- Custom Table
- Dataview