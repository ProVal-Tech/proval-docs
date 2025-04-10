---
id: '77f0982f-1be7-49a7-871e-cfc88705775e'
slug: /77f0982f-1be7-49a7-871e-cfc88705775e
title: 'Microsoft 365 - Click-to-Run - Set Update Channel'
title_meta: 'Microsoft 365 - Click-to-Run - Set Update Channel'
keywords: ['microsoft', 'update', 'channel', 'registry', 'client', 'computer', 'edf']
description: 'This document details a script that modifies the registry to set the update channel for Microsoft 365 products based on the values defined in the Client or Computer level EDF Update Channel. It includes sample runs, dependencies, and detailed tables for client and computer level EDF configurations.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script will make changes in the registry to set the update channel for Microsoft 365 products to the value set in the Client or Computer level EDF `Update Channel`.

**File Path:** `C:/ProgramData/_Automation/Script/Get-M365UpdateChannel/Get-M365UpdateChannel.ps1`

**File Hash (SHA256):** `1CAED911E914A8F8C9EBA29D244459F4DA2B09780EB8ED720FB55F2519E06D19`

**File Hash (MD5):** `327EA97B42E953417FD6C7BAFC02B5F`

## Sample Run

![Sample Run](../../../static/img/Microsoft-365---Click-to-Run---Set-Update-Channel/image_1.png)

## Dependencies

[SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](/docs/ce16526d-84b5-4e58-928b-13a29195056e)

## Client Level EDF

| Name            | Example          | Type      | Section       | Details                                                                                                                                                                                                                                          |
|-----------------|------------------|-----------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Update Channel   | Current Channel  | DropDown  | Microsoft 365 | Select the Update Channel from the drop-down menu to set for the client's computers. Available options are:  - Current Channel  - Monthly Enterprise Channel  - Semi-Annual Enterprise Channel  - Beta Channel  - None  Leave it blank or set it to `None` to disable the Automation for the client. |

![Client Level EDF](../../../static/img/Microsoft-365---Click-to-Run---Set-Update-Channel/image_2.png)

## Computer Level EDF

| Name            | Example          | Type      | Section       | Details                                                                                                                                                                                                                                          |
|-----------------|------------------|-----------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Update Channel   | Current Channel  | DropDown  | Microsoft 365 | Select the Update Channel from the drop-down menu to set for the computer. Available options are:  - Current Channel  - Monthly Enterprise Channel  - Semi-Annual Enterprise Channel  - Beta Channel  - None  Set it to `None` to disable the Automation for the computer. Computer Level EDF can be used to override the value set in the Client Level EDF. |

![Computer Level EDF](../../../static/img/Microsoft-365---Click-to-Run---Set-Update-Channel/image_3.png)

## Output

- Script Log
- Custom Table
- Dataview



