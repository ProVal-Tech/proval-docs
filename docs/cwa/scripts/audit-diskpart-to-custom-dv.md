---
id: 'b61566b1-676d-433c-ab86-d7272efe5717'
slug: /b61566b1-676d-433c-ab86-d7272efe5717
title: 'Audit Diskpart to Custom DV'
title_meta: 'Audit Diskpart to Custom DV'
keywords: ['disk', 'partition', 'database', 'windows', 'script']
description: 'This document outlines a script that creates a custom table named `plugin_proval_diskpart_style` and runs PowerShell on Windows machines to retrieve disk partition details, subsequently populating this information in the database. This process saves approximately 10 minutes by automating the retrieval of disk details.'
tags: ['database', 'performance', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script creates a custom table `plugin_proval_diskpart_style`. It runs PowerShell against Windows machines to fetch disk partition details and populate the information in the database.  
**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/b61566b1-676d-433c-ab86-d7272efe5717/image_1.webp)

## Dependencies

- [plugin_proval_diskpart_style](/docs/c8745cde-e56d-4ea5-b4ae-2e213c4e21d2)  
- @Audit Disk Partition Styles - DV

## Process

- This script will first create the custom table in the database.
- Then, it will verify the Windows OS; if it is not Windows, the script will exit.
- The script will then run PowerShell to fetch disk partition details and store them in the database.

## Output

- Dataview