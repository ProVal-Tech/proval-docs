---
id: '5783728e-e3c6-46f2-b8ae-ea3df5c980ec'
title: 'Get PST Information'
title_meta: 'Get PST Information'
keywords: ['pst', 'files', 'log', 'location', 'size']
description: 'This document outlines a procedure for gathering the name, location, and size of all PST files on a machine, storing the information in a log. It also details how to handle scenarios with multiple PST files by updating the configuration file accordingly.'
tags: ['backup', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This procedure gathers the name, location, and size of all the PST files on a machine and stores them in a log. If only one is present, it stores the location in the configuration file; if multiple are present, it updates the configuration file to advise checking the log.

## Example Agent Procedure Log

| Time                     | Action                                                            | Status                        | User          |
|--------------------------|-------------------------------------------------------------------|-------------------------------|---------------|
| 8:27:49 am 17-Aug-23     | Get-PST Info                                                      | Success THEN                  | derek.joniak  |
| 8:27:49 am 17-Aug-23     | Get-PST Info-0002                                                | Success THEN                  | derek.joniak  |
| 8:27:49 am 17-Aug-23     | Get-PST Info-0002                                                | Log Created: %ProgramData%/_automation/AgentProcedure/GetPSTInfo | derek.joniak  |
| 8:27:49 am 17-Aug-23     | Get-PST Info-0001                                                | Success THEN                  | derek.joniak  |
| 8:27:49 am 17-Aug-23     | Get-PST Info-0001                                                | PST: Multiple PST files detected. See log. | derek.joniak  |
| 8:27:48 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)              | Success THEN                  | derek.joniak  |
| 8:27:48 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0001         | Success THEN                  | derek.joniak  |
| 8:27:48 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0002         | Success THEN                  | derek.joniak  |
| 8:27:48 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0011         | Success THEN                  | derek.joniak  |
| 8:27:48 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0014         | Success THEN                  | derek.joniak  |
| 8:27:48 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0015         | Success THEN                  | derek.joniak  |
| 8:27:48 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0016         | Success THEN                  | derek.joniak  |
| 8:27:48 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0016         | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | derek.joniak  |
| 8:27:48 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0016         | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/910544681671025/GetFiles/../docs/psoutput.txt with the new contents from c:/Proval/psoutput.txt in THEN step 3. | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0011         | Executing 64-bit Powershell command as System: \"\" -command \"%ProgramData%/_automation/AgentProcedure/GetPSTInfo/Get-PSTInfo.ps1 \" >\"c:/Proval/psoutputtmp.txt\" | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0012         | Success THEN                  | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0013         | Success THEN                  | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0013         | Sending output to global variable. | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0003         | Success ELSE                  | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0008         | Success THEN                  | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0009         | Success ELSE                  | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0010         | Success ELSE                  | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0008         | Custom commands detected as %ProgramData%/_automation/AgentProcedure/GetPSTInfo/Get-PSTInfo.ps1 | derek.joniak  |
| 8:27:08 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0003         | No powershell file variable detected. | derek.joniak  |
| 8:27:06 am 17-Aug-23     | Execute Powershell Command (64-bit, Run As System)-0002         | Powershell is present.        | derek.joniak  |
| 8:27:05 am 17-Aug-23     | Get-PST Info                                                      | Deploying PowerShell script to endpoint | derek.joniak  |
| 8:27:05 am 17-Aug-23     | Execute Powershell Command                                        | Success THEN                  | derek.joniak  |
| 8:27:05 am 17-Aug-23     | Execute Powershell Command-0001                                   | Success THEN                  | derek.joniak  |
| 8:27:05 am 17-Aug-23     | Execute Powershell Command-0002                                   | Success THEN                  | derek.joniak  |
| 8:27:05 am 17-Aug-23     | Execute Powershell Command-0011                                   | Success THEN                  | derek.joniak  |
| 8:27:05 am 17-Aug-23     | Execute Powershell Command-0012                                   | Success ELSE                  | derek.joniak  |
| 8:27:05 am 17-Aug-23     | Execute Powershell Command-0011                                   | Powershell command completed!  | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0011                                   | Executing powershell \"\" -Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name GetPSTInfo\" \"\" | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0009                                   | Success THEN                  | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0010                                   | Success ELSE                  | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0010                                   | Not sending output to variable. | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0007                                   | Success THEN                  | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0008                                   | Success THEN                  | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0008                                   | New command variable is: -Command \"New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name GetPSTInfo\" | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0008                                   | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name GetPSTInfo | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0003                                   | Success THEN                  | derek.joniak  |
| 8:27:01 am 17-Aug-23     | Execute Powershell Command-0004                                   | Success ELSE                  | derek.joniak  |
| 8:26:57 am 17-Aug-23     | Execute Powershell Command-0002                                   | Powershell is present.        | derek.joniak  |
| 8:26:56 am 17-Aug-23     | Get-PST Info                                                      | Creating folder for procedure  | derek.joniak  |
| 8:26:49 am 17-Aug-23     | Run Now - Get-PST Info                                            | Admin derek.joniak scheduled procedure Run Now - Get-PST Info to run at Aug 17 2023 9:26 AM | derek.joniak  |

## Dependencies

[Proval Documentation](https://proval.itglue.com/DOC-5078775-13650441)

## Output

Procedure log files and computer log
