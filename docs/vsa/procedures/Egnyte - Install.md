---
id: '04d18467-ad93-4ed2-8da9-52796031d41c'
title: 'Egnyte Installation Procedure'
title_meta: 'Egnyte Installation Procedure'
keywords: ['egnyte', 'installation', 'software', 'office', 'reboot']
description: 'This document outlines the agent procedure for updating and installing the Egnyte software, including the steps taken to kill all Office applications prior to installation and prompting for a reboot afterward. The example agent procedure log provides detailed insights into the actions and results of the installation process.'
tags: ['installation', 'software', 'reboot', 'cleanup', 'windows']
draft: false
unlisted: false
---
## Summary

Agent procedure updates/installs the Egnyte software. It kills all Office applications prior to install, and prompts for a reboot after install.

## Example Agent Procedure Log

| Time                    | Action                      | Result                                                                                              | User          |
|-------------------------|-----------------------------|-----------------------------------------------------------------------------------------------------|---------------|
| 7:09:06 pm 2-May-23    | Egnyte - Install            | Success THEN                                                                                         | derek.joniak  |
| 7:08:10 pm 2-May-23    | Egnyte - Install-0003      | Cleanup performed                                                                                    | derek.joniak  |
| 7:08:10 pm 2-May-23    | Delete Folder               | Success THEN                                                                                         | derek.joniak  |
| 7:08:10 pm 2-May-23    | Delete Folder-0019         | Success! %ProgramData%/_automation/AgentProcedure/EgnyteInstall folder has been removed.           | derek.joniak  |
| 7:08:08 pm 2-May-23    | Delete Folder-0013         | Directory %ProgramData%/_automation/AgentProcedure/EgnyteInstall is not empty but recursive delete is enabled - removing... | derek.joniak  |
| 7:08:07 pm 2-May-23    | Delete Folder-0009         | %ProgramData%/_automation/AgentProcedure/EgnyteInstall folder exists.                              | derek.joniak  |
| 7:08:06 pm 2-May-23    | Delete Folder-0004         | Directory contains a /. This should be a Windows folder.                                           | derek.joniak  |
| 7:03:06 pm 2-May-23    | Egnyte - Install-0003      | Egnyte installed, waiting 5 minutes to prompt for reboot                                           | derek.joniak  |
| 7:02:47 pm 2-May-23    | Egnyte - Install-0003      | File Copied. Starting Installation.                                                                 | derek.joniak  |
| 7:02:10 pm 2-May-23    | Execute Powershell Command  | Success THEN                                                                                         | derek.joniak  |
| 7:02:09 pm 2-May-23    | Execute Powershell Command-0011 | Powershell command completed!                                                                        | derek.joniak  |
| 7:02:07 pm 2-May-23    | Execute Powershell Command-0011 | Executing powershell "" -Command "Get-Process | Where-Object {$_.ProcessName -like "Excel" -or $_.ProcessName -like "Word" -or $_.ProcessName -like "PowerPoint" -or $_.ProcessName -like "Outlook" -or $_.ProcessName -like "OneNote" -or $_.ProcessName -like "Access" -or $_.ProcessName -like "Publisher" -or $_.ProcessName -like "SkypeforBusiness" -or $_.ProcessName -like "Teams"} | Stop-Process -Force" "" | derek.joniak  |
| 7:02:07 pm 2-May-23    | Execute Powershell Command-0010 | Not sending output to variable.                                                                       | derek.joniak  |
| 7:02:07 pm 2-May-23    | Execute Powershell Command-0008 | New command variable is: -Command "Get-Process | Where-Object {$_.ProcessName -like "Excel" -or $_.ProcessName -like "Word" -or $_.ProcessName -like "PowerPoint" -or $_.ProcessName -like "Outlook" -or $_.ProcessName -like "OneNote" -or $_.ProcessName -like "Access" -or $_.ProcessName -like "Publisher" -or $_.ProcessName -like "SkypeforBusiness" -or $_.ProcessName -like "Teams"} | Stop-Process -Force" | derek.joniak  |
| 7:02:07 pm 2-May-23    | Execute Powershell Command-0008 | Custom commands detected as Get-Process | Where-Object {$_.ProcessName -like "Excel" -or $_.ProcessName -like "Word" -or $_.ProcessName -like "PowerPoint" -or $_.ProcessName -like "Outlook" -or $_.ProcessName -like "OneNote" -or $_.ProcessName -like "Access" -or $_.ProcessName -like "Publisher" -or $_.ProcessName -like "SkypeforBusiness" -or $_.ProcessName -like "Teams"} | Stop-Process -Force | derek.joniak  |
| 7:01:59 pm 2-May-23    | Execute Powershell Command-0002 | Powershell is present.                                                                               | derek.joniak  |
| 7:01:56 pm 2-May-23    | Egnyte - Install-0003      | User selected Install Now.                                                                           | derek.joniak  |
| 7:01:48 pm 2-May-23    | Run Now - Egnyte - Install  | Admin derek.joniak scheduled procedure Run Now - Egnyte - Install to run at May 2 2023 8:01PM     | derek.joniak  |

## Dependencies

Procedure requires the custom field to run: [https://proval.itglue.com/DOC-5078775-12754459](https://proval.itglue.com/DOC-5078775-12754459)

## Output

Agent Logs






