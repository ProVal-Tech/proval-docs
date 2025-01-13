---
id: 'cwa-restore-point-audit-workstations'
title: 'Restore Point Audit for Workstations'
title_meta: 'Restore Point Audit for Workstations - Detailed Guide'
keywords: ['restore', 'point', 'audit', 'workstation', 'dataview']
description: 'This document provides a comprehensive overview of a script designed to gather and store restore point information for workstations in a Dataview called Restore Point Audit - Workstations. It includes details on dependencies, process, and output, aimed at saving time through automation.'
tags: ['windows', 'database', 'configuration', 'report', 'setup']
draft: false
unlisted: false
---
## Summary

This script helps to get all restore point information of a workstation and store the details in a Dataview called Restore Point Audit - workstations.

**Time Saved by Automation:** 30 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Windows-Restore-Point-Automation---Gather-Only\image_1.png)

## Dependencies

- [Restore Point Audit - Workstations](https://proval.itglue.com/DOC-5078775-7996534)
- [plugin_proval_restore_points](https://proval.itglue.com/DOC-5078775-8157483)

## Process

This script will create a Custom Table `plugin_proval_restore_points` if it doesn't exist. The script will then run the Powershell commands to gather the information regarding the restore points and will update the data in the Custom table using SQL queries. The script will work on Windows Workstations only.

## Output

- Script log
- Dataview



