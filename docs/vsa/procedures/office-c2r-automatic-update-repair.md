---
id: 'c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c'
slug: /c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c
title: 'Office C2R Automatic Update Repair'
title_meta: 'Office C2R Automatic Update Repair'
keywords: ['office', 'update', 'repair', 'automatic', 'click2run']
description: 'This document outlines the process to repair the Office Click2Run Automatic Update on an endpoint using the ProVal Agnostic Solution. It includes example logs and details on the execution of the repair procedure.'
tags: ['office365', 'software', 'update']
draft: false
unlisted: false
---

## Summary

This document describes the process to repair the Office Click2Run Automatic Update on an endpoint using the ProVal Agnostic Solution. For detailed instructions, refer to:  
[SWM - Software Configuration - Agnostic - Repair-OfficeAutomaticUpdate](/docs/ae9fa5e1-eb5b-45e5-8777-977d50e39c97)

## Example Agent Procedure Log

| Time                     | Action                                           | Result                                                                                                                               | User                        |
|--------------------------|--------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|
| 9:08:50 am 21-Feb-23    | Automatic Update Repair                          | Success THEN                                                                                                                         | provaltech.com/dan.hicks    |
| 9:08:49 am 21-Feb-23    | Automatic Update Repair-0001                    | Log: 2023-02-21 08:56:15 INIT ----------------------------------------------- 2023-02-21 08:56:15 INIT Repair-OfficeAutomaticUpdate 2023-02-21 08:56:15 INIT System: DEV 2023-02-21 08:56:15 INIT User: DEV$ 2023-02-21 08:56:15 INIT OS Bitness: AMD64 2023-02-21 08:56:15 INIT PowerShell Bitness: 64 2023-02-21 08:56:15 INIT PowerShell Version: 5 2023-02-21 08:56:15 INIT ----------------------------------------------- 2023-02-21 09:08:43 INIT ----------------------------------------------- 2023-02-21 09:08:43 INIT Repair-OfficeAutomaticUpdate 2023-02-21 09:08:43 INIT System: DEV 2023-02-21 09:08:43 INIT User: DEV$ 2023-02-21 09:08:43 INIT OS Bitness: AMD64 2023-02-21 09:08:43 INIT PowerShell Bitness: 64 2023-02-21 09:08:43 INIT PowerShell Version: 5 2023-02-21 09:08:43 INIT ----------------------------------------------- 2023-02-21 09:08:43 WARN RESOLVED ISSUE: UnmanagedUpdateUrl was empty... | provaltech.com/dan.hicks    |
| 9:08:49 am 21-Feb-23    | Automatic Update Repair                          | Raw PS1 Data: 2023-02-21 09:08:43 WARN RESOLVED ISSUE: UnmanagedUpdateUrl was empty. Set the value to the Microsoft Current Channel URI. | provaltech.com/dan.hicks    |
| 9:08:49 am 21-Feb-23    | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                                                         | provaltech.com/dan.hicks    |
| 9:08:49 am 21-Feb-23    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks    |
| 9:08:49 am 21-Feb-23    | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//229175768944442//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3. | provaltech.com/dan.hicks    |
| 9:08:42 am 21-Feb-23    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"%ProgramData%//_automation//AgentProcedure//OfficeAutomaticUpdateRepair//Repair-OfficeAutomaticUpdate.ps1\" >\"c://provaltech//psoutputtmp.txt\" | provaltech.com/dan.hicks    |
| 9:08:42 am 21-Feb-23    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                                                   | provaltech.com/dan.hicks    |
| 9:08:42 am 21-Feb-23    | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%//_automation//AgentProcedure//OfficeAutomaticUpdateRepair//Repair-OfficeAutomaticUpdate.ps1 | provaltech.com/dan.hicks    |
| 9:08:42 am 21-Feb-23    | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                                                                 | provaltech.com/dan.hicks    |
| 9:08:40 am 21-Feb-23    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                                               | provaltech.com/dan.hicks    |
| 9:08:38 am 21-Feb-23    | Execute Powershell Command                       | Success THEN                                                                                                                         | provaltech.com/dan.hicks    |
| 9:08:37 am 21-Feb-23    | Execute Powershell Command-0011                 | Powershell command completed!                                                                                                        | provaltech.com/dan.hicks    |
| 9:08:35 am 21-Feb-23    | Execute Powershell Command-0011                 | Executing powershell \"\" -Command \"New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name OfficeAutomaticUpdateRepair\" \"\" | provaltech.com/dan.hicks    |
| 9:08:35 am 21-Feb-23    | Execute Powershell Command-0010                 | Not sending output to variable.                                                                                                      | provaltech.com/dan.hicks    |
| 9:08:35 am 21-Feb-23    | Execute Powershell Command-0008                 | New command variable is: -Command \"New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name OfficeAutomaticUpdateRepair\" | provaltech.com/dan.hicks    |
| 9:08:35 am 21-Feb-23    | Execute Powershell Command-0008                 | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name OfficeAutomaticUpdateRepair | provaltech.com/dan.hicks    |
| 9:08:31 am 21-Feb-23    | Execute Powershell Command-0002                 | Powershell is present.                                                                                                               | provaltech.com/dan.hicks    |
| 9:08:23 am 21-Feb-23    | Run Now - Automatic Update Repair                | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Automatic Update Repair to run at Feb 21 2023 9:08 AM                   |                             |

## Output

Agent Procedure Log