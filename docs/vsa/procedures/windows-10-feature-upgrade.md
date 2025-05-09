---
id: '5756f649-47ee-4bf0-b8ef-f65eeb4453fe'
slug: /5756f649-47ee-4bf0-b8ef-f65eeb4453fe
title: 'Windows 10 Feature Upgrade'
title_meta: 'Windows 10 Feature Upgrade'
keywords: ['windows', 'upgrade', 'feature', 'reboot', 'patching']
description: 'This document outlines the process of initiating a Windows 10 feature upgrade that requires a mandatory reboot. It includes a summary of the procedure, sample run logs, and detailed steps of the process involved in executing the upgrade and scheduling necessary tasks.'
tags: ['patching', 'reboot', 'windows']
draft: false
unlisted: false
---

## Summary

Initiates a Windows Feature Upgrade with a mandatory reboot.

## Sample Run

| Time                   | Task                                                         | Status                                                                                           | Link                          |
|------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------------------------|-------------------------------|
| 3:57:45 pm 31-Aug-22  | Windows 10 Feature Upgrade                                   | Success THEN                                                                                     | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:45 pm 31-Aug-22  | Windows 10 Feature Upgrade                                   | Script Registry Check was successfully scheduled to run in 1 hour                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:45 pm 31-Aug-22  | Windows 10 Feature Upgrade                                   | Raw PS1 Data: Id Name PSJobTypeName State HasMoreData Location Command -- ---- ------------- ----- ----------- -------- ------- 1 Job1 BackgroundJob Running True localhost C:/ProgramData/_autom... | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:45 pm 31-Aug-22  | Execute PowerShell Command (64-bit, Run As System)         | Success THEN                                                                                     | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:45 pm 31-Aug-22  | Execute PowerShell Command (64-bit, Run As System)-0016    | PowerShell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:32 pm 31-Aug-22  | Execute PowerShell Command (64-bit, Run As System)-0011    | Executing 64-bit PowerShell command as System: \"\" -command \"Start-Job -ScriptBlock \\\{ C:/ProgramData/_automation/AgentProcedure/UpdateWindows10/Update-Windows10.ps1 -Reboot None}\" >\"c:/provaltech/psoutputtmp.txt\" | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:32 pm 31-Aug-22  | Execute PowerShell Command (64-bit, Run As System)-0013    | Sending output to global variable.                                                               | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:32 pm 31-Aug-22  | Execute PowerShell Command (64-bit, Run As System)-0008    | Custom commands detected as Start-Job -ScriptBlock \\\{ C:/ProgramData/_automation/AgentProcedure/UpdateWindows10/Update-Windows10.ps1 -Reboot None} | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:32 pm 31-Aug-22  | Execute PowerShell Command (64-bit, Run As System)-0003    | No PowerShell file variable detected.                                                            | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:31 pm 31-Aug-22  | Execute PowerShell Command (64-bit, Run As System)-0002    | PowerShell is present.                                                                            | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:17 pm 31-Aug-22  | Execute PowerShell Command                                   | Success THEN                                                                                     | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:16 pm 31-Aug-22  | Execute PowerShell Command-0011                             | PowerShell command completed!                                                                     | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:13 pm 31-Aug-22  | Execute PowerShell Command-0011                             | Executing PowerShell \"\" -Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name UpdateWindows10\" \"\" | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:13 pm 31-Aug-22  | Execute PowerShell Command-0010                             | Not sending output to variable.                                                                    | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:13 pm 31-Aug-22  | Execute PowerShell Command-0008                             | New command variable is: -Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name UpdateWindows10\" | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:13 pm 31-Aug-22  | Execute PowerShell Command-0008                             | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name UpdateWindows10 | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:57:05 pm 31-Aug-22  | Execute PowerShell Command-0002                             | PowerShell is present.                                                                            | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 3:56:58 pm 31-Aug-22  | Get Add/Remove Programs List                                 | Success THEN                                                                                     |                               |
| 3:56:57 pm 31-Aug-22  | SW License Audit                                             | Success THEN                                                                                     |                               |
| 3:56:57 pm 31-Aug-22  | Close KLicense                                              | Success ELSE                                                                                     |                               |
| 3:56:57 pm 31-Aug-22  | Check if KLicense running                                    | Success ELSE                                                                                     |                               |
| 3:56:05 pm 31-Aug-22  | Run Now - Windows 10 Feature Upgrade                        | Admin [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) scheduled procedure Run Now - Windows 10 Feature Upgrade to run at Aug 31 2022 3:56 PM |                               |

## Process

Starts a job running in the background to execute [SEC - Windows Patching - Agnostic - Update-Windows10](/docs/7fdd2a3b-2dca-43db-8a1d-f350967f1055) on the machine with no reboot.  
Schedules [SEC - Windows Patching - Agent Procedure - Registry Check](/docs/f0d83724-e8a8-41f8-8f73-fea99d0f34de) for 1 hour from run time.  
Sets [SEC - Windows Patching - Custom Fields - xPVAL Windows Feature Upgrade Status](/docs/1b448856-c7d6-4aed-8080-474f5650a070) to [In Progress].

## Output

AP Log  
[SEC - Windows Patching - Custom Fields - xPVAL Windows Feature Upgrade Status](/docs/1b448856-c7d6-4aed-8080-474f5650a070)  
PSOutput Document