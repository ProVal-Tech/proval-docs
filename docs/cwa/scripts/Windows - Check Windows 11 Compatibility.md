---
id: '318a9cfd-251b-4b47-8d18-aabc3af6b41c'
slug: /318a9cfd-251b-4b47-8d18-aabc3af6b41c
title: 'Windows - Check Windows 11 Compatibility'
title_meta: 'Windows - Check Windows 11 Compatibility'
keywords: ['windows', 'readiness', 'plugin', 'compatibility', 'upgrade']
description: 'This document outlines a script that creates the plugin_proval_windows11_readiness table if it does not exist. It runs a PowerShell script on a target Windows machine to update this table with relevant data, which can be viewed in the Windows 11 Upgrade Compatibility dataview.'
tags: ['database', 'report', 'setup', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The script will create the `plugin_proval_windows11_readiness` table if it's missing from the environment. It will then run a PowerShell script against the target Windows machine and update the [plugin_proval_windows11_readiness](<../tables/plugin_proval_windows11_readiness.md>) table with the relevant data. This data can be viewed in the [Windows 11 Upgrade Compatibility](<../dataviews/Windows 11 Upgrade Compatibility.md>) dataview.

## Sample Run

![Sample Run](../../../static/img/Windows---Check-Windows-11-Compatibility/image_1.png)

## Variables

| Name                | Description                                                                                      |
|---------------------|--------------------------------------------------------------------------------------------------|
| ProjectName         | Check-Windows11Compatibility                                                                     |
| WorkingDirectory     | C:/ProgramData/_Automation/Scripts/Check-Windows11Compatibility                                 |
| TableName           | [plugin_proval_windows11_readiness](<../tables/plugin_proval_windows11_readiness.md>)             |
| ScriptPath          | C:/ProgramData/_Automation/Scripts/Check-Windows11Compatibility/Check-Windows11Compatibility.ps1 |

## Output

Dataview: [Windows 11 Upgrade Compatibility](<../dataviews/Windows 11 Upgrade Compatibility.md>)  
Custom table: [plugin_proval_windows11_readiness](<../tables/plugin_proval_windows11_readiness.md>)


