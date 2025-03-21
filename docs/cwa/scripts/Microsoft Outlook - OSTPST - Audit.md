---
id: '2029ecbe-c5f8-431e-9643-7aed63bec6d8'
title: 'Microsoft Outlook - OSTPST - Audit'
title_meta: 'Microsoft Outlook - OSTPST - Audit'
keywords: ['ost', 'pst', 'audit', 'collection', 'windows', 'script']
description: 'This document describes a script that collects all OST/PST file names and sizes from Windows machines, storing the data in a custom table for auditing purposes. It includes details about the script path, file hash, sample run output, dependencies, and the expected output from the script.'
tags: ['database', 'report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script collects all the OST/PST file names and sizes from Windows machines and stores them in a custom table [EPM - Data Collection - Custom Table - pvl_outlook_pst_ost_audit](<../tables/pvl_outlook_pst_ost_audit.md>).

**Script Path:** C:/ProgramData/_Automation/Script/Audit-OutlookDB/Audit-OutlookDB.ps1  
**File Hash:** B5689044612005060B790DFC5560C8E28E44B82BDE107D971AA146B91F147881

## Sample Run

![Sample Run](../../../static/img/Microsoft-Outlook---OSTPST---Audit/image_1.png)

## Dependencies

[EPM - Data Collection - Internal Monitor - Execute Script - Microsoft Outlook - OST/PST - Audit](<../monitors/Execute Script - Microsoft Outlook - OSTPST - Audit.md>)

## Output

- Script log
- Dataview



