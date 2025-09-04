---
id: '8c10db56-e778-42b3-9002-98802efe5821'
slug: /8c10db56-e778-42b3-9002-98802efe5821
title: 'OneDrive Redirect for Downloads Folder'
title_meta: 'OneDrive Redirect for Downloads Folder'
keywords: ['onedrive', 'redirect', 'download', 'onedrive-redirect']
description: 'This script is used to Create a Downloads folder in the User’s OneDrive Re-direct the location of the Downloads folder to OneDrive location.'
tags: ['onedrive', 'auditing']
draft: false
unlisted: false
---

## Summary

This agent procedure runs PowerShell to redirect the "Downloads" folder to the OneDrive download folder. This always pulls and sync the data from the "Downloads" folder to the OneDrive.

## Sample Run

| Time                  | Action                                            | Status                                                                 | User         |
|-----------------------|---------------------------------------------------|----------------------------------------------------------------------|--------------|
| 12:36:15 pm 26-Aug-25 | OneDrive Redirect for Downloads Folder            | Success THEN                                                         | kunal.kumar  |
| 12:36:15 pm 26-Aug-25 | OneDrive Redirect for Downloads Folder            | Successfully created the scheduled task 'Scheduled_Task_Move-DownloadsToOneDrive' Task Initiated at: 8/26/2025 11:35:35 AM Script Completed. Log File Path: C:\ProgramData\_Automation\Script\Move-DownloadsToOneDrive\Move-DownloadsToOneDrive.log Log file content: 2025-08-26 11:35:25 [Information] One Drive Path: C:\Users\Test\OneDrive 2025-08-26 11:35:25 [Information] Original Download Path: C:\Users\Test\Downloads 2025-08-26 11:35:25 [Information] One Drive Downloads Path: C:\Users\Test\OneDrive\Downloads 2025-08-26 11:35:25 [Information] Created Downloads folder in OneDrive: C:\Users\Test\OneDrive\Downloads 2025-08-26 11:35:25 [Information] Copying existing files from Downloads to OneDrive... 2025-08-26 11:35:26 [Information] Copied: 1PasswordSetup-8.11.2.msi 2025-08-26 11:35:26 [Information] Copied: amd-software-adrenalin-edition-25.6.1-minimalsetup-250602_web.exe 2025-08-26 11:35:26 [Information] Copied: desktop.ini 2025-08-26 11:35:26 [Information] File movement... | kunal.kumar  |
| 12:36:15 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System) | Success THEN                                                    | kunal.kumar  |
| 12:36:15 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0001 | Success THEN                                               | kunal.kumar  |
| 12:36:15 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0010 | Success THEN                                               | kunal.kumar  |
| 12:36:13 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0002 | Success THEN                                               | kunal.kumar  |
| 12:36:13 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0003 | Success THEN                                               | kunal.kumar  |
| 12:36:13 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0004 | Success THEN                                               | kunal.kumar  |
| 12:36:13 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0005 | Success ELSE                                               | kunal.kumar  |
| 12:36:13 pm 26-Aug-25 | Execute Shell command - Get Results to Variable (64-bit, Run As System)-0005 | Executing command in 64-bit shell as system: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "& %ProgramData%\_automation\AgentProcedure\move-downloadstoonedrive\move-downloadstoonedrive.ps1" >"c:\Proval\commandresults-1724572651.txt" 2>&1 | kunal.kumar  |
| 12:34:58 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                         | kunal.kumar  |
| 12:34:58 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0001 | Success THEN                                                    | kunal.kumar  |
| 12:34:58 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0002 | Success THEN                                                    | kunal.kumar  |
| 12:34:58 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0011 | Success THEN                                                    | kunal.kumar  |
| 12:34:58 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0012 | Success ELSE                                                    | kunal.kumar  |
| 12:34:58 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0011 | Powershell command completed!                                    | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0011 | Executing powershell "" -Command "New-Item -Type directory -Path %ProgramData%\_automation\AgentProcedure\ -Name move-downloadstoonedrive -ErrorAction SilentlyContinue" | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0009 | Success THEN                                                    | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0010 | Success ELSE                                                    | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0010 | Not sending output to variable.                                 | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0007 | Success THEN                                                    | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0008 | Success THEN                                                    | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0008 | New command variable is: -Command "New-Item -Type directory -Path %ProgramData%\_automation\AgentProcedure\ -Name move-downloadstoonedrive -ErrorAction SilentlyContinue" | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0008 | Custom commands detected as New-Item -Type directory -Path %ProgramData%\_automation\AgentProcedure\ -Name move-downloadstoonedrive -ErrorAction SilentlyContinue | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0003 | Success THEN                                                    | kunal.kumar  |
| 12:34:55 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0004 | Success ELSE                                                    | kunal.kumar  |
| 12:34:52 pm 26-Aug-25 | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                          | kunal.kumar  |
| 12:34:44 pm 26-Aug-25 | Run Now - OneDrive Redirect for Downloads Folder   | Admin kunal.kumar scheduled procedure Run Now - OneDrive Redirect for Downloads Folder to run at Aug 26 2025 12:34PM | kunal.kumar  |

## Output

- Agent Procedure Log

## Managed File

[move-downloadstoonedrive.ps1](../../../static/attachments/move-downloadstoonedrive.ps1)