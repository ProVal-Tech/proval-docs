---
id: '0600e89c-06a5-42da-9ed8-41e43d9cfd7d'
title: 'Reset VSSAdmin Size'
title_meta: 'Reset VSSAdmin Size - PowerShell Script'
keywords: ['vssadmin', 'resize', 'storage', 'script', 'parameter']
description: 'This document provides a detailed overview of a PowerShell script designed to reset the vssadmin size and update the storage table with the latest size details. It includes sample runs, dependencies, user parameters, and output information.'
tags: ['performance', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script will reset the vssadmin size and also update the table with the latest size detail.

## Sample Run

![Sample Run](../../../static/img/VSS-Resize/image_1.png)

## Dependencies

- [VSSAdmin Storage Audit](<../dataviews/VSSAdmin Storage Audit.md>) 
- [Vssadmin List Storage Audit](<./Vssadmin List Storage Audit.md>) 
- [plugin_proval_vssadminstorage](<../tables/plugin_proval_vssadminstorage.md>) 

## Variables

| Name  | Description                                                                                   |
|-------|-----------------------------------------------------------------------------------------------|
| psout | This contains the complete PowerShell output of vssadmin storage resize state               |

#### User Parameters

| Name            | Example | Required | Description                                                                                      |
|-----------------|---------|----------|--------------------------------------------------------------------------------------------------|
| Drives          | 1       | False    | 1 - All drives vssadmin resize,Leave blank or put anything - Only C: Drive                 |
| MaxSize         | 10      | False    | Set the vss maxsize for the volume in fixed specific size                                       |
| MaxSizePercent   | 10      | False    | Set the vss maxsize for the volume in percentage of its total size                              |

## Process

This script will reset the vssadmin size and also update the table with the latest size detail using PowerShell.  
This resizes the storage based on the user parameter.  
The script validates scope and resize success.

## Output

- Script log
- Table
- Dataview













