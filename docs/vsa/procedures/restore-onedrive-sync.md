---
id: '1f752f40-a41a-475b-9251-86e5022a7ffe'
slug: /1f752f40-a41a-475b-9251-86e5022a7ffe
title: 'Restore Downloads folder from OneDrive Sync'
title_meta: 'Restore Downloads folder from OneDrive Sync'
keywords: ['onedrive', 'restore', 'sync']
description: 'This script is used to restore the User''s OneDrive sync and stopped the sync as well and restart the explorer after the sucessfull execution of the script'
tags: ['onedrive']
draft: false
unlisted: false
---

## Summary

This script is used to stop the redirection of the system's "Downloads" folder to OneDrive's "Downloads" folder and stops the sync for it. This is useful to reverse the sitaution where the system's download folder is redirected to OneDrive's Download folder.

## Sample Run

| Time                  | Action                                            | Status                                                                 | User         |
|-----------------------|---------------------------------------------------|----------------------------------------------------------------------|--------------|
| 12:42:02 pm 26-Aug-25 | MonitoringLuaSchedulingScript (64-bit, Run As System) | Success THEN                                                      | *System*     |
| 12:42:02 pm 26-Aug-25 | Mon$EnableLuaForAgent713101466008764 (64-bit, Run As System) | Success THEN                                             | *System*     |
| 12:41:27 pm 26-Aug-25 | Restore OnceDrive Sync                           | Success THEN                                                         | kunal.kumar  |
| 12:41:27 pm 26-Aug-25 | Restore OnceDrive Sync                           | & : The term 'C:\ProgramData\_automation\AgentProcedure\restore-onedrivesync\Restore_Onedrive_sync.ps1' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again. At line:1 char:3 + & C:\ProgramData\_automation\AgentProcedure\restore-onedrivesync\Rest ... + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ + CategoryInfo : ObjectNotFound: (C:\ProgramData\...edrive_sync.ps1:String) [], CommandNotFoundException + FullyQualifiedErrorId : CommandNotFoundException | kunal.kumar  |
| 12:41:27 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System) | Success THEN                                               | kunal.kumar  |
| 12:41:27 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0001 | Success THEN                                      | kunal.kumar  |
| 12:41:27 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0010 | Success THEN                                      | kunal.kumar  |
| 12:41:25 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0002 | Success THEN                                      | kunal.kumar  |
| 12:41:25 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0003 | Success THEN                                      | kunal.kumar  |
| 12:41:25 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0004 | Success THEN                                      | kunal.kumar  |
| 12:41:25 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0005 | Success ELSE                                      | kunal.kumar  |
| 12:41:25 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0005 | Executing command in 64-bit shell as system: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "& %ProgramData%\_automation\AgentProcedure\restore-onedrivesync\Restore_Onedrive_sync.ps1" >"c:\Proval\commandresults-1977437844.txt" 2>&1 | kunal.kumar  |
| 12:41:22 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                         | kunal.kumar  |
| 12:41:21 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0001 | Success THEN                                                    | kunal.kumar  |
| 12:41:21 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0002 | Success THEN                                                    | kunal.kumar  |
| 12:41:21 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0011 | Success THEN                                                    | kunal.kumar  |
| 12:41:21 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0012 | Success ELSE                                                    | kunal.kumar  |
| 12:41:21 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0011 | Powershell command completed!                                    | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0011 | Executing powershell "" -Command "New-Item -Type directory -Path %ProgramData%\_automation\AgentProcedure\ -Name restore-onedrivesync -ErrorAction SilentlyContinue" | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0009 | Success THEN                                                    | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0010 | Success ELSE                                                    | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0010 | Not sending output to variable.                                 | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0007 | Success THEN                                                    | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0008 | Success THEN                                                    | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0008 | New command variable is: -Command "New-Item -Type directory -Path %ProgramData%\_automation\AgentProcedure\ -Name restore-onedrivesync -ErrorAction SilentlyContinue" | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as New-Item -Type directory -Path %ProgramData%\_automation\AgentProcedure\ -Name restore-onedrivesync -ErrorAction SilentlyContinue | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0003 | Success THEN                                                    | kunal.kumar  |
| 12:41:19 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0004 | Success ELSE                                                    | kunal.kumar  |
| 12:41:17 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                          | kunal.kumar  |
| 12:41:08 pm 26-Aug-25 | Run Now - Restore OnceDrive Sync                  | Admin kunal.kumar scheduled procedure Run Now - Restore OnceDrive Sync to run at Aug 26 2025 12:41PM | kunal.kumar  |


## Output

- Agent Procedure Log

## Managed File

[restore-onedrivesync.ps1](../../../static/attachments/restore-download-folder-from-onedrivesync.ps1)