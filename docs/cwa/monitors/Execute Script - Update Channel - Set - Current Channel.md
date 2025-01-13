---
id: 'cwa-software-configuration-microsoft-365-update-channel'
title: 'Software Configuration for Microsoft 365 Update Channel'
title_meta: 'Software Configuration for Microsoft 365 Update Channel'
keywords: ['microsoft', 'update', 'channel', 'software', 'configuration']
description: 'This document outlines the internal monitor that executes the Software Configuration script for Microsoft 365 to set the update channel to Current on eligible Windows machines. It details the criteria for execution based on the status of the update channel, auto-update settings, and Click-to-Run Office version, along with the necessary dependencies and alert template for execution.'
tags: ['windows', 'update', 'software', 'configuration']
draft: false
unlisted: false
---
## Summary

This internal monitor executes the [SWM - Software Configuration - Script - Microsoft 365 - Set Update Channel - Current](https://proval.itglue.com/DOC-5078775-8181470) script on online machines with Microsoft Office 365 installed on them. It will execute the script on the machines that meet the below criteria of the script states whose data is being stored by the [SWM - Script - Microsoft Office - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) script.

- Update Channel should not be equal to "Current Channel"  
OR
- Auto Update should not be equal to "Auto Enabled."  
AND
- C2R Office Version should not be equal to "Not Installed."

## Dependencies

- [SWM - Script - Microsoft Office - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)
- [SWM - Software Configuration - Script - Microsoft 365 - Set Update Channel - Current](https://proval.itglue.com/DOC-5078775-8181470)

## Target

Windows Machines

## Alert Template

**Name:** `△ Custom - Execute Script - Microsoft 365 - Update Channel - Set - Current`

The alert template should execute the [SWM - Software Configuration - Script - Microsoft 365 - Set Update Channel - Current](https://proval.itglue.com/DOC-5078775-8181470) script.



