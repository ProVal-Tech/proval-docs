---
id: 'cwa-internal-monitor-crystal-disk-info-report'
title: 'Internal Monitor for Crystal Disk Info Report'
title_meta: 'Internal Monitor for Crystal Disk Info Report'
keywords: ['monitor', 'crystal', 'disk', 'info', 'report', 'windows', 'script']
description: 'This document outlines the setup and usage of an internal monitor designed to execute the Crystal Disk Info Report script weekly on managed Windows machines. It includes details on dependencies, target systems, alert template setup, and ticket category management for effective monitoring and reporting.'
tags: ['windows', 'monitoring', 'script', 'report', 'alert', 'ticket']
draft: false
unlisted: false
---
## Summary

The purpose of the internal monitor is to execute [EPM - Disk - Script - Crystal Disk Info Report](https://proval.itglue.com/DOC-5078775-12960045) script once per week against the managed Windows machines.

**Note:** The script is supported for PowerShell V5+ only. Hence, the monitor set explicitly excludes Operating Systems older than Windows 10 or Server 2016. However, if you are certain that the PS version for Server 2012 R2 servers in your environment is updated to v5+, then '**2012 R2**' can be removed from this line in the monitor set's additional field, and it will start running the script on those servers too.

![Image](../../../static/img/Execute-Script---Crystal-Disk-Info-Report/image_1.png)

## Dependencies

- [EPM - Disk - Script - Crystal Disk Info Report](https://proval.itglue.com/DOC-5078775-12960045)  
- [EPM - Disk - Custom Table - pvl_crystal_disk_info](https://proval.itglue.com/DOC-5078775-12960038)  

## Target

Managed Windows Computers

![Image](../../../static/img/Execute-Script---Crystal-Disk-Info-Report/image_2.png)

## Alert Template

**Name:** △ CUSTOM - Execute Script - Crystal Disk Info Report

[EPM - Disk - Script - Crystal Disk Info Report](https://proval.itglue.com/DOC-5078775-12960045) script should be imported before importing/creating the alert template. As the alert template should execute this script.

## Ticket Category

- Connectwise Manage board, type, and priority for the ticket can be set by setting the proper ticket category.
- The ticket will be created by the [EPM - Disk - Script - Crystal Disk Info Report](https://proval.itglue.com/DOC-5078775-12960045) script and the ticket category can be set at the following levels:
  - In the script's global variables. Setting the relevant ticket category id in these global variables will allow the script to create a ticket under those categories.  
  ![Image](../../../static/img/Execute-Script---Crystal-Disk-Info-Report/image_3.png)
  - At the group level. Ticket category can be set from the groups where the internal monitor is applied. This ticket category will only be picked if global variables are set to 0.  
  ![Image](../../../static/img/Execute-Script---Crystal-Disk-Info-Report/image_4.png)
  - On global monitor set. Ticket category can be selected at the monitor set itself. This ticket category will only be picked if the group level ticket category is not defined and global variables are set to 0.  
  ![Image](../../../static/img/Execute-Script---Crystal-Disk-Info-Report/image_5.png)  
  - If ticket category is set from none of the above mentioned places, then ticket will be generated under the default ticket category.  
  ![Image](../../../static/img/Execute-Script---Crystal-Disk-Info-Report/image_6.png)  




