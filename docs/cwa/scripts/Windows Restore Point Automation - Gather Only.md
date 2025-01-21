---
id: '7f52c871-523c-44ae-9289-814326207896'
title: 'Restore Point Audit for Workstations'
title_meta: 'Restore Point Audit for Workstations - Detailed Guide'
keywords: ['restore', 'point', 'audit', 'workstation', 'dataview']
description: 'This document provides a comprehensive overview of a script designed to gather and store restore point information for workstations in a Dataview called Restore Point Audit - Workstations. It includes details on dependencies, process, and output, aimed at saving time through automation.'
tags: ['database', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script helps to gather all restore point information of a workstation and store the details in a Dataview called Restore Point Audit - Workstations.

**Time Saved by Automation:** 30 Minutes

## Sample Run

![Sample Run](../../../static/img/Windows-Restore-Point-Automation---Gather-Only/image_1.png)

## Dependencies

- [Restore Point Audit - Workstations](<../dataviews/Restore Point Audit - Workstations.md>)
- [plugin_proval_restore_points](<../tables/plugin_proval_restore_points.md>)

## Process

This script will create a custom table `plugin_proval_restore_points` if it doesn't exist. The script will then run PowerShell commands to gather information regarding the restore points and update the data in the custom table using SQL queries. The script is designed to work on Windows workstations only.

## Output

- Script log
- Dataview
