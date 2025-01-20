---
id: '9f991e6a-9560-46ee-a9cc-29e401f000e0'
title: 'HP iLO Health Check Monitor'
title_meta: 'HP iLO Health Check Monitor'
keywords: ['ilo', 'health', 'monitor', 'ticket', 'alert']
description: 'This document details the setup and functionality of the HP iLO Health Check Monitor, which tracks bad health conditions reported by the HP iLO Health Report script and creates tickets based on these alerts. It includes dependencies, alert templates, and ticketing procedures to ensure effective monitoring and response.'
tags: ['ticketing']
draft: false
unlisted: false
---
## Summary

Monitors for bad health conditions returned from the script [HP iLO - Health Report - Get](<../scripts/HP iLO - Health Report - Get.md>) into the custom table [plugin_proval_ilo_health_report](<../tables/plugin_proval_ilo_health_report.md>).

## Dependencies

- [plugin_proval_ilo_health_report](<../tables/plugin_proval_ilo_health_report.md>)
- [HP iLO - Health Report - Get](<../scripts/HP iLO - Health Report - Get.md>)
- [Get-HPiLOHealthReport](<../../powershell/Get-HPiLOHealthReport.md>)
- [CWM - Automate - Script - Ticket Creation - HP iLO Health Check*](<../scripts/Ticket Creation - HP iLO Health Check.md>)

## Target

Global - Should be run without explicitly defined targets.

## Alert Template

**Name:** `△ Custom - Ticket Creation - HP iLO Health Check`

The alert template should execute the [CWM - Automate - Script - Ticket Creation - HP iLO Health Check*](<../scripts/Ticket Creation - HP iLO Health Check.md>) script.

## Ticket Category

Ticket Category for the tickets can be controlled by the monitor set itself.

![Ticket Category Image](../../../static/img/HP-iLO-Health-Report-Check/image_1.png)

## Ticketing

**Subject:** `HP iLO Health Check FAILED for iLO at \\<IP Address of the iLO Device>`

**Summary:**

```
HP iLO Health Check FAILED for on \\<Name of the Client>'s \\<Name of the iLO Device> - \\<IP Address of the iLO Device>
```

```
The information has been outlined below:
SN: \\<Serial Number of the iLO Device>|Model: \\<Model of the iLO Device>|\\<Problem Detected with the iLO Device>
```

```
See details in the iLO and the iLO Health Report dataview.
```

**Note:** The ticket will be generated for the computer whose computerid is stored in the title of the password entry for the iLO device. If the computerid is not stored in the iLO password entry, then a client-level ticket will be created instead.













