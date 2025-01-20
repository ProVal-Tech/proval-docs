---
id: '1de94554-1057-4e13-99ff-4d9dba02a180'
title: 'Windows Shadow Copy Statistics Dataview'
title_meta: 'Windows Shadow Copy Statistics Dataview'
keywords: ['shadow', 'copy', 'statistics', 'windows', 'dataview']
description: 'This document provides a detailed overview of the Windows Shadow Copy statistics dataview for endpoints with Shadow Copy enabled. It includes information on dependencies, columns, and descriptions of each data point collected from the machines.'
tags: ['backup', 'performance', 'report', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview will display Windows Shadow Copy statistics for endpoints with Shadow Copy Enabled and that have run the script to gather the information.

## Dependencies

Script: [Shadow Copy - Audit Complete Statistics [DV]](<../scripts/Shadow Copy - Audit Complete Statistics DV.md>)  
Custom table: [EPM - Windows Configuration - Custom Table - plugin_proval_shadowcopystats](<../tables/plugin_proval_shadowcopystats.md>)  

## Columns

| Column             | Description                                                        |
|--------------------|--------------------------------------------------------------------|
| Client             | The name of the client associated to the machine                   |
| Location           | The name of the locations associated to the machine                |
| Computer Name      | The name of the machine associated with the data                   |
| OS Type            | Workstation|Server - Indicates the Operating System type               |
| Operating System    | Displays the name of the operating system detected by Automate     |
| DriveLetter        | The Drive letter associated with the Shadow Copy                   |
| CapacityGB        | The allotted capacity for Shadow Copy on the machine                |
| FreeSpaceGB       | The remaining space for Shadow Copy to use on the machine          |
| ShadowCopyCount    | The number of Shadow Copies on the machine                          |
| OldestShadowCopy   | The oldest available Shadow Copy date                               |
| LatestShadowCopy   | The most recent available Shadow Copy date                          |














