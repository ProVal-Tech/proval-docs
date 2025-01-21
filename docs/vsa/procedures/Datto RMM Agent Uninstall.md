---
id: '06094f2c-6867-48d7-9a94-1d4b9ad08ec0'
title: 'Remove Datto RMM from Mac or Windows Endpoint'
title_meta: 'Remove Datto RMM from Mac or Windows Endpoint'
keywords: ['datto', 'rmm', 'uninstall', 'windows', 'mac', 'endpoint']
description: 'This document provides a detailed procedure for uninstalling Datto RMM from both Mac and Windows endpoints, including example logs and dependencies for successful execution.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the steps to remove Datto RMM from a Mac or Windows endpoint.

## Example Agent Procedure Log

| Time                      | Action                                               | Status                                           | User                            |
|---------------------------|------------------------------------------------------|-------------------------------------------------|---------------------------------|
| 4:34:55 pm 1-Feb-23      | Datto RMM Agent Uninstall                            | Success THEN                                   | provaltech.com/dan.hicks       |
| 4:34:54 pm 1-Feb-23      | Execute Powershell Command (64-bit, Run As System)  | Success THEN                                   | provaltech.com/dan.hicks       |
| 4:34:54 pm 1-Feb-23      | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks       |
| 4:34:54 pm 1-Feb-23      | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/229175768944442/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3. | provaltech.com/dan.hicks       |
| 4:34:36 pm 1-Feb-23      | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: \"\" -command \"%ProgramData%/_automation/AgentProcedure/DattoRmmAgentUninstall/Remove-DattoRmmAgent.ps1\" >\"c:/provaltech/psoutputtmp.txt\" | provaltech.com/dan.hicks       |
| 4:34:36 pm 1-Feb-23      | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.              | provaltech.com/dan.hicks       |
| 4:34:36 pm 1-Feb-23      | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as %ProgramData%/_automation/AgentProcedure/DattoRmmAgentUninstall/Remove-DattoRmmAgent.ps1 | provaltech.com/dan.hicks       |
| 4:34:36 pm 1-Feb-23      | Execute Powershell Command (64-bit, Run As System)-0003 | No powershell file variable detected.          | provaltech.com/dan.hicks       |
| 4:34:25 pm 1-Feb-23      | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                          | provaltech.com/dan.hicks       |
| 4:34:03 pm 1-Feb-23      | Execute Powershell Command                             | Success THEN                                   | provaltech.com/dan.hicks       |
| 4:34:03 pm 1-Feb-23      | Execute Powershell Command-0011                       | Powershell command completed!                  | provaltech.com/dan.hicks       |
| 4:33:56 pm 1-Feb-23      | Execute Powershell Command-0011                       | Executing powershell \"\" -Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name DattoRmmAgentUninstall\" \"\" | provaltech.com/dan.hicks       |
| 4:33:56 pm 1-Feb-23      | Execute Powershell Command-0010                       | Not sending output to variable.                | provaltech.com/dan.hicks       |
| 4:33:56 pm 1-Feb-23      | Execute Powershell Command-0008                       | New command variable is: -Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name DattoRmmAgentUninstall\" | provaltech.com/dan.hicks       |
| 4:33:56 pm 1-Feb-23      | Execute Powershell Command-0008                       | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name DattoRmmAgentUninstall | provaltech.com/dan.hicks       |
| 4:33:41 pm 1-Feb-23      | Execute Powershell Command-0002                       | Powershell is present.                          | provaltech.com/dan.hicks       |
| 4:33:38 pm 1-Feb-23      | Datto RMM Agent Uninstall                             | Windows Detected. Performing Windows removal.   | provaltech.com/dan.hicks       |
| 4:33:14 pm 1-Feb-23      | Run Now - Datto RMM Agent Uninstall                  | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Datto RMM Agent Uninstall to run at Feb 1 2023 4:33 PM |                                 |

## Dependencies

[SWM - Software Uninstall - Agnostic - Remove-DattoRmmAgent](<../../powershell/Remove-DattoRmmAgent.md>)

## Process

Utilizes the agnostic content to uninstall Datto from a Windows endpoint,  
OR  
Runs [sudo bash /Applications/AEM/Agent.app/Contents/Resources/uninstall.sh](https://rmm.datto.com/help/en/Content/4WEBPORTAL/Devices/ServersLaptopsDesktops/Mac/InstallMac.htm) on a Mac.

## Output

Agent procedure log.

