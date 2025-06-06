---
id: 'bd99d6b2-2d31-4611-9682-3c8518c53998'
slug: /bd99d6b2-2d31-4611-9682-3c8518c53998
title: 'Get Latest Installed Cumulative Update'
title_meta: 'Get Latest Installed Cumulative Update'
keywords: ['cumulative', 'update', 'windows', 'installed', 'build']
description: 'This document describes a script that retrieves the latest installed Cumulative Update and Full Build Number for a Windows computer. The data is stored in a custom table for Automate implementation, providing essential update information for system management.'
tags: ['database', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the script is to fetch the latest installed Cumulative Update and the Full Build Number of a Windows computer.  
e.g.,  
![Image](../../../static/img/docs/bd99d6b2-2d31-4611-9682-3c8518c53998/image_1.webp)  

The data is then stored in the custom table [pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a).  

It is an Automate implementation of the agnostic script [Get-LatestInstalledCU](/docs/81d82975-889b-49e4-b229-36d4f162a4ff).

## File Hash

**File Path:** `C:\ProgramData\_automation\Script\Get-LatestInstalledCU\Get-LatestInstalledCU.ps1`  
**File Hash (Sha256):** `4BC90F4D94F26CEC201A8EFE71C35289F998267A34E37CB5AECF40F0961061B5`  
**File Hash (MD5):** `71C2B794E53A957E48682B7D0DCF45F7`  
**File Path:** `C:\ProgramData\_automation\Script\Get-LatestInstalledCU\Get-LatestInstalledCUAI.ps1`  
**File Hash (Sha256):** `CA6C5B60BA4C3A6581486CC481F2A8F5C7EA96B67AA7D5DBC1B00F7997B59A80`  
**File Hash (MD5):** `E041E20762DC1D52690FDED67E5768AD`  

## Sample Run

![Image](../../../static/img/docs/bd99d6b2-2d31-4611-9682-3c8518c53998/image_2.webp)  

## Variables

| Name                  | Description                                                                                                                                                   |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ProjectName           | Get-LatestInstalledCU                                                                                                                                       |
| WorkingDirectory       | C:/ProgramData/_automation/script/Get-LatestInstalledCU                                                                                                     |
| TableName             | [pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a)                                                                                 |
| SQLReplaceStatement   | `REPLACE` statement returned by the PowerShell script to update the data in the custom table                                                                 |
| OSBuild               | Full OS Build of the computer                                                                                                                                 |
| MaxReleaseDate        | Maximum CU release date stored in the database for `@OSBuild@`. Used to verify whether the computer's history has returned correct CU information or not. |

## Output

- Custom Table
- Dataview
