---
id: '4fb8001d-94a0-4867-8776-437c4f6b97cc'
slug: /4fb8001d-94a0-4867-8776-437c4f6b97cc
title: 'Uninstall DUO'
title_meta: 'Uninstall DUO'
keywords: ['duo', 'uninstall', 'script', 'application', 'ticketing']
description: 'This document provides details about a specialized script designed to uninstall the DUO application from systems. It includes sample runs, dependencies, global parameters, and ticketing information for failed uninstallation attempts.'
tags: ['software', 'ticketing', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This is a version of [SWM - Software Uninstall - Script - Remove Application](/docs/494f7109-e4b2-4ffa-93f8-e33089b09b4e) that is being used to remove DUO specifically.

## Sample Run

![Sample Run](../../../static/img/docs/0c3523a9-e392-40f6-bc59-173a21001f0d/image_4.png)

## Dependencies

[SWM - Software Uninstall - Agnostic - Remove-Application](/docs/8230693f-cf73-479d-8279-d2ff54c4296e)

#### Global Parameters

| Name                | Example                                 | Mandatory | Description                                                                                                                                                   |
|---------------------|-----------------------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name                | Duo Authentication for Windows Logon x64 | True      | The name of the application(s) to remove. Note: No need to update this parameter as it is being used to remove DUO specifically.                           |
| Enable_Ticketing    | 1                                       | False     | Setting this parameter to 1 will enable the ticket creation feature of the script, and the script will create a ticket if it fails to uninstall the application. |

## Output

- Script Logs
- Ticketing

## Ticketing

**Subject:** `DUO Removal - Failed - %COMPUTERNAME%`

**Ticket Body:** `The script attempted to remove DUO from the computer but it failed. In addition to the primary removal script (Remove-Application.ps1), alternative uninstallation methods utilizing uninstall strings stored in Automate were also employed. Despite this, the script failed to remove the application. Manual review is required to identify the cause of the failure.`


