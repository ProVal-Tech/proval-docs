---
id: '8c1f89c7-4858-412a-8845-9b063981f3c5'
title: 'Windows Update History Audit'
title_meta: 'Windows Update History Audit'
keywords: ['windows', 'update', 'audit', 'history', 'endpoint']
description: 'This document outlines the purpose and implementation of the Windows Update History Audit script, which gathers and presents data about installed Windows Updates on endpoints. It also includes associated content that enhances the functionality of the script.'
tags: ['data-collection', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to gather and present data about Windows Updates that have been installed on an endpoint.

## Associated Content

| Content                                                                                              | Type          | Function                                                                                                         |
|------------------------------------------------------------------------------------------------------|---------------|------------------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Get-WindowsUpdateReport](<../powershell/Get-WindowsUpdateReport.md>)     | Agnostic      | Gathers the Windows Update data that the CWA script manipulates.                                               |
| [EPM - Script - Windows Update History Audit](https://proval.itglue.com/DOC-5078775-12275093)     | Script        | Calls [Get-WindowsUpdateReport](<../powershell/Get-WindowsUpdateReport.md>) and manipulates the data for insertion into [pvl_windows_updates](<../cwa/tables/pvl_windows_updates.md>). |
| [EPM - Custom Table - pvl_windows_updates](<../cwa/tables/pvl_windows_updates.md>)                | Custom Table  | Stores information about Windows Update history for agents.                                                     |
| [EPM - Dataview - Windows Update History](<../unsorted/EPM - Dataview - Windows Update History.md>)| Dataview      | Displays information about Windows Update history for agents.                                                  |
| [EPM - Internal Monitor - Patches Not Installing > X Days](<../cwa/monitors/Patches Not Installing  X Days.md>) | Internal Monitor | Monitors that uses the [pvl_windows_updates](<../cwa/tables/pvl_windows_updates.md>) table for referencing installed updates. |

## Implementation

The script [Windows Update History Audit](https://proval.itglue.com/DOC-5078775-12275093) should be scheduled against all compliant Windows endpoints on a weekly basis.

If required, implement the [Patches Not Installing > X Days](<../cwa/monitors/Patches Not Installing  X Days.md>) monitor following the instructions in the documentation.
