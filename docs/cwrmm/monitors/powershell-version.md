---
id: '8c623742-14b0-4263-8a1a-abd4c61d602d'
slug: /8c623742-14b0-4263-8a1a-abd4c61d602d
title: 'PowerShell Version'
title_meta: 'PowerShell Version'
keywords: ['monitor', 'version', 'upgrade', 'customfield', 'autofix']
description: 'This document provides a detailed guide on creating a monitor that detects the status of the custom field PS Version. If the PS Version is below 5, it will automatically run a fix to upgrade to the latest version. It includes steps for monitor creation, configuration, conditions, ticket resolution, and dependencies.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor will detect the status of the custom field PS Version, and if the PS Version is below 5, it will run an autofix to upgrade the PS Version to the latest version.

*Note: The custom field and device groups will need to be created before the monitor can be established.*

## Details

### Monitor Creation

Navigate to Automation > Monitors  
Click "Add Monitor"  
![Monitor Creation Image](../../../static/img/PowerShell-Version/image_11.png)

---

## Monitor Configuration:

- **Name:** PowerShell Version Out of Date
- **Description:** This monitor will detect the status of the custom field PS Version, and if the PS Version is below 5, it will run an autofix to upgrade the PS Version to the latest version.
- **Type:** Custom Field
- **Family:** Windows Services
- **Severity:** Other

![Monitor Configuration Image](../../../static/img/PowerShell-Version/image_12.png)

### Conditions:

- **Custom Field Type:** Text Box
- **Custom Field Name:** PowerShell Version
- **Condition:** Contains --> AND --> Failure
- **Automated Task:** "PowerShell Update"

### Ticket Resolution

- **Custom Field Type:** Text Box
- **Custom Field Name:** PowerShell Version
- **Condition:** Contains --> AND --> Success

### Resources:

*Note: The custom field and device groups will need to be created before the monitor can be established.*  
This monitor is intentionally aimed at the PowerShell Version \< 5 device group.  
![Resources Image](../../../static/img/PowerShell-Version/image_13.png)

## Dependencies

- [CW RMM - Custom Field - PowerShell Version](/docs/945d88e0-81a9-4253-8406-63fa7430d45a)  
- [CW RMM - Task - PowerShell Version Information](/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b)  
- [CW RMM - Device Groups - PowerShell Version](/docs/bbb9f958-4fd3-4fda-903f-7d303bf26779)  

## Ticketing

This solution does technically create tickets, but the tickets are designed to autoclose as soon as the machine runs the task to update PowerShell.



