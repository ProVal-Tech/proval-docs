---
id: '0ecbf1e1-8947-417c-a3ad-952fcf218140'
slug: /0ecbf1e1-8947-417c-a3ad-952fcf218140
title: 'Windows 10 Feature Upgrade (No Reboot)'
title_meta: 'Windows 10 Feature Upgrade (No Reboot)'
keywords: ['windows', 'upgrade', 'feature', 'no', 'reboot', 'procedure', 'background', 'job']
description: 'This document outlines the process for initiating a Windows 10 feature upgrade on a target endpoint without forcing a reboot. It includes a summary of the procedure, sample run logs, and the expected output, while highlighting the importance of data loss during the upgrade process.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document initiates a feature upgrade on the target endpoint without forcing a reboot. 

**WARNING:** All data modified in `%WinDir%` will be lost between the upgrade completion and reboot. This procedure is also initiated by [SEC - Windows Patching - Policy - Windows 10 Feature Upgrade Reattempt on Fail](/docs/a347ce1a-5ef9-4e07-a42e-629d7d49c620).

## Sample Run

| Time                | Action                                               | Status                                | User                          |
|---------------------|------------------------------------------------------|---------------------------------------|-------------------------------|
| 10:58:35 am 1-Sep-22 | Windows 10 Feature Upgrade (No Reboot)              | Success THEN                          | provaltech.com/dan.hicks     |
| 10:58:35 am 1-Sep-22 | Windows 10 Feature Upgrade (No Reboot)              | Raw PS1 Data: Id Name PSJobTypeName State HasMoreData Location Command -- ---- ------------- ----- ----------- -------- ------- 1 Job1 BackgroundJob Running True localhost C:/ProgramData/_autom... | provaltech.com/dan.hicks     |
| 10:58:35 am 1-Sep-22 | Execute Powershell Command (64-bit, Run As System) | Success THEN                          | provaltech.com/dan.hicks     |
| 10:58:35 am 1-Sep-22 | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of the server. | provaltech.com/dan.hicks     |
| 10:58:35 am 1-Sep-22 | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/946598527505563/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks     |
| 10:58:23 am 1-Sep-22 | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"Start-Job -ScriptBlock \\\{ C:/ProgramData/_automation/AgentProcedure/UpdateWindows10/Update-Windows10.ps1 -Reboot None}\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/dan.hicks     |
| 10:58:23 am 1-Sep-22 | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.    | provaltech.com/dan.hicks     |
| 10:58:22 am 1-Sep-22 | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as Start-Job -ScriptBlock \\\{ C:/ProgramData/_automation/AgentProcedure/UpdateWindows10/Update-Windows10.ps1 -Reboot None} | provaltech.com/dan.hicks     |
| 10:58:22 am 1-Sep-22 | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected. | provaltech.com/dan.hicks     |
| 10:58:21 am 1-Sep-22 | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                | provaltech.com/dan.hicks     |
| 10:58:17 am 1-Sep-22 | Execute Powershell Command                           | Success THEN                          | provaltech.com/dan.hicks     |
| 10:58:17 am 1-Sep-22 | Execute Powershell Command-0011                      | Powershell command completed!         | provaltech.com/dan.hicks     |
| 10:58:12 am 1-Sep-22 | Execute Powershell Command-0011                      | Executing powershell \"\" -Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name UpdateWindows10\" \"\" | provaltech.com/dan.hicks     |
| 10:58:12 am 1-Sep-22 | Execute Powershell Command-0010                      | Not sending output to variable.       | provaltech.com/dan.hicks     |
| 10:58:12 am 1-Sep-22 | Execute Powershell Command-0008                      | New command variable is: -Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name UpdateWindows10\" | provaltech.com/dan.hicks     |
| 10:58:12 am 1-Sep-22 | Execute Powershell Command-0008                      | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name UpdateWindows10 | provaltech.com/dan.hicks     |
| 10:58:04 am 1-Sep-22 | Execute Powershell Command-0002                      | Powershell is present.                | provaltech.com/dan.hicks     |
| 10:57:55 am 1-Sep-22 | Run Now - Windows 10 Feature Upgrade (No Reboot)    | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Windows 10 Feature Upgrade (No Reboot) to run at Sep 1 2022 10:57 AM | provaltech.com/dan.hicks     |

## Process

This process starts a job running in the background to execute [SEC - Windows Patching - Agnostic - Update-Windows10](/docs/7fdd2a3b-2dca-43db-8a1d-f350967f1055) on the machine with no reboot. It sets [SEC - Windows Patching - Custom Fields - xPVAL Windows Feature Upgrade Status](/docs/1b448856-c7d6-4aed-8080-474f5650a070) to [REBOOT PENDING].

## Output

- AP Log  
- [SEC - Windows Patching - Custom Fields - xPVAL Windows Feature Upgrade Status](/docs/1b448856-c7d6-4aed-8080-474f5650a070)  
- PSOutput Document