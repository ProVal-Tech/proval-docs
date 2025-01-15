---
id: 'bd99d6b2-2d31-4611-9682-3c8518c53998'
title: 'Fetch Latest Installed Cumulative Update'
title_meta: 'Fetch Latest Installed Cumulative Update'
keywords: ['cumulative', 'update', 'windows', 'installed', 'build']
description: 'This document describes a script that retrieves the latest installed Cumulative Update and Full Build Number for a Windows computer. The data is stored in a custom table for Automate implementation, providing essential update information for system management.'
tags: ['database', 'configuration', 'windows', 'update', 'software']
draft: false
unlisted: false
---
## Summary

The purpose of the script is to fetch the latest installed Cumulative Update and the Full Build Number of a Windows computer.  
e.g.,  
![Image](../../../static/img/Get-Latest-Installed-Cumulative-Update/image_1.png)  

The data is then stored in the custom table [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12849460).  

It is an Automate implementation of the agnostic script [EPM - Windows Update - Agnostic - Get-LatestInstalledCU](https://proval.itglue.com/DOC-5078775-13046597).  

## Sample Run

![Image](../../../static/img/Get-Latest-Installed-Cumulative-Update/image_2.png)  

## Variables

| Name                  | Description                                                                                                                                                   |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ProjectName           | Get-LatestInstalledCU                                                                                                                                       |
| WorkingDirectory       | C:/ProgramData/_automation/script/Get-LatestInstalledCU                                                                                                     |
| TableName             | [pvl_win_lastest_installed_cu](https://proval.itglue.com/DOC-5078775-12849460)                                                                             |
| SQLReplaceStatement   | `REPLACE` statement returned by the PowerShell script to update the data in the custom table                                                                 |
| OSBuild               | Full OS Build of the computer                                                                                                                                 |
| MaxReleaseDate        | Maximum CU release Date stored in the database for the [@OSBuild@.](http://@OSBuild@.) Used to verify whether if the computer's history had returned correct CU information or not. |

## Output

- Custom Table
- Dataview






