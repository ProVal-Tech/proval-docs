---
id: '1de94554-1057-4e13-99ff-4d9dba02a180'
slug: /1de94554-1057-4e13-99ff-4d9dba02a180
title: 'Windows - Shadow Copy - Statistics'
title_meta: 'Windows - Shadow Copy - Statistics'
keywords: ['shadow', 'copy', 'statistics', 'windows', 'dataview']
description: 'This document provides a detailed overview of the Windows Shadow Copy statistics dataview for endpoints with Shadow Copy enabled. It includes information on dependencies, columns, and descriptions of each data point collected from the machines.'
tags: ['backup', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays Windows Shadow Copy statistics for endpoints with Shadow Copy enabled that have run the script to gather the information.

## Dependencies

- Script: [Shadow Copy - Audit Complete Statistics [DV]](/docs/9d69d33c-688e-4c02-adfe-cef7c8ecd766)  
- Custom table: [EPM - Windows Configuration - Custom Table - plugin_proval_shadowcopystats](/docs/59bbf54a-55af-42fa-9e77-cd0b105122de)  

## Columns

| Column             | Description                                                        |
|--------------------|--------------------------------------------------------------------|
| Client             | The name of the client associated with the machine                 |
| Location           | The name of the locations associated with the machine              |
| Computer Name      | The name of the machine associated with the data                   |
| OS Type            | Workstation | Server - Indicates the Operating System type           |
| Operating System    | Displays the name of the operating system detected by Automate     |
| Drive Letter       | The drive letter associated with the Shadow Copy                   |
| Capacity GB        | The allotted capacity for Shadow Copy on the machine                |
| Free Space GB      | The remaining space for Shadow Copy to use on the machine          |
| Shadow Copy Count   | The number of Shadow Copies on the machine                          |
| Oldest Shadow Copy  | The oldest available Shadow Copy date                               |
| Latest Shadow Copy  | The most recent available Shadow Copy date                          |