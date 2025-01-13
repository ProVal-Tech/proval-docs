---
id: 'rmm-powershell-version-monitor'
title: 'PowerShell Version Monitor'
title_meta: 'PowerShell Version Monitor'
keywords: ['monitor', 'version', 'upgrade', 'customfield', 'autofix']
description: 'This document provides a detailed guide on creating a monitor that detects the status of the custom field PS Version. If the PS Version is below 5, it will automatically run a fix to upgrade to the latest version. It includes steps for monitor creation, configuration, conditions, ticket resolution, and dependencies.'
tags: ['monitoring', 'windows', 'customfield', 'automatedtask', 'ticketing']
draft: false
unlisted: false
---
## Summary

This monitor will detect the status of the custom field PS Version and if the PS Version is below 5 it will run an autofix to upgrade PS Version to latest version.

*Note: The custom field + Device groups will need to be created before the monitor can be created.*

## Details

### Monitor Creation
Navigate to Automation > Monitors  
Click "Add Monitor"  
![Monitor Creation Image](../../../static/img/PowerShell-Version/image_11.png)

---

## Monitor Configuration:
- **Name:** PowerShell Version Out of Date
- **Description:** This monitor will detect the status of the custom field PS Version and if the PS Version is below 5 it will run an autofix to upgrade PS Version to latest version.
- **Type:** Custom Field
- **Family:** Windows Services
- **Severity:** Other

![Monitor Configuration Image](../../../static/img/PowerShell-Version/image_12.png)

### Conditions:
- **Custom Field Type:** Text Box.
- **Custom Field Name:** Powershell Version
- **Condition:** Contains --> AND --> Failure
- **Automated Task:** "Powershell Update"

### Ticket Resolution
- **Custom Field Type:** Text Box.
- **Custom Field Name:** Powershell Version
- **Condition:** Contains --> AND --> Success

### Resources:
*Note: The custom field + Device groups will need to be created before the monitor can be created.*  
This monitor is intentionally aimed at the PowerShell Version < 5 device group.  
![Resources Image](../../../static/img/PowerShell-Version/image_13.png)

## Dependencies
- [CW RMM - Custom Field - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824368)  
- [CW RMM - Task - PowerShell Version Information](https://proval.itglue.com/DOC-5078775-12824367)  
- [CW RMM - Device Groups - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824362)  

## Ticketing
This solution does technically make tickets, but the tickets are designed to Autoclose as soon as the machine runs the task to update PowerShell.




