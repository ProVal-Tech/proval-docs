---
id: 'a88678ef-dc82-4837-802c-e77573277504'
slug: /a88678ef-dc82-4837-802c-e77573277504
title: 'Update Orchestrator Bouncer'
title_meta: 'Update Orchestrator Bouncer'
keywords: ['monitor', 'update', 'orchestrator', 'rmm', 'windows']
description: 'This document outlines the creation and configuration of the Update Orchestrator Bouncer monitor, which prevents unauthorized Microsoft patches from being applied by renaming the reboot folder in the Update Orchestrator path. It includes details on monitor creation, configuration, conditions, ticket resolution, and dependencies.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This solution will monitor the `C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/Reboot` path. If the folder for "reboot" exists, it will be renamed to `reboot.bak`. This prevents the update orchestrator from side-loading Microsoft patches on endpoints that are not approved via the RMM.

*Note: A Task and Device group will need to be created before the monitor can be set up.*

## Details

### Monitor Creation
Navigate to Automation > Monitors  
Click "Add Monitor"  
![Monitor Creation](../../../static/img/Update-Orchestrator-Bouncer/image_1.png)

---

### Monitor Configuration:
- **Name:** Update Orchestrator Bouncer
- **Description:** This solution will monitor the `C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/Reboot` path. If the folder for "reboot" exists, it will be renamed to `reboot.bak`. This prevents the update orchestrator from side-loading Microsoft patches on endpoints that are not approved via the RMM.
- **Type:** Script
- **Family:** Patch Management
- **Severity:** Other

![Monitor Configuration](../../../static/img/Update-Orchestrator-Bouncer/image_2.png)

### Conditions:
- **Run Script on:** Schedule
- **Repeat every:** 3 Hours
- **Script Language:** PowerShell
- **Script:**
  ```powershell
  Test-Path 'C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/Reboot'
  ```
- **Criteria:** Contains > AND > "True"
- **Run Automated Task:** [Update Orchestrator Bouncer](https://proval.itglue.com/5078775/docs/13460454#version=published&documentMode=view)

![Conditions](../../../static/img/Update-Orchestrator-Bouncer/image_3.png)

### Ticket Resolution
- **Automatically resolve:** Enabled
- **Run same script as above**
- **Criteria:** Contains > AND > "False"

![Ticket Resolution](../../../static/img/Update-Orchestrator-Bouncer/image_4.png)

## Resources:
*Note: A Task and Device group will need to be created before the monitor can be set up.*  
This monitor is intentionally aimed at the Update Orchestrator group.

![Resources](../../../static/img/Update-Orchestrator-Bouncer/image_5.png)

## Dependencies
- [CW RMM - Custom Field - PowerShell Version](/docs/945d88e0-81a9-4253-8406-63fa7430d45a)
- [CW RMM - Task - PowerShell Version Information](/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b)
- [CW RMM - Device Groups - PowerShell Version](/docs/bbb9f958-4fd3-4fda-903f-7d303bf26779)

## Ticketing
This solution does technically create tickets, but the tickets are designed to autoclose as soon as the machine runs the task to update PowerShell.



