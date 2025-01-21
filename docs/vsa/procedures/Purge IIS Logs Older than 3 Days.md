---
id: '43cfcc23-05a8-4411-a901-65a819894164'
title: 'IIS Log Files Purge'
title_meta: 'IIS Log Files Purge'
keywords: ['iis', 'log', 'purge', 'files', 'cleanup', 'script', 'powershell']
description: 'This document provides a detailed overview of a PowerShell script designed to remove IIS log files older than 3 days from a specified directory. The script logs actions taken, including successes and failures, and outlines the command execution process along with example agent procedure logs.'
tags: ['cleanup', 'iis', 'windows']
draft: false
unlisted: false
---

## Summary

This script will remove IIS log files older than 3 days from the path `C:/inetpub/logs/LogFiles`. The script will provide log files that show which files were not deleted from that folder that are older than 3 days.

The script runs the PowerShell command to perform the task.

Additionally, the path and threshold are defined within the script, rather than in the `.ps1` file.

## Example Agent Procedure Log

| Time                   | Action                                          | Status                | User          |
|------------------------|-------------------------------------------------|-----------------------|---------------|
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge                            | Success THEN          | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge-0004                       | Success THEN          | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge-0004                       | Path not present      | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge-0003                       | Success ELSE          | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge-0003                       | Script moving to next step | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge-0002                       | Success ELSE          | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge-0002                       | Script moving to next step | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge-0001                       | Success THEN          | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge-0001                       | Path not present      | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | IIS Log Files Purge                            | Path 'C:/inetpub/logs/LogFiles' not found. | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | Execute Shell command - Get Results to Variable | Success THEN          | ovais.rashid  |
| 9:59:52 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0001 | Success THEN          | ovais.rashid  |
| 9:59:51 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0010 | Success THEN          | ovais.rashid  |
| 9:59:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0002 | Success THEN          | ovais.rashid  |
| 9:59:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0003 | Success THEN          | ovais.rashid  |
| 9:59:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0004 | Success THEN          | ovais.rashid  |
| 9:59:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0005 | Success ELSE          | ovais.rashid  |
| 9:59:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "& 'C:/ProgramData/_automation/AgentProcedure/IISPURGE/Remove-OlderFiles.ps1' -Path 'C:/inetpub/logs/LogFiles' -ThresholdDays 3" >"c:/Proval/commandresults-2144853229.txt" 2>&1 | ovais.rashid  |
| 9:59:49 am 12-Jul-23  | Execute Powershell Command                     | Success THEN          | ovais.rashid  |
| 9:59:49 am 12-Jul-23  | Execute Powershell Command-0001                | Success THEN          | ovais.rashid  |
| 9:59:49 am 12-Jul-23  | Execute Powershell Command-0002                | Success THEN          | ovais.rashid  |
| 9:59:49 am 12-Jul-23  | Execute Powershell Command-0011                | Success THEN          | ovais.rashid  |
| 9:59:49 am 12-Jul-23  | Execute Powershell Command-0012                | Success ELSE          | ovais.rashid  |
| 9:59:48 am 12-Jul-23  | Execute Powershell Command-0011                | Powershell command completed! | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0011                | Executing powershell "" -Command "New-Item -Type Directory -Path C:/ProgramData/_automation/AgentProcedure -Name IISPURGE" "" | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0009                | Success THEN          | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0010                | Success ELSE          | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0010                | Not sending output to variable. | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0007                | Success THEN          | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0008                | Success THEN          | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0008                | New command variable is: -Command "New-Item -Type Directory -Path C:/ProgramData/_automation/AgentProcedure -Name IISPURGE" | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0008                | Custom commands detected as New-Item -Type Directory -Path C:/ProgramData/_automation/AgentProcedure -Name IISPURGE | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0003                | Success THEN          | ovais.rashid  |
| 9:59:46 am 12-Jul-23  | Execute Powershell Command-0004                | Success ELSE          | ovais.rashid  |
| 9:59:43 am 12-Jul-23  | Execute Powershell Command-0002                | Powershell is present. | ovais.rashid  |
| 9:59:35 am 12-Jul-23  | Run Now - IIS Log Files Purge                  | Admin ovais.rashid scheduled procedure Run Now - IIS Log Files Purge to run at Jul 12 2023 9:59 AM | ovais.rashid  |

| Time                   | Action                                          | Status                | User          |
|------------------------|-------------------------------------------------|-----------------------|---------------|
| 9:47:52 am 12-Jul-23  | IIS Log Files Purge                            | Success THEN          | ovais.rashid  |
| 9:47:52 am 12-Jul-23  | IIS Log Files Purge-0004                       | Success ELSE          | ovais.rashid  |
| 9:47:52 am 12-Jul-23  | IIS Log Files Purge-0003                       | Success THEN          | ovais.rashid  |
| 9:47:52 am 12-Jul-23  | IIS Log Files Purge-0003                       | Files older than 3 days have been removed. | ovais.rashid  |
| 9:47:52 am 12-Jul-23  | IIS Log Files Purge-0002                       | Success ELSE          | ovais.rashid  |
| 9:47:52 am 12-Jul-23  | IIS Log Files Purge-0002                       | Script moving to next step | ovais.rashid  |
| 9:47:52 am 12-Jul-23  | IIS Log Files Purge-0001                       | Success ELSE          | ovais.rashid  |
| 9:47:52 am 12-Jul-23  | IIS Log Files Purge                            | Files older than 3 days from 'C:/ProgramData/_automation/app/Soji' have been removed. | ovais.rashid  |
| 9:47:52 am 12-Jul-23  | Execute Shell command - Get Results to Variable | Success THEN          | ovais.rashid  |
| 9:47:52 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0001 | Success THEN          | ovais.rashid  |
| 9:47:51 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0010 | Success THEN          | ovais.rashid  |
| 9:47:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0002 | Success THEN          | ovais.rashid  |
| 9:47:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0003 | Success ELSE          | ovais.rashid  |
| 9:47:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0006 | Success THEN          | ovais.rashid  |
| 9:47:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0007 | Success ELSE          | ovais.rashid  |
| 9:47:50 am 12-Jul-23  | Execute Shell command - Get Results to Variable-0007 | Executing command in standard shell as system: C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "& 'C:/ProgramData/_automation/AgentProcedure/IISPURGE/Remove-OlderFiles.ps1' -Path 'C:/ProgramData/_automation/app/Soji' -ThresholdDays 3" >"c:/Proval/commandresults-1103009589.txt" 2>&1 | ovais.rashid  |
| 9:47:48 am 12-Jul-23  | Execute Powershell Command                     | Success THEN          | ovais.rashid  |
| 9:47:47 am 12-Jul-23  | Execute Powershell Command-0001                | Success THEN          | ovais.rashid  |
| 9:47:47 am 12-Jul-23  | Execute Powershell Command-0002                | Success THEN          | ovais.rashid  |
| 9:47:47 am 12-Jul-23  | Execute Powershell Command-0011                | Success THEN          | ovais.rashid  |
| 9:47:47 am 12-Jul-23  | Execute Powershell Command-0012                | Success ELSE          | ovais.rashid  |
| 9:47:47 am 12-Jul-23  | Execute Powershell Command-0011                | Powershell command completed! | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0011                | Executing powershell "" -Command "New-Item -Type Directory -Path C:/ProgramData/_automation/AgentProcedure -Name IISPURGE" "" | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0009                | Success THEN          | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0010                | Success ELSE          | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0010                | Not sending output to variable. | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0007                | Success THEN          | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0008                | Success THEN          | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0008                | New command variable is: -Command "New-Item -Type Directory -Path C:/ProgramData/_automation/AgentProcedure -Name IISPURGE" | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0008                | Custom commands detected as New-Item -Type Directory -Path C:/ProgramData/_automation/AgentProcedure -Name IISPURGE | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0003                | Success THEN          | ovais.rashid  |
| 9:47:45 am 12-Jul-23  | Execute Powershell Command-0004                | Success ELSE          | ovais.rashid  |
| 9:47:43 am 12-Jul-23  | Execute Powershell Command-0002                | Powershell is present. | ovais.rashid  |
| 9:47:34 am 12-Jul-23  | Run Now - IIS Log Files Purge                  | Admin ovais.rashid scheduled procedure Run Now - IIS Log Files Purge to run at Jul 12 2023 9:47 AM | ovais.rashid  |

## Dependencies

None

## Output

Script Logs
