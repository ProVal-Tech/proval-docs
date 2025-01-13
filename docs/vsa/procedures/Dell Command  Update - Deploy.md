---
id: 'ps-dell-command-update-deploy'
title: 'Deploying Dell Command | Update to Endpoint'
title_meta: 'Deploying Dell Command | Update to Endpoint'
keywords: ['dell', 'update', 'deploy', 'endpoint', 'procedure']
description: 'This document outlines the procedure for deploying Dell Command | Update to an endpoint. It includes steps for downloading the software, installing it, and performing a scan and update based on the configuration specified in the DCU_Config.ps1 file. The document also provides example logs and dependencies for the procedure.'
tags: ['deployment', 'logs', 'configuration', 'update', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

This procedure deploys Dell Command | Update to the endpoint. The procedure downloads the software, installs it, and then performs a scan, and update based on the configuration within the .PS1 file.

## Example Agent Procedure Log

| Time                      | Action                                              | Status                                | User   |
|---------------------------|-----------------------------------------------------|---------------------------------------|--------|
| 1:27:00 pm 26-Sep-23      | Dell Command | Update - Deploy                     | Success THEN                          | pronoc |
| 1:27:00 pm 26-Sep-23      | Dell Command | Update - Deploy                     | Applied updates based on scan         | pronoc |
| 1:27:00 pm 26-Sep-23      | Dell Command | Update - Deploy                     | Performed scan based on configuration | pronoc |
| 1:27:00 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System) | Success THEN                          | pronoc |
| 1:26:59 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | pronoc |
| 1:26:59 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/444165012638815/GetFiles/../docs/psoutput.txt with the new contents from c:/myIT/psoutput.txt in THEN step 3. | pronoc |
| 1:26:58 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "& "$env:ProgramData/_automation/AgentProcedure/DellCommandUpdate/DCU_Config.ps1"" >"c:/myIT/psoutputtmp.txt" | pronoc |
| 1:26:58 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.   | pronoc |
| 1:26:57 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as "& "$env:ProgramData/_automation/AgentProcedure/DellCommandUpdate/DCU_Config.ps1" | pronoc |
| 1:26:57 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected. | pronoc |
| 1:26:57 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                | pronoc |
| 1:26:56 pm 26-Sep-23      | Dell Command | Update - Deploy                     | Configuring Dell Command | Update     | pronoc |
| 1:26:56 pm 26-Sep-23      | Execute Powershell Command                         | Success THEN                          | pronoc |
| 1:26:56 pm 26-Sep-23      | Execute Powershell Command-0011                    | Powershell command completed!         | pronoc |
| 1:26:54 pm 26-Sep-23      | Execute Powershell Command-0011                    | Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData/dell/ -Name Logs" "" | pronoc |
| 1:26:54 pm 26-Sep-23      | Execute Powershell Command-0010                    | Not sending output to variable.       | pronoc |
| 1:26:54 pm 26-Sep-23      | Execute Powershell Command-0008                    | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData/dell/ -Name Logs" | pronoc |
| 1:26:54 pm 26-Sep-23      | Execute Powershell Command-0008                    | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/dell/ -Name Logs | pronoc |
| 1:26:52 pm 26-Sep-23      | Execute Powershell Command-0002                    | Powershell is present.                | pronoc |
| 1:26:52 pm 26-Sep-23      | Dell Command | Update - Deploy                     | Creating Log folder                   | pronoc |
| 1:26:52 pm 26-Sep-23      | Dell Command | Update - Deploy-0001                | Dell Command | Update detected.        | pronoc |
| 1:26:52 pm 26-Sep-23      | Dell Command | Update - Deploy                     | Checking for an existing installation of Dell Command | Update | pronoc |
| 1:26:51 pm 26-Sep-23      | Execute Powershell Command                         | Success THEN                          | pronoc |
| 1:26:51 pm 26-Sep-23      | Execute Powershell Command-0011                    | Powershell command completed!         | pronoc |
| 1:26:50 pm 26-Sep-23      | Execute Powershell Command-0011                    | Executing powershell "" -Command "New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name DellCommandUpdate" "" | pronoc |
| 1:26:50 pm 26-Sep-23      | Execute Powershell Command-0010                    | Not sending output to variable.       | pronoc |
| 1:26:50 pm 26-Sep-23      | Execute Powershell Command-0008                    | New command variable is: -Command "New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name DellCommandUpdate" | pronoc |
| 1:26:50 pm 26-Sep-23      | Execute Powershell Command-0008                    | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name DellCommandUpdate | pronoc |
| 1:26:47 pm 26-Sep-23      | Execute Powershell Command-0002                    | Powershell is present.                | pronoc |
| 1:13:02 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: "" -command "& "$env:ProgramData/_automation/AgentProcedure/DellCommandUpdate/DCU_Config.ps1"" >"c:/myIT/psoutputtmp.txt" | pronoc |
| 1:13:02 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.    | pronoc |
| 1:13:02 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as "& "$env:ProgramData/_automation/AgentProcedure/DellCommandUpdate/DCU_Config.ps1" | pronoc |
| 1:13:02 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected. | pronoc |
| 1:13:02 pm 26-Sep-23      | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                | pronoc |
| 1:13:01 pm 26-Sep-23      | Dell Command | Update - Deploy                     | Configuring Dell Command | Update     | pronoc |
| 1:13:01 pm 26-Sep-23      | Execute Powershell Command                         | Success THEN                          | pronoc |
| 1:13:01 pm 26-Sep-23      | Execute Powershell Command-0011                    | Powershell command completed!         | pronoc |
| 1:12:59 pm 26-Sep-23      | Execute Powershell Command-0011                    | Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData/dell/ -Name Logs" "" | pronoc |
| 1:12:59 pm 26-Sep-23      | Execute Powershell Command-0010                    | Not sending output to variable.       | pronoc |
| 1:12:59 pm 26-Sep-23      | Execute Powershell Command-0008                    | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData/dell/ -Name Logs" | pronoc |
| 1:12:59 pm 26-Sep-23      | Execute Powershell Command-0008                    | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/dell/ -Name Logs | pronoc |
| 1:12:57 pm 26-Sep-23      | Execute Powershell Command-0002                    | Powershell is present.                | pronoc |
| 1:12:56 pm 26-Sep-23      | Dell Command | Update - Deploy                     | Creating Log folder                   | pronoc |
| 1:12:56 pm 26-Sep-23      | Dell Command | Update - Deploy-0001                | Dell Command | Update detected.        | pronoc |
| 1:12:56 pm 26-Sep-23      | Dell Command | Update - Deploy                     | Checking for an existing installation of Dell Command | Update | pronoc |
| 1:12:56 pm 26-Sep-23      | Execute Powershell Command                         | Success THEN                          | pronoc |
| 1:12:56 pm 26-Sep-23      | Execute Powershell Command-0011                    | Powershell command completed!         | pronoc |
| 1:12:54 pm 26-Sep-23      | Execute Powershell Command-0011                    | Executing powershell "" -Command "New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name DellCommandUpdate" "" | pronoc |
| 1:12:54 pm 26-Sep-23      | Execute Powershell Command-0010                    | Not sending output to variable.       | pronoc |
| 1:12:54 pm 26-Sep-23      | Execute Powershell Command-0008                    | New command variable is: -Command "New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name DellCommandUpdate" | pronoc |
| 1:12:54 pm 26-Sep-23      | Execute Powershell Command-0008                    | Custom commands detected as New-Item -Type Directory -Path %ProgramData%/_automation/AgentProcedure -Name DellCommandUpdate | pronoc |
| 1:12:51 pm 26-Sep-23      | Execute Powershell Command-0002                    | Powershell is present.                | pronoc |
| 1:12:44 pm 26-Sep-23      | Run Now - Dell Command | Update - Deploy            | Admin pronoc scheduled procedure Run Now - Dell Command | Update - Deploy to run at Sep 26 2023 1:12PM | pronoc |

## Dependencies

Procedure requires the shared file to run. "DCU_Config.ps1" if changes are desired the first command is what needs to be modified.

`& "$env:ProgramFiles/Dell/CommandUpdate/dcu-cli.exe" /configure -silent -autoSuspendBitLocker=enable -userConsent=disable "-updateType=firmware,driver,application,others" "-scheduleMonthly=28,02:00"`

These can be adjusted/modified as needed: [Dell Command Update CLI Commands](https://www.dell.com/support/manuals/en-us/command-update/dellcommandupdate_rg/dell-command-update-cli-commands?guid=guid-92619086-5f7c-4a05-bce2-0d560c15e8ed)

## Output

Agent Procedure Log  
Dell Command Update Logs: C:/ProgramData/Dell/Logs

- scan.log
- applyupdates.log



