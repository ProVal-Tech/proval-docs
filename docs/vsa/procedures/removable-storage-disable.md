---
id: 'b50eaaf9-9ec6-412b-85a6-44e6e82c43f9'
slug: /b50eaaf9-9ec6-412b-85a6-44e6e82c43f9
title: 'Removable Storage Disable'
title_meta: 'Removable Storage Disable'
keywords: ['removable', 'storage', 'disable', 'endpoint', 'security']
description: 'This document details the procedure to disable removable storage devices on endpoints, ensuring enhanced security by preventing unauthorized access to removable media. It includes notes on reboot requirements, example agent procedure logs, and the registry modifications necessary for implementation.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

Disables removable storage devices on the endpoint.

## Notes

- No reboot is required unless a removable device is already connected to the endpoint.

## Example Agent Procedure Log

| Time                     | Action                                        | Status                                    | User                         |
|--------------------------|-----------------------------------------------|-------------------------------------------|------------------------------|
| 4:23:54 pm 1-Nov-22     | Removable Storage Disable                     | Success THEN                             | provaltech.com/dan.hicks     |
| 4:23:54 pm 1-Nov-22     | Removable Storage Disable                     | Removable Storage has been disallowed on this endpoint. | provaltech.com/dan.hicks     |
| 4:23:54 pm 1-Nov-22     | Execute Powershell Command (64-bit, Run As System) | Success THEN                             | provaltech.com/dan.hicks     |
| 4:23:54 pm 1-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0014 | Powershell command completed!            | provaltech.com/dan.hicks     |
| 4:23:54 pm 1-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "$ItemPath = 'HKLM://SOFTWARE//Policies//Microsoft//Windows//RemovableStorageDevices';if (!(Test-Path -Path $ItemPath)) \{New-Item -Path $ItemPath -Force};Set-ItemProperty -Path $ItemPath -Name 'Deny_All' -Value 1 -Force" "" | provaltech.com/dan.hicks     |
| 4:23:54 pm 1-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0013 | Not sending output to variable.          | provaltech.com/dan.hicks     |
| 4:23:54 pm 1-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as $ItemPath = 'HKLM://SOFTWARE//Policies//Microsoft//Windows//RemovableStorageDevices';if (!(Test-Path -Path $ItemPath)) \{New-Item -Path $ItemPath -Force};Set-ItemProperty -Path $ItemPath -Name 'Deny_All' -Value 1 -Force | provaltech.com/dan.hicks     |
| 4:23:54 pm 1-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.    | provaltech.com/dan.hicks     |
| 4:23:53 pm 1-Nov-22     | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                   | provaltech.com/dan.hicks     |
| 4:23:45 pm 1-Nov-22     | Run Now - Removable Storage Disable          | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Removable Storage Disable to run at Nov 1 2022 4:23 PM | provaltech.com/dan.hicks     |

## Process

Sets HKLM://SOFTWARE//Policies//Microsoft//Windows//RemovableStorageDevices//Deny_All to 1

## Output

AP Log

