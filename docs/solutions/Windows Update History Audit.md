---
id: 'cwa-windows-update-history-audit'
title: 'Windows Update History Audit'
title_meta: 'Windows Update History Audit'
keywords: ['windows', 'update', 'audit', 'history', 'endpoint']
description: 'This document outlines the purpose and implementation of the Windows Update History Audit script, which gathers and presents data about installed Windows Updates on endpoints. It also includes associated content that enhances the functionality of the script.'
tags: ['windows', 'update', 'audit', 'monitoring', 'data-collection']
draft: false
unlisted: false
---
## Purpose

Gather and present data about Windows Updates that have been installed on an endpoint.

## Associated Content

| Content                                                                                              | Type        | Function                                                                                                         |
|------------------------------------------------------------------------------------------------------|-------------|------------------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Get-WindowsUpdateReport](https://proval.itglue.com/DOC-5078775-10372095) | Agnostic    | Gathers the Windows Update data that the CWA script manipulates.                                               |
| [EPM - Script - Windows Update History Audit](https://proval.itglue.com/DOC-5078775-12275093)     | Script      | Calls [Get-WindowsUpdateReport](https://proval.itglue.com/DOC-5078775-10372095) and manipulates the data for insertion into [pvl_windows_updates](https://proval.itglue.com/DOC-5078775-12275091). |
| [EPM - Custom Table - pvl_windows_updates](https://proval.itglue.com/DOC-5078775-12275091)         | Custom Table| Stores information about Windows Update history for agents.                                                     |
| [EPM - Dataview - Windows Update History](https://proval.itglue.com/DOC-5078775-12275090)          | Dataview    | Displays information about Windows Update history for agents.                                                  |
| [EPM - Internal Monitor - Patches Not Installing > X Days](https://proval.itglue.com/DOC-5078775-10946278) | Internal Monitor | Monitor that uses the [pvl_windows_updates](https://proval.itglue.com/DOC-5078775-12275091) table for referencing installed updates. |

## Implementation

The script [Windows Update History Audit](https://proval.itglue.com/DOC-5078775-12275093) should be scheduled against all compliant Windows endpoints on a weekly basis.

If required, implement the [Patches Not Installing > X Days](https://proval.itglue.com/DOC-5078775-10946278) monitor via the instructions in the documentation.



