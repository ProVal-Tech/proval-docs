---
id: 'cwa_create_plugin_proval_windows11_readiness_table'
title: 'Create Plugin Proval Windows 11 Readiness Table'
title_meta: 'Create Plugin Proval Windows 11 Readiness Table'
keywords: ['windows', 'readiness', 'plugin', 'compatibility', 'upgrade']
description: 'This document outlines a script that creates the plugin_proval_windows11_readiness table if it does not exist. It runs a PowerShell script on a target Windows machine to update this table with relevant data, which can be viewed in the Windows 11 Upgrade Compatibility dataview.'
tags: ['database', 'setup', 'windows', 'update', 'report']
draft: false
unlisted: false
---
## Summary

The script will create the `plugin_proval_windows11_readiness` table if it's missing from the environment. Then will run a PowerShell script against the target Windows machine and will update the [plugin_proval_windows11_readiness](https://proval.itglue.com/DOC-5078775-8355448) table with the relevant data. This data can be viewed in the [Windows 11 Upgrade Compatibility](https://proval.itglue.com/DOC-5078775-8355449) dataview.

## Sample Run

![Sample Run](5078775/docs/8355447/images/24252470)

## Variables

| Name                | Description                                                                                      |
|---------------------|--------------------------------------------------------------------------------------------------|
| ProjectName         | Check-Windows11Compatibility                                                                     |
| WorkingDirectory     | C:\ProgramData\_Automation\Scripts\Check-Windows11Compatibility                                 |
| TableName           | [plugin_proval_windows11_readiness](https://proval.itglue.com/DOC-5078775-8355448)             |
| ScriptPath          | C:\ProgramData\_Automation\Scripts\Check-Windows11Compatibili\Check-Windows11Compatibility.ps1 |

## Output

Dataview: [Windows 11 Upgrade Compatibility](https://proval.itglue.com/DOC-5078775-8355449)  
Custom table: [plugin_proval_windows11_readiness](https://proval.itglue.com/DOC-5078775-8355448)


