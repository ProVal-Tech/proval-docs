---
id: 'ee31c873-0d1f-42fa-b698-cdfe1cbf75a6'
title: 'EPM - Disk - Agnostic - Get-CriticalDiskInfo'
title_meta: 'EPM - Disk - Agnostic - Get-CriticalDiskInfo'
keywords: ['disk', 'critical', 'data', 'custom', 'table']
description: 'This document outlines the Automate Script designed to handle the Agnostic Script for retrieving critical disk information. It details the creation of a custom table called `plugin_proval_cdi_data` and the process of appending data from the agnostic script to this table, along with sample runs, dependencies, and output methods.'
tags: ['database', 'disk-encryption', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

Automate Script designed to handle the Agnostic Script [EPM - Disk - Agnostic - Get-CriticalDiskInfo](<../../powershell/Get-CriticalDiskInfo.md>).  
Creates a custom table called `plugin_proval_cdi_data`.  
Appends data from the agnostic script to the created table.

## Sample Run

![Sample Run](../../../static/img/Disk---Gather-Critical-Info---Deprecated-and-replaced/image_1.png)

## Dependencies

- [EPM - Disk - Agnostic - Get-CriticalDiskInfo](<../../powershell/Get-CriticalDiskInfo.md>)  
- [CWM - Automate - Dataview - Disk - Critical Data](https://proval.itglue.com/DOC-5078775-9374639)

## Process

Reference the Agnostic Script Process found in [EPM - Disk - Agnostic - Get-CriticalDiskInfo](<../../powershell/Get-CriticalDiskInfo.md>).

## Output

The location and method by which this script returns data:

- Script log
- Script state
- Local file on computer
- Dataview
