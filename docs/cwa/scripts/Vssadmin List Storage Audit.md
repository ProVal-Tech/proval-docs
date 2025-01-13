---
id: 'cwa-audit-vssadmin-storage'
title: 'Audit VSSAdmin Storage Details'
title_meta: 'Audit VSSAdmin Storage Details'
keywords: ['vssadmin', 'storage', 'audit', 'volume', 'details']
description: 'This document provides a comprehensive guide on using a script to audit VSSAdmin storage details across all volumes. It identifies whether VSS storage is enabled and reports relevant information for volumes with enabled storage, while also indicating if no storage is configured for any volume.'
tags: ['backup', 'report', 'windows', 'configuration', 'performance']
draft: false
unlisted: false
---
## Summary

This script will help to audit the vssadmin storage details.  
It will report for all volumes where VSS storage is enabled; if not enabled to any volume, then it will report No Drive.

## Sample Run

![Sample Run](..\..\..\static\img\Vssadmin-List-Storage-Audit\image_1.png)

## Dependencies

- [VSS Resize](https://proval.itglue.com/DOC-5078775-10728931)  
- [plugin_proval_vssadminstorage](https://proval.itglue.com/DOC-5078775-10728928)  
- [VSSAdmin Storage Audit](https://proval.itglue.com/DOC-5078775-10728930)  

## Variables

| Name   | Description                               |
|--------|-------------------------------------------|
| output | Contains the output of vssadmin size audit |

## Process

This script runs the PowerShell to check whether the vssadmin storage is placed on the drive or not. If placed then it detects the Volume letter, Total size, allocated size for storage, max storage size, script run time and stores these detail to the table for auditing.

## Output

The location and method by which this script returns data.  

Ex:  

- Script log
- plugin_proval_vssadminstorage
- Dataview



