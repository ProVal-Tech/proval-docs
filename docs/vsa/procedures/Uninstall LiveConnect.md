---
id: '4a93b183-7e52-42a5-b72a-db3abbb973e1'
title: 'Uninstall LiveConnect'
title_meta: 'Uninstall LiveConnect'
keywords: ['uninstallation', 'liveconnect', 'agent', 'endpoint', 'procedure']
description: 'This document provides a detailed overview of the script created for the uninstallation of the LiveConnect agent from endpoints. It includes sample run logs, dependencies, process steps, and output information related to the agent procedure.'
tags: ['uninstallation']
draft: false
unlisted: false
---

## Summary

This script is created for the uninstallation of the LiveConnect agent from the endpoint.

## Sample Run

| Time                  | Action                                        | Status                                   | User                           |
|-----------------------|-----------------------------------------------|------------------------------------------|--------------------------------|
| 8:32:45 am 9-Aug-22   | Uninstall LiveConnect                         | Success THEN                            | provaltech.com/kunal.kumar    |
| 8:32:45 am 9-Aug-22   | Uninstall LiveConnect-0004                   | LiveConnect Uninstall Successfully      | provaltech.com/kunal.kumar    |
| 8:32:45 am 9-Aug-22   | Uninstall LiveConnect                         | No Instance(s) Available.               | provaltech.com/kunal.kumar    |
| 8:32:45 am 9-Aug-22   | Execute Shell command - Get Results to Variable | Success THEN                            | provaltech.com/kunal.kumar    |
| 8:32:42 am 9-Aug-22   | Execute Shell command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: wmic product where "Name like '%Live Connect%'\" get Name >"c://provaltech//commandresults-1964392795.txt" 2>&1 | provaltech.com/kunal.kumar    |
| 8:32:21 am 9-Aug-22   | Uninstall LiveConnect-0002                   | Data: 32-bit Software Version found. Uninstalling. | provaltech.com/kunal.kumar    |
| 8:32:20 am 9-Aug-22   | Uninstall LiveConnect-0001                   | Log: 2022-08-09 08:32:16 INIT ----------------------------------------------- 2022-08-09 08:32:16 INIT Uninstall-LiveConnect 2022-08-09 08:32:17 INIT System: DEV-WIN10-1 2022-08-09 08:32:17 INIT User: DEV-WIN10-1$ 2022-08-09 08:32:17 INIT OS Bitness: AMD64 2022-08-09 08:32:17 INIT PowerShell Bitness: 64 2022-08-09 08:32:17 INIT PowerShell Version: 5 2022-08-09 08:32:17 INIT ----------------------------------------------- 2022-08-09 08:32:17 LOG PowerShell is already at or above version 5. 2022-08-09 08:32:17 DATA 32-bit Software Version found. Uninstalling. 2022-08-09 08:32:17 LOG 32-bit version uninstalled. | provaltech.com/kunal.kumar    |
| 8:32:20 am 9-Aug-22   | Uninstall LiveConnect                         | Raw PS1 Data:                           | provaltech.com/kunal.kumar    |
| 8:32:20 am 9-Aug-22   | Execute PowerShell Command (64-bit, Run As System) | Success THEN                            | provaltech.com/kunal.kumar    |
| 8:32:20 am 9-Aug-22   | Execute PowerShell Command (64-bit, Run As System)-0016 | PowerShell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/kunal.kumar    |
| 8:32:20 am 9-Aug-22   | Execute PowerShell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//233148175125752//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3. | provaltech.com/kunal.kumar    |
| 8:32:13 am 9-Aug-22   | Execute PowerShell Command (64-bit, Run As System)-0011 | Executing 64-bit PowerShell command as System: "" -command "%ProgramData%//_automation//AgentProcedure//UninstallLiveConnect//Uninstall-LiveConnect.ps1" >"c://provaltech//psoutputtmp.txt" | provaltech.com/kunal.kumar    |
| 8:32:13 am 9-Aug-22   | Execute PowerShell Command (64-bit, Run As System)-0013 | Sending output to global variable.      | provaltech.com/kunal.kumar    |
| 8:32:13 am 9-Aug-22   | Execute PowerShell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%//_automation//AgentProcedure//UninstallLiveConnect//Uninstall-LiveConnect.ps1 | provaltech.com/kunal.kumar    |
| 8:32:13 am 9-Aug-22   | Execute PowerShell Command (64-bit, Run As System)-0003 | No PowerShell file variable detected.   | provaltech.com/kunal.kumar    |
| 8:32:12 am 9-Aug-22   | Execute PowerShell Command (64-bit, Run As System)-0002 | PowerShell is present.                  | provaltech.com/kunal.kumar    |
| 8:32:08 am 9-Aug-22   | Execute PowerShell Command                     | Success THEN                            | provaltech.com/kunal.kumar    |
| 8:32:07 am 9-Aug-22   | Execute PowerShell Command-0011               | PowerShell command completed!           | provaltech.com/kunal.kumar    |
| 8:32:02 am 9-Aug-22   | Execute PowerShell Command-0011               | Executing PowerShell "" -Command "New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name UninstallLiveConnect" "" | provaltech.com/kunal.kumar    |
| 8:32:02 am 9-Aug-22   | Execute PowerShell Command-0010               | Not sending output to variable.         | provaltech.com/kunal.kumar    |
| 8:32:02 am 9-Aug-22   | Execute PowerShell Command-0008               | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name UninstallLiveConnect" | provaltech.com/kunal.kumar    |
| 8:32:02 am 9-Aug-22   | Execute PowerShell Command-0008               | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name UninstallLiveConnect | provaltech.com/kunal.kumar    |
| 8:31:53 am 9-Aug-22   | Execute PowerShell Command-0002               | PowerShell is present.                  | provaltech.com/kunal.kumar    |
| 8:31:44 am 9-Aug-22   | Run Now - Uninstall LiveConnect                | Admin provaltech.com/kunal.kumar scheduled procedure Run Now - Uninstall LiveConnect to run at Aug 9 2022 8:31 AM |                                |

## Dependencies

[Uninstall-LiveConnect.ps1](https://file.provaltech.com/repo/script/Uninstall-LiveConnect.ps1)

## Process

- The agent procedure retrieves the constant variables for the agent procedure name, script name, and PowerShell command.
- This procedure downloads the PS1 file from the URL.
- The script is then executed, uninstalling the LiveConnect from the endpoint.
- We validate whether LiveConnect is uninstalling successfully.

## Output

Agent Procedure Log

## Export Attachment

Attached the content XML VSA Export to this document.



