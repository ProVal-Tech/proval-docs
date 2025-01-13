---
id: 'vsa-office-activation-status-audit'
title: 'Office Activation Status Audit'
title_meta: 'Office Activation Status Audit'
keywords: ['office', 'activation', 'audit', 'status', 'software']
description: 'This document provides a detailed overview of the Office Activation Status Audit process, including example logs, dependencies, and output details for auditing licensed Office products on endpoints.'
tags: ['office', 'audit', 'software', 'configuration', 'report']
draft: false
unlisted: false
---
## Summary

Get activation information on any licensed Office products on the endpoint and save to [SWM - Software Configuration - Custom Field - xPVAL Office Activation Status](https://proval.itglue.com/DOC-5078775-12015988).

## Example Agent Procedure Log

| Time                      | Procedure                                | Status                                                                                                         | User                        |
|---------------------------|------------------------------------------|----------------------------------------------------------------------------------------------------------------|-----------------------------|
| 12:48:57 pm 1-Feb-23     | Office Activation Status Audit           | Success THEN                                                                                                   | provaltech.com/dan.hicks    |
| 12:48:56 pm 1-Feb-23     | Office Activation Status Audit-0001      | Log: 2023-02-01 12:48:23 INIT ----------------------------------------------- 2023-02-01 12:48:23 INIT Get-OfficeActivationStatus 2023-02-01 12:48:23 INIT System: DEV 2023-02-01 12:48:23 INIT User: DEV$ 2023-02-01 12:48:23 INIT OS Bitness: AMD64 2023-02-01 12:48:23 INIT PowerShell Bitness: 64 2023-02-01 12:48:23 INIT PowerShell Version: 5 2023-02-01 12:48:23 INIT ----------------------------------------------- | provaltech.com/dan.hicks    |
| 12:48:56 pm 1-Feb-23     | Office Activation Status Audit           | Raw PS1 Data:                                                                                                | provaltech.com/dan.hicks    |
| 12:48:56 pm 1-Feb-23     | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                                   | provaltech.com/dan.hicks    |
| 12:48:56 pm 1-Feb-23     | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks    |
| 12:48:56 pm 1-Feb-23     | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/229175768944442/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks    |
| 12:48:20 pm 1-Feb-23     | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "%ProgramData%/_automation/AgentProcedure/OfficeActivationAudit/Get-OfficeActivationStatus.ps1" >"c:/provaltech/psoutputtmp.txt" | provaltech.com/dan.hicks    |
| 12:48:20 pm 1-Feb-23     | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                             | provaltech.com/dan.hicks    |
| 12:48:19 pm 1-Feb-23     | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%/_automation/AgentProcedure/OfficeActivationAudit/Get-OfficeActivationStatus.ps1 | provaltech.com/dan.hicks    |
| 12:48:19 pm 1-Feb-23     | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                                          | provaltech.com/dan.hicks    |
| 12:48:16 pm 1-Feb-23     | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                         | provaltech.com/dan.hicks    |
| 12:44:27 pm 1-Feb-23     | Execute Powershell Command                | Success THEN                                                                                                   | provaltech.com/dan.hicks    |
| 12:44:26 pm 1-Feb-23     | Execute Powershell Command-0011           | Powershell command completed!                                                                                 | provaltech.com/dan.hicks    |
| 12:44:22 pm 1-Feb-23     | Execute Powershell Command-0011           | Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name OfficeActivationAudit" "" | provaltech.com/dan.hicks    |
| 12:44:22 pm 1-Feb-23     | Execute Powershell Command-0010           | Not sending output to variable.                                                                                | provaltech.com/dan.hicks    |
| 12:44:22 pm 1-Feb-23     | Execute Powershell Command-0008           | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name OfficeActivationAudit" | provaltech.com/dan.hicks    |
| 12:44:22 pm 1-Feb-23     | Execute Powershell Command-0008           | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name OfficeActivationAudit | provaltech.com/dan.hicks    |
| 12:44:16 pm 1-Feb-23     | Execute Powershell Command-0002           | Powershell is present.                                                                                         | provaltech.com/dan.hicks    |
| 12:44:05 pm 1-Feb-23     | Run Now - Office Activation Status Audit   | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Office Activation Status Audit to run at Feb 1 2023 12:44PM |                             |

## Dependencies

- [https://proval.itglue.com/DOC-5078775-12015988](https://proval.itglue.com/DOC-5078775-12015988)
- [SWM - Software Configuration - Agnostic - Get-OfficeActivationStatus](https://proval.itglue.com/DOC-5078775-11958168)

## Process

Runs Agnostic Powershell to perform the audit.

## Output

- AP Log
- xPVAL Office Activation Status CF




