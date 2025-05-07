---
id: '9979a839-d375-462c-ae0c-d28038fe5239'
slug: /9979a839-d375-462c-ae0c-d28038fe5239
title: 'Google Drive - Uninstall'
title_meta: 'Google Drive - Uninstall'
keywords: ['google', 'drive', 'uninstall', 'endpoint', 'procedure']
description: 'This document outlines the procedure for removing Google Drive from an endpoint, including a detailed example of the agent procedure log and the steps involved in the uninstallation process.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This procedure outlines the steps to remove Google Drive from the endpoint.

## Example Agent Procedure Log

| Timestamp                   | Procedure                                    | Status                                                                                       | User          |
|-----------------------------|----------------------------------------------|----------------------------------------------------------------------------------------------|---------------|
| 3:20:37 pm 26-Apr-23       | Google Drive - Uninstall                     | Success THEN                                                                                | derek.joniak  |
| 3:20:37 pm 26-Apr-23       | Google Drive - Uninstall-0001                | Google Drive Uninstalled                                                                     | derek.joniak  |
| 3:20:04 pm 26-Apr-23       | Google Drive - Uninstall                     | Stopping the Google Drive service                                                            | derek.joniak  |
| 3:20:04 pm 26-Apr-23       | Google Drive - Uninstall                     | Version of Google Drive detected as: 73.0.4.0                                              | derek.joniak  |
| 3:20:04 pm 26-Apr-23       | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                | derek.joniak  |
| 3:20:04 pm 26-Apr-23       | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | derek.joniak  |
| 3:20:02 pm 26-Apr-23       | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"(Get-ItemProperty HKLM:/SOFTWARE/Microsoft/Windows/CurrentVersion/Uninstall/\{6BBAE539-2232-434A-A4E5-9A33560C6283}).DisplayVersion\" >\"c:/kworking/psoutputtmp.txt\" | derek.joniak  |
| 3:20:02 pm 26-Apr-23       | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                          | derek.joniak  |
| 3:20:02 pm 26-Apr-23       | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as (Get-ItemProperty HKLM:/SOFTWARE/Microsoft/Windows/CurrentVersion/Uninstall/\{6BBAE539-2232-434A-A4E5-9A33560C6283}).DisplayVersion | derek.joniak  |
| 3:20:02 pm 26-Apr-23       | Execute Powershell Command (64-bit, Run As System)-0003 | No Powershell file variable detected.                                                       | derek.joniak  |
| 3:20:01 pm 26-Apr-23       | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                       | derek.joniak  |
| 3:20:00 pm 26-Apr-23       | Google Drive - Uninstall                     | Google Drive Detected                                                                        | derek.joniak  |
| 3:19:54 pm 26-Apr-23       | Run Now - Google Drive - Uninstall           | Admin derek.joniak scheduled procedure Run Now - Google Drive - Uninstall to run at Apr 26 2023 4:19 PM | derek.joniak  |

## Output

Agent Log


