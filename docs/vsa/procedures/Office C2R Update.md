---
id: 'ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8'
title: 'On-Demand Update for Click2Run Office Installation'
title_meta: 'On-Demand Update for Click2Run Office Installation'
keywords: ['update', 'office', 'click2run', 'installation']
description: 'This document provides a detailed procedure for performing an on-demand update for Click2Run Office installations on endpoints using an agnostic solution. It includes example logs, dependencies, and output details to assist in the execution and troubleshooting of the update process.'
tags: ['configuration', 'software', 'update', 'windows']
draft: false
unlisted: false
---
## Summary

Perfoms an on-demand update for a Click2Run Office installation on an endpoint using agnostic solution  
[SWM - Software Configuration - Agnostic - Update-Office](https://proval.itglue.com/DOC-5078775-12083647) 

## Example Agent Procedure Log

| Time                   | Action                                              | Status/Details                                                                                 | User                        |
|------------------------|-----------------------------------------------------|-----------------------------------------------------------------------------------------------|-----------------------------|
| 9:22:35 am 21-Feb-23   | Office C2R Update                                   | Success THEN                                                                                  | provaltech.com/dan.hicks    |
| 9:22:34 am 21-Feb-23   | Office C2R Update-0001                             | Log: 2023-02-21 09:22:29 INIT ... WARN Office version did not increment.                     | provaltech.com/dan.hicks    |
| 9:22:34 am 21-Feb-23   | Office C2R Update                                   | Raw PS1 Data:                                                                                | provaltech.com/dan.hicks    |
| 9:22:34 am 21-Feb-23   | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                  | provaltech.com/dan.hicks    |
| 9:22:33 am 21-Feb-23   | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# ...    | provaltech.com/dan.hicks    |
| 9:22:33 am 21-Feb-23   | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file ...                               | provaltech.com/dan.hicks    |
| 9:22:28 am 21-Feb-23   | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: ...                                         | provaltech.com/dan.hicks    |
| 9:22:28 am 21-Feb-23   | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                           | provaltech.com/dan.hicks    |
| 9:22:28 am 21-Feb-23   | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%//_automation//AgentProcedure//OfficeUpdate//Update-Office.ps1 | provaltech.com/dan.hicks    |
| 9:22:28 am 21-Feb-23   | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.                                                        | provaltech.com/dan.hicks    |
| 9:22:27 am 21-Feb-23   | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                        | provaltech.com/dan.hicks    |
| 9:22:25 am 21-Feb-23   | Execute Powershell Command                           | Success THEN                                                                                  | provaltech.com/dan.hicks    |
| 9:22:24 am 21-Feb-23   | Execute Powershell Command-0011                     | Powershell command completed!                                                                | provaltech.com/dan.hicks    |
| 9:22:22 am 21-Feb-23   | Execute Powershell Command-0011                     | Executing powershell ...                                                                     | provaltech.com/dan.hicks    |
| 9:22:21 am 21-Feb-23   | Execute Powershell Command-0010                     | Not sending output to variable.                                                               | provaltech.com/dan.hicks    |
| 9:22:21 am 21-Feb-23   | Execute Powershell Command-0008                     | New command variable is: -Command ...                                                        | provaltech.com/dan.hicks    |
| 9:22:21 am 21-Feb-23   | Execute Powershell Command-0008                     | Custom commands detected as ...                                                               | provaltech.com/dan.hicks    |
| 9:22:19 am 21-Feb-23   | Execute Powershell Command-0002                     | Powershell is present.                                                                        | provaltech.com/dan.hicks    |
| 9:22:10 am 21-Feb-23   | Run Now - Office C2R Update                         | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Office C2R Update ...         |                             |

## Dependencies

Does this Procedure depend on other VSA content? Link the ITGlue Article for the content documentation.

## Output

Procedure Logfiles and other outputs







