---
id: 'vsa-remove-screenconnect'
title: 'Remove ScreenConnect from Endpoints'
title_meta: 'Remove ScreenConnect from Endpoints'
keywords: ['uninstall', 'screenconnect', 'endpoint', 'wmic', 'agent']
description: 'This document provides a detailed guide on uninstalling all instances of ScreenConnect from an endpoint using WMIC commands. It includes a sample run log, process description, output details, and instructions for exporting attachments.'
tags: ['uninstallation', 'software', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

Uninstalls ALL screenconnect instances from an endpoint.

## Sample Run

| Time                     | Action                           | Result                                                                                                        | User                             |
|--------------------------|----------------------------------|---------------------------------------------------------------------------------------------------------------|----------------------------------|
| 1:43:45 pm 21-Jun-22    | ScreenConnect Uninstall          | Success THEN                                                                                                  | provaltech.com/dan.hicks        |
| 1:43:45 pm 21-Jun-22    | ScreenConnect Uninstall-0002     | ScreenConnect successfully removed.                                                                           | provaltech.com/dan.hicks        |
| 1:43:45 pm 21-Jun-22    | Execute Powershell Command       | Success THEN                                                                                                  | provaltech.com/dan.hicks        |
| 1:43:44 pm 21-Jun-22    | Execute Powershell Command-0012  | Results returned to global variable #global:psresult# and saved in Documents tab of server.                 | provaltech.com/dan.hicks        |
| 1:43:44 pm 21-Jun-22    | Execute Powershell Command-0012  | Informational: GetFile command overwrote the server file C:\Kaseya\UserProfiles\297901570390346\GetFiles\..\docs\psoutput.txt with the new contents from c:\provaltech\psoutput.txt in THEN step 2. | provaltech.com/dan.hicks        |
| 1:43:44 pm 21-Jun-22    | Execute Powershell Command-0011  | Powershell command completed!                                                                                 | provaltech.com/dan.hicks        |
| 1:42:52 pm 21-Jun-22    | Execute Powershell Command-0011  | Executing powershell -file "%ProgramData%\_automation\AgentProcedure\RemoveScreenConnect\Remove-ScreenConnect.ps1" "" >"c:\provaltech\psoutput.txt" | provaltech.com/dan.hicks        |
| 1:42:52 pm 21-Jun-22    | Execute Powershell Command-0010  | Sending output to global variable.                                                                             | provaltech.com/dan.hicks        |
| 1:42:52 pm 21-Jun-22    | Execute Powershell Command-0008  | Commands are:                                                                                                 | provaltech.com/dan.hicks        |
| 1:42:52 pm 21-Jun-22    | Execute Powershell Command-0008  | No arguments specified or arguments not formatted properly.                                                   | provaltech.com/dan.hicks        |
| 1:42:52 pm 21-Jun-22    | Execute Powershell Command-0006  | Powershell command specified as %ProgramData%\_automation\AgentProcedure\RemoveScreenConnect\Remove-ScreenConnect.ps1 | provaltech.com/dan.hicks        |
| 1:42:40 pm 21-Jun-22    | Execute Powershell Command-0002  | Powershell is present.                                                                                        | provaltech.com/dan.hicks        |
| 1:42:34 pm 21-Jun-22    | Execute Powershell Command        | Success THEN                                                                                                  | provaltech.com/dan.hicks        |
| 1:42:33 pm 21-Jun-22    | Execute Powershell Command-0011  | Powershell command completed!                                                                                 | provaltech.com/dan.hicks        |
| 1:42:23 pm 21-Jun-22    | Execute Powershell Command-0011  | Executing powershell "" -Command "New-Item -Type directory -Path %ProgramData%\_automation\AgentProcedure\ -Name RemoveScreenConnect" "" | provaltech.com/dan.hicks        |
| 1:42:23 pm 21-Jun-22    | Execute Powershell Command-0010  | Not sending output to variable.                                                                                | provaltech.com/dan.hicks        |
| 1:42:23 pm 21-Jun-22    | Execute Powershell Command-0008  | New command variable is: -Command "New-Item -Type directory -Path %ProgramData%\_automation\AgentProcedure\ -Name RemoveScreenConnect" | provaltech.com/dan.hicks        |
| 1:42:23 pm 21-Jun-22    | Execute Powershell Command-0008  | Custom commands detected as New-Item -Type directory -Path %ProgramData%\_automation\AgentProcedure\ -Name RemoveScreenConnect | provaltech.com/dan.hicks        |
| 1:42:17 pm 21-Jun-22    | Execute Powershell Command-0002  | Powershell is present.                                                                                        | provaltech.com/dan.hicks        |
| 1:42:04 pm 21-Jun-22    | Run Now - ScreenConnect Uninstall | Admin provaltech.com/dan.hicks scheduled procedure Run Now - ScreenConnect Uninstall to run at Jun 21 2022 1:42PM |                                  |

## Process

WMIC loops through instances for anything matching 'ScreenConnect%' and performs a nointeractive uninstall. We then check Win32_product class to see if it still exists afterwards.

## Output

Agent Procedure  
Remove-ScreenConnect-log.txt

## Export Attachment

Attach the content XML VSA Export to this document.



