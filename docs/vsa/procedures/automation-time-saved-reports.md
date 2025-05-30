---
id: '52d14c0f-fe3e-4520-bed5-b05db491bf26'
slug: /52d14c0f-fe3e-4520-bed5-b05db491bf26
title: 'Automation Time Saved Reports'
title_meta: 'Automation Time Saved Reports'
keywords: ['vsa', 'time', 'saved', 'report', 'automation', 'csv']
description: 'This document outlines the procedure for running the Get-VsaTimeSaved.ps1 script, which generates a CSV report of time saved for various organizations. The report is then placed in the GetFiles directory for easy access by clients and consultants.'
tags: ['report']
draft: false
unlisted: false
---

## Summary

Runs [VSA - VSA Host Procedure - Agnostic - Get-VsaTimeSaved.ps1](/docs/b2661e46-518b-4a4f-9b4b-21f9b69ff100) and places the CSV it generates into the GetFiles directory for client and consultant access.

## Example Agent Procedure Log

| Time                    | Report Name                      | Status/Message                                                                                                                                                                                                                                   | User                     |
|-------------------------|----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------|
| 3:48:11 pm 28-Oct-22    | Time Saved Report                | Success THEN                                                                                                                                                                                                                                     | provaltech.com/dan.hicks |
| 3:48:11 pm 28-Oct-22    | Time Saved Report-0001           | "OrgName","Total","Monthly" "PC Computing and Consulting","00:10:00","00:10:00" "ProVal Technologies","02:15:00","01:15:00" "Meriplex","00:10:00","00:10:00" "Bercell Integrated Technologies Ltd","00:10:00","00:10:00" "Groff Networks","00:05:00","00:05:00" "SysIntegrators, LLC","00:05:00","00:05:00" "MBTech","00:10:00","00:10:00" "CIO Solutions","00:00:00","00:00:00" "Binatech","00:10:00","00:10:00" "itSynergy","00:10:00","00:10:00" "Unnamed","00:00:00","00:00:00" "Avatar Computer","00:05:00","00:05:00" "Trinity Worldwide Technologies","00:05:00","00:05:00" "Test","00:00:00","00:00:00" "DataBlue","00:00:00","00:00:00" | provaltech.com/dan.hicks |
| 3:48:10 pm 28-Oct-22    | Execute Powershell Command       | Success THEN                                                                                                                                                                                                                                     | provaltech.com/dan.hicks |
| 3:48:10 pm 28-Oct-22    | Execute Powershell Command-0012  | Results returned to global variable #global:psresult# and saved in Documents tab of server.                                                                                                                                                   | provaltech.com/dan.hicks |
| 3:48:10 pm 28-Oct-22    | Execute Powershell Command-0012  | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/735959849026022/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2.                                         | provaltech.com/dan.hicks |
| 3:48:09 pm 28-Oct-22    | Execute Powershell Command-0011  | Powershell command completed!                                                                                                                                                                                                                   | provaltech.com/dan.hicks |
| 3:48:07 pm 28-Oct-22    | Execute Powershell Command-0011  | Executing powershell "" -Command "(Get-Date -format MM-yyyy).ToString()" >"c:/provaltech/psoutput.txt"                                                                                                                                       | provaltech.com/dan.hicks |
| 3:48:07 pm 28-Oct-22    | Execute Powershell Command-0010  | Sending output to global variable.                                                                                                                                                                                                              | provaltech.com/dan.hicks |
| 3:48:07 pm 28-Oct-22    | Execute Powershell Command-0008  | New command variable is: -Command "(Get-Date -format MM-yyyy).ToString()"                                                                                                                                                                      | provaltech.com/dan.hicks |
| 3:48:07 pm 28-Oct-22    | Execute Powershell Command-0008  | Custom commands detected as (Get-Date -format MM-yyyy).ToString()                                                                                                                                                                            | provaltech.com/dan.hicks |
| 3:48:06 pm 28-Oct-22    | Execute Powershell Command-0002  | Powershell is present.                                                                                                                                                                                                                           | provaltech.com/dan.hicks |
| 3:48:05 pm 28-Oct-22    | Execute Powershell Command (64-bit, Run As System) | Success THEN                                                                                                                                                                                                                                     | provaltech.com/dan.hicks |
| 3:48:05 pm 28-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server.                                                                                                             | provaltech.com/dan.hicks |
| 3:48:05 pm 28-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0016 | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/735959849026022/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 3.                                     | provaltech.com/dan.hicks |
| 3:47:41 pm 28-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0011 | Executing 64-bit Powershell command as System: -file "%ProgramData%/_automation/StackContent/Get-VsaTimeSaved.ps1" -BaseURL [https://vsa.provaltech.com](https://vsa.provaltech.com) -VsaUserName dantestapi -RestApiToken 8a8e0cf0-bac1-4faa-ae2e-3cfa04e3938c >"c:/provaltech/psoutputtmp.txt" | provaltech.com/dan.hicks |
| 3:47:41 pm 28-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0013 | Sending output to global variable.                                                                                                                                                                                                              | provaltech.com/dan.hicks |
| 3:47:41 pm 28-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0007 | Custom commands detected as -BaseURL [https://vsa.provaltech.com](https://vsa.provaltech.com) -VsaUserName dantestapi -RestApiToken 8a8e0cf0-bac1-4faa-ae2e-3cfa04e3938c                                                                 | provaltech.com/dan.hicks |
| 3:47:41 pm 28-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0006 | Powershell command specified as %ProgramData%/_automation/StackContent/Get-VsaTimeSaved.ps1                                                                                                                                                   | provaltech.com/dan.hicks |
| 3:47:40 pm 28-Oct-22    | Execute Powershell Command (64-bit, Run As System)-0002 | Powershell is present.                                                                                                                                                                                                                           | provaltech.com/dan.hicks |
| 3:47:37 pm 28-Oct-22    | Execute Powershell Command       | Success THEN                                                                                                                                                                                                                                     | provaltech.com/dan.hicks |
| 3:47:37 pm 28-Oct-22    | Execute Powershell Command-0011  | Powershell command completed!                                                                                                                                                                                                                   | provaltech.com/dan.hicks |
| 3:47:35 pm 28-Oct-22    | Execute Powershell Command-0011  | Executing powershell "" -Command "New-Item -ItemType Directory -Path %ProgramData%/_automation/ -Name StackContent -ErrorAction SilentlyContinue" ""                                                                                          | provaltech.com/dan.hicks |
| 3:47:35 pm 28-Oct-22    | Execute Powershell Command-0010  | Not sending output to variable.                                                                                                                                                                                                                  | provaltech.com/dan.hicks |
| 3:47:35 pm 28-Oct-22    | Execute Powershell Command-0008  | New command variable is: -Command "New-Item -ItemType Directory -Path %ProgramData%/_automation/ -Name StackContent -ErrorAction SilentlyContinue"                                                                                           | provaltech.com/dan.hicks |
| 3:47:35 pm 28-Oct-22    | Execute Powershell Command-0008  | Custom commands detected as New-Item -ItemType Directory -Path %ProgramData%/_automation/ -Name StackContent -ErrorAction SilentlyContinue                                                                                                     | provaltech.com/dan.hicks |
| 3:47:34 pm 28-Oct-22    | Execute Powershell Command-0002  | Powershell is present.                                                                                                                                                                                                                           | provaltech.com/dan.hicks |
| 3:47:26 pm 28-Oct-22    | Run Now - Time Saved Report      | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Time Saved Report to run at Oct 28 2022 3:47 PM                                                                                                                                 |                          |

## Dependencies

[VSA - VSA Configuration - Solution - Automation Time Saved Tracking](/docs/81ac366c-a635-4419-9a29-94a1fe7ddac0)

## Process

Downloads and runs [VSA - VSA Host Procedure - Agnostic - Get-VsaTimeSaved.ps1](/docs/b2661e46-518b-4a4f-9b4b-21f9b69ff100) and places the CSV it generates into the GetFiles directory.

## Output

Agent Procedure Log
## Attachments
[Procedure_Time_Saved_Report.xml](<../../../static/attachments/itg/11262292/Procedure_Time_Saved_Report.xml>)