---
id: 'a17fd169-876b-4de8-b01c-d396ec4899cf'
title: 'Microsoft 365 Update Channel Configuration'
title_meta: 'Microsoft 365 Update Channel Configuration'
keywords: ['microsoft', '365', 'update', 'channel', 'configuration', 'windows']
description: 'This document outlines the internal monitor that executes the Microsoft 365 Update Channel script on online machines with Microsoft Office 365 installed. It details the criteria for execution and dependencies required for proper functionality.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This internal monitor executes the [SWM - Software Configuration - Script - Microsoft 365 - Set Update Channel - Monthly Enterprise](<../scripts/Microsoft 365 - Set Update Channel - Monthly Enterprise.md>) script on online machines with Microsoft Office 365 installed. It will execute the script on the machines that meet the criteria outlined below, as defined by the data stored by the [SWM - Script - Microsoft Office - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) script.

- Update Channel should not be equal to "Monthly Enterprise Channel."  
OR  
- Auto Update should not be equal to "Auto Enabled."  
AND  
- C2R Office Version should not be equal to "Not Installed."

## Dependencies

- [SWM - Script - Microsoft Office - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)  
- [SWM - Software Configuration - Script - Microsoft 365 - Set Update Channel - Monthly Enterprise](<../scripts/Microsoft 365 - Set Update Channel - Monthly Enterprise.md>)

## Target

Windows Machines

## Alert Template

**Name:** `~custom - Execute Script - Microsoft 365 - Update Channel - Set - Monthly Enterprise`  

The alert template should execute the [SWM - Software Configuration - Script - Microsoft 365 - Set Update Channel - Monthly Enterprise](<../scripts/Microsoft 365 - Set Update Channel - Monthly Enterprise.md>) script.

