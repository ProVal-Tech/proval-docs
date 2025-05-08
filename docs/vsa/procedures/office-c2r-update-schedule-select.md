---
id: 'd401a54a-5bff-4d37-8fdf-001220f73fb5'
slug: /d401a54a-5bff-4d37-8fdf-001220f73fb5
title: 'Office C2R Update Schedule Select'
title_meta: 'Office C2R Update Schedule Select'
keywords: ['microsoft', 'update', 'click2run', 'office', 'installation']
description: 'This document provides a detailed guide on how to set the Microsoft Update Channel for a Click2Run Office installation on an endpoint using an agnostic solution. It includes a summary, example agent procedure logs, and expected output for successful execution.'
tags: ['office365', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines how to set the Microsoft Update Channel for a Click2Run Office installation on an endpoint using an agnostic solution:  
[SWM - Software Configuration - Agnostic - Set-OfficeUpdateSchedule](/docs/ad02ff16-29f5-484c-9fef-638dfa0342d0)

## Example Agent Procedure Log

| Time                        | Action                                             | Status                                                                                           | User                          |
|-----------------------------|---------------------------------------------------|--------------------------------------------------------------------------------------------------|-------------------------------|
| 9:20:17 am 21-Feb-23       | Office Update Schedule Select                      | Success THEN                                                                                    | provaltech.com/dan.hicks      |
| 9:20:17 am 21-Feb-23       | Office Update Schedule Select-0001                | Log: 2023-02-21 09:20:13 INIT ----------------------------------------------- 2023-02-21 09:20:13 INIT Set-OfficeUpdateSchedule 2023-02-21 09:20:13 INIT System: DEV 2023-02-21 09:20:13 INIT User: DEV$ 2023-02-21 09:20:13 INIT OS Bitness: AMD64 2023-02-21 09:20:14 INIT PowerShell Bitness: 64 2023-02-21 09:20:14 INIT PowerShell Version: 5 2023-02-21 09:20:14 INIT ----------------------------------------------- 2023-02-21 09:20:14 LOG Current Office 365 Channel: Current Channel 2023-02-21 09:20:14 LOG Setting Channel to Current Channel | provaltech.com/dan.hicks      |
| 9:20:16 am 21-Feb-23       | Office Update Schedule Select                      | Raw PS1 Data: Could not compare "16.0.16026.20146" to "16". Error: "Cannot convert value "16" to type "System.Version". Error: "Version string portion was too short or too long." At C:/ProgramData/_automation/AgentProcedure/OfficeUpdateChannelSelect/Set-OfficeUpdateSchedule.ps1:41 char:5 + if ([Version]$configurationKey.VersionToReport -lt 16) \\\{ + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ + CategoryInfo : InvalidOperation: (:) [], RuntimeException + FullyQualifiedErrorId : ComparisonFailure 2023-02-21 09:20:14 LOG Current Office 365 Channel: Current Channel 2023-02-21 09:20:14 LOG Setting Channel to Current Channel | provaltech.com/dan.hicks      |
| 9:20:16 am 21-Feb-23       | Execute Powershell Command (64-bit, Run As System)| Success THEN                                                                                    | provaltech.com/dan.hicks      |
| 9:20:16 am 21-Feb-23       | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks      |
| 9:20:16 am 21-Feb-23       | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/229175768944442/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks      |
| 9:20:13 am 21-Feb-23       | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "%ProgramData%/_automation/AgentProcedure/OfficeUpdateChannelSelect/Set-OfficeUpdateSchedule.ps1 -channel 'Current Channel'" >"c:/provaltech/psoutputtmp.txt" | provaltech.com/dan.hicks      |
| 9:20:13 am 21-Feb-23       | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                               | provaltech.com/dan.hicks      |
| 9:20:12 am 21-Feb-23       | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%/_automation/AgentProcedure/OfficeUpdateChannelSelect/Set-OfficeUpdateSchedule.ps1 -channel 'Current Channel' | provaltech.com/dan.hicks      |
| 9:20:12 am 21-Feb-23       | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                            | provaltech.com/dan.hicks      |
| 9:20:12 am 21-Feb-23       | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                           | provaltech.com/dan.hicks      |
| 9:20:09 am 21-Feb-23       | Execute Powershell Command                          | Success THEN                                                                                    | provaltech.com/dan.hicks      |
| 9:20:09 am 21-Feb-23       | Execute Powershell Command-0011                     | Powershell command completed!                                                                    | provaltech.com/dan.hicks      |
| 9:20:06 am 21-Feb-23       | Execute Powershell Command-0011                     | Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name OfficeUpdateChannelSelect" "" | provaltech.com/dan.hicks      |
| 9:20:06 am 21-Feb-23       | Execute Powershell Command-0010                     | Not sending output to variable.                                                                  | provaltech.com/dan.hicks      |
| 9:20:06 am 21-Feb-23       | Execute Powershell Command-0008                     | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name OfficeUpdateChannelSelect" | provaltech.com/dan.hicks      |
| 9:20:06 am 21-Feb-23       | Execute Powershell Command-0008                     | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name OfficeUpdateChannelSelect | provaltech.com/dan.hicks      |
| 9:20:03 am 21-Feb-23       | Execute Powershell Command-0002                     | Powershell is present.                                                                           | provaltech.com/dan.hicks      |
| 9:19:54 am 21-Feb-23       | Run Now - Office Update Schedule Select              | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Office Update Schedule Select to run at Feb 21 2023 9:19 AM |                               |

## Output

Agent Procedure Log

