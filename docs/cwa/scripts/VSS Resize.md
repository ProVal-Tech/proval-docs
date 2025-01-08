---
id: 'cwa-reset-vssadmin-size'
title: 'Reset VSSAdmin Size'
title_meta: 'Reset VSSAdmin Size - PowerShell Script'
keywords: ['vssadmin', 'resize', 'storage', 'script', 'parameter']
description: 'This document provides a detailed overview of a PowerShell script designed to reset the vssadmin size and update the storage table with the latest size details. It includes sample runs, dependencies, user parameters, and output information.'
tags: ['configuration', 'setup', 'windows', 'script', 'performance']
draft: false
unlisted: false
---
## Summary

This script will reset the vssadmin size and also update the table with the latest size detail.

## Sample Run

![Sample Run](5078775/docs/10728931/images/14918220)

## Dependencies

- [VSSAdmin Storage Audit](https://proval.itglue.com/DOC-5078775-10728930) 
- [Vssadmin List Storage Audit](https://proval.itglue.com/DOC-5078775-10728929) 
- [plugin_proval_vssadminstorage](https://proval.itglue.com/DOC-5078775-10728928) 

## Variables

| Name  | Description                                                                                   |
|-------|-----------------------------------------------------------------------------------------------|
| psout | This contains the complete PowerShell output of vssadmin storage resize state               |

#### User Parameters

| Name            | Example | Required | Description                                                                                      |
|-----------------|---------|----------|--------------------------------------------------------------------------------------------------|
| Drives          | 1       | False    | 1 - All drives vssadmin resize,<br>Leave blank or put anything - Only C: Drive                 |
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


