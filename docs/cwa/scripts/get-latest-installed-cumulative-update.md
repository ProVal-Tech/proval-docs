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
![Image](../../../static/img/Get-Latest-Installed-Cumulative-Update/image_1.png)  

The data is then stored in the custom table [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a).  

It is an Automate implementation of the agnostic script [EPM - Windows Update - Agnostic - Get-LatestInstalledCU](/docs/81d82975-889b-49e4-b229-36d4f162a4ff).

## Sample Run

![Image](../../../static/img/Get-Latest-Installed-Cumulative-Update/image_2.png)  

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



