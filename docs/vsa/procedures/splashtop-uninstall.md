---
id: '39a825db-06ff-4ac3-9dce-30b6f72f3eb0'
slug: /39a825db-06ff-4ac3-9dce-30b6f72f3eb0
title: 'Splashtop Uninstall'
title_meta: 'Splashtop Uninstall'
keywords: ['uninstall', 'splashtop', 'wmi', 'agent', 'procedure']
description: 'This document provides a detailed overview of the process to uninstall Splashtop using WMI detection and removal methods. It includes a sample run log and describes the output generated during the uninstall procedure.'
tags: ['performance', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the process to uninstall Splashtop.

## Sample Run

| Time                     | Action                          | Status                                              | User                          |
|--------------------------|---------------------------------|-----------------------------------------------------|-------------------------------|
| 12:39:07 pm 21-Jun-22   | Splashtop Uninstall             | Success THEN                                       | provaltech.com/dan.hicks      |
| 12:39:07 pm 21-Jun-22   | Splashtop Uninstall-0002        | Splashtop successfully removed.                     | provaltech.com/dan.hicks      |
| 12:39:06 pm 21-Jun-22   | Execute Powershell Command       | Success THEN                                       | provaltech.com/dan.hicks      |
| 12:39:06 pm 21-Jun-22   | Execute Powershell Command-0012  | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/dan.hicks      |
| 12:39:06 pm 21-Jun-22   | Execute Powershell Command-0012  | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/297901570390346/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/dan.hicks      |
| 12:39:05 pm 21-Jun-22   | Execute Powershell Command-0011  | Powershell command completed!                      | provaltech.com/dan.hicks      |
| 12:37:00 pm 21-Jun-22   | Execute Powershell Command-0011  | Executing powershell -file \"%ProgramData%/_automation/AgentProcedure/RemoveSplashtop/Remove-Splashtop.ps1\" \"\" >\"c:/provaltech/psoutput.txt\" | provaltech.com/dan.hicks      |
| 12:37:00 pm 21-Jun-22   | Execute Powershell Command-0010  | Sending output to global variable.                 | provaltech.com/dan.hicks      |
| 12:37:00 pm 21-Jun-22   | Execute Powershell Command-0008  | Commands are:                                      | provaltech.com/dan.hicks      |
| 12:37:00 pm 21-Jun-22   | Execute Powershell Command-0008  | No arguments specified or arguments not formatted properly. | provaltech.com/dan.hicks      |
| 12:37:00 pm 21-Jun-22   | Execute Powershell Command-0006  | Powershell command specified as %ProgramData%/_automation/AgentProcedure/RemoveSplashtop/Remove-Splashtop.ps1 | provaltech.com/dan.hicks      |
| 12:36:55 pm 21-Jun-22   | Execute Powershell Command-0002  | Powershell is present.                             | provaltech.com/dan.hicks      |
| 12:36:52 pm 21-Jun-22   | Execute Powershell Command        | Success THEN                                       | provaltech.com/dan.hicks      |
| 12:36:52 pm 21-Jun-22   | Execute Powershell Command-0011  | Powershell command completed!                      | provaltech.com/dan.hicks      |
| 12:36:50 pm 21-Jun-22   | Execute Powershell Command-0011  | Executing powershell \"\" -Command \"New-Item -Type directory -Path %ProgramData%/_automation/AgentProcedure/ -Name RemoveSplashtop\" \"\" | provaltech.com/dan.hicks      |
| 12:36:50 pm 21-Jun-22   | Execute Powershell Command-0010  | Not sending output to variable.                    | provaltech.com/dan.hicks      |
| 12:36:50 pm 21-Jun-22   | Execute Powershell Command-0008  | New command variable is: -Command \"New-Item -Type directory -Path %ProgramData%/_automation/AgentProcedure/ -Name RemoveSplashtop\" | provaltech.com/dan.hicks      |
| 12:36:50 pm 21-Jun-22   | Execute Powershell Command-0008  | Custom commands detected as New-Item -Type directory -Path %ProgramData%/_automation/AgentProcedure/ -Name RemoveSplashtop | provaltech.com/dan.hicks      |
| 12:36:47 pm 21-Jun-22   | Execute Powershell Command-0002  | Powershell is present.                             | provaltech.com/dan.hicks      |
| 12:36:37 pm 21-Jun-22   | Run Now - Splashtop Uninstall    | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Splashtop Uninstall to run at Jun 21 2022 12:36 PM |                               |

## Process

The process uses WMI to detect if Splashtop is installed and removes it. It checks again afterward to ensure successful removal.

## Output

Agent Procedure Log, Remove-Splashtop-log.txt

## Export Attachment

Attach the content XML VSA Export to this document.