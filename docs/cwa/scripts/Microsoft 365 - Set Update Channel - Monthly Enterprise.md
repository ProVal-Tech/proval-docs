---
id: 'cwa-microsoft-365-monthly-update'
title: 'Microsoft 365 Monthly Update Script'
title_meta: 'Microsoft 365 Monthly Update Script for Registry Changes'
keywords: ['microsoft', '365', 'update', 'registry', 'automation']
description: 'This document outlines a script that modifies registry settings to enable Microsoft 365 products to update on a monthly basis, in line with current channel updates. It also executes a follow-up script to update the relevant dataview in ConnectWise Automate, thereby enhancing the management and auditing of Office versions.'
tags: ['configuration', 'office365', 'update', 'automation', 'software']
draft: false
unlisted: false
---
## Summary

This script will make changes in the registry and allow Microsoft 365 products to update on a monthly basis as per current channel updates.  

It will execute the [SWM - Script - Microsoft Office - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) script at the end of the successful run to update the information in [CWM - Automate - Dataview - C2R Office Version Audit](https://proval.itglue.com/DOC-5078775-13932548) Dataview.  

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Microsoft-365---Set-Update-Channel---Monthly-Enterprise\image_1.png)

## Dependencies

- Office Installed on the Target Machine
- [SWM - Script - Microsoft Office - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)

## Process

1. Logs a message in Automate stating that we're updating the channel to Monthly
2. Changes the proper registry keys
3. Checks to make sure the registry key was successfully changed

## Output

- Script log


