---
id: '113349eb-9de0-4b42-b773-cf873f87f2f0'
title: 'Audit WMI Patch History'
title_meta: 'Audit WMI Patch History'
keywords: ['audit', 'dotnet', 'patch', 'history', 'windows']
description: 'This script audits the current patch history from .NET to a custom table (plugin_proval_wmipatchesinstalled). It is designed for use on Windows OS machines and requires PowerShell v2 or greater on the agent. The process includes creating the necessary table if it does not exist, deleting existing data for the target machine, gathering patch information, and inserting new data into the table.'
tags: ['database', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script audits the current patch history from .NET to a custom table (plugin_proval_wmipatchesinstalled).  
The script should be run against Windows OS machines, and PowerShell v2 or greater is required on the agent.  

**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/Audit-WMI-Patch-History/image_1.png)

## Dependencies

- @plugin_proval_wmipatchesinstalled
- [Windows - Rollup Audit (WMI) [Script]](<../dataviews/Windows - Rollup Audit (WMI) Script.md>)

## Process

This script audits the current patch history from .NET to a custom table (plugin_proval_wmipatchesinstalled). The script creates the `plugin_proval_wmipatchesinstalled` table if it does not exist and deletes the current data for the target machine from the table. Then it executes the PowerShell to gather the patch information and inserts the new data into the table.

## Output

- The output will be populated in the Dataview Windows - Rollup Audit (WMI) [Script]



