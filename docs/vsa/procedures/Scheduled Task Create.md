---
id: 'c6bc7c56-5ff9-4dad-9743-37076f18864f'
slug: /c6bc7c56-5ff9-4dad-9743-37076f18864f
title: 'Scheduled Task Create'
title_meta: 'Scheduled Task Create'
keywords: ['scheduledtask', 'endpoint', 'task', 'automation', 'cmd']
description: 'This document provides a detailed guide on how to create a scheduled task on an endpoint using PowerShell. It includes example logs, FAQs, and a process overview to help users understand the steps involved in setting up a scheduled task effectively.'
tags: ['performance', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to create a scheduled task on the endpoint.

## Example Agent Procedure Log

| Time                   | Action                            | Status                                                                                  | User                          |
|------------------------|-----------------------------------|-----------------------------------------------------------------------------------------|-------------------------------|
| 3:56:36 pm 1-Feb-23    | Scheduled Task Create             | Success THEN                                                                          | provaltech.com/dan.hicks     |
| 3:56:36 pm 1-Feb-23    | Execute PowerShell Command        | Success THEN                                                                          | provaltech.com/dan.hicks     |
| 3:56:36 pm 1-Feb-23    | Execute PowerShell Command-0012   | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/dan.hicks     |
| 3:56:36 pm 1-Feb-23    | Execute PowerShell Command-0012   | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/229175768944442/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/dan.hicks     |
| 3:56:35 pm 1-Feb-23    | Execute PowerShell Command-0011   | PowerShell command completed!                                                         | provaltech.com/dan.hicks     |
| 3:56:31 pm 1-Feb-23    | Execute PowerShell Command-0011   | Executing PowerShell "" -Command "$scheduledTask = New-ScheduledTask -Action (New-ScheduledTaskAction -Execute 'cmd.exe' -Argument '#argument') -Trigger (New-ScheduledTaskTrigger -AtLogOn) -Principal (New-ScheduledTaskPrincipal -GroupId (([System.Security.Principal.SecurityIdentifier]::new('S-1-5-32-545')).Translate([System.Security.Principal.NTAccount]).Value)); Register-ScheduledTask -TaskName 'openNotepad' -InputObject $scheduledTask" >"c:/provaltech/psoutput.txt" | provaltech.com/dan.hicks     |
| 3:56:31 pm 1-Feb-23    | Execute PowerShell Command-0010   | Sending output to global variable.                                                    | provaltech.com/dan.hicks     |
| 3:56:30 pm 1-Feb-23    | Execute PowerShell Command-0008   | New command variable is: -Command "$scheduledTask = New-ScheduledTask -Action (New-ScheduledTaskAction -Execute 'cmd.exe' -Argument '#argument') -Trigger (New-ScheduledTaskTrigger -AtLogOn) -Principal (New-ScheduledTaskPrincipal -GroupId (([System.Security.Principal.SecurityIdentifier]::new('S-1-5-32-545')).Translate([System.Security.Principal.NTAccount]).Value)); Register-ScheduledTask -TaskName 'openNotepad' -InputObject $scheduledTask" | provaltech.com/dan.hicks     |
| 3:56:30 pm 1-Feb-23    | Execute PowerShell Command-0008   | Custom commands detected as $scheduledTask = New-ScheduledTask -Action (New-ScheduledTaskAction -Execute 'cmd.exe' -Argument '#argument') -Trigger (New-ScheduledTaskTrigger -AtLogOn) -Principal (New-ScheduledTaskPrincipal -GroupId (([System.Security.Principal.SecurityIdentifier]::new('S-1-5-32-545')).Translate([System.Security.Principal.NTAccount]).Value)); Register-ScheduledTask -TaskName 'openNotepad' -InputObject $scheduledTask | provaltech.com/dan.hicks     |
| 3:56:27 pm 1-Feb-23    | Execute PowerShell Command-0002   | PowerShell is present.                                                                | provaltech.com/dan.hicks     |
| 3:56:26 pm 1-Feb-23    | Execute PowerShell Command        | Success THEN                                                                          | provaltech.com/dan.hicks     |
| 3:56:25 pm 1-Feb-23    | Execute PowerShell Command-0012   | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/dan.hicks     |
| 3:56:25 pm 1-Feb-23    | Execute PowerShell Command-0012   | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/229175768944442/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/dan.hicks     |
| 3:56:25 pm 1-Feb-23    | Execute PowerShell Command-0011   | PowerShell command completed!                                                         | provaltech.com/dan.hicks     |
| 3:56:19 pm 1-Feb-23    | Execute PowerShell Command-0011   | Executing PowerShell "" -Command "Get-ScheduledTask -TaskName openNotepad -ErrorAction SilentlyContinue" >"c:/provaltech/psoutput.txt" | provaltech.com/dan.hicks     |
| 3:56:19 pm 1-Feb-23    | Execute PowerShell Command-0010   | Sending output to global variable.                                                    | provaltech.com/dan.hicks     |
| 3:56:19 pm 1-Feb-23    | Execute PowerShell Command-0008   | New command variable is: -Command "Get-ScheduledTask -TaskName openNotepad -ErrorAction SilentlyContinue" | provaltech.com/dan.hicks     |
| 3:56:19 pm 1-Feb-23    | Execute PowerShell Command-0008   | Custom commands detected as Get-ScheduledTask -TaskName openNotepad -ErrorAction SilentlyContinue | provaltech.com/dan.hicks     |
| 3:56:16 pm 1-Feb-23    | Execute PowerShell Command-0002   | PowerShell is present.                                                                | provaltech.com/dan.hicks     |
| 3:56:07 pm 1-Feb-23    | Run Now - Scheduled Task Create    | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Scheduled Task Create to run at Feb 1 2023 3:56PM | provaltech.com/dan.hicks     |
| 3:52:29 pm 1-Feb-23    | Scheduled Task Create             | Success THEN                                                                          | provaltech.com/dan.hicks     |
| 3:52:29 pm 1-Feb-23    | Execute PowerShell Command        | Success THEN                                                                          | provaltech.com/dan.hicks     |
| 3:52:29 pm 1-Feb-23    | Execute PowerShell Command-0012   | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/dan.hicks     |
| 3:52:29 pm 1-Feb-23    | Execute PowerShell Command-0012   | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/229175768944442/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/dan.hicks     |
| 3:52:28 pm 1-Feb-23    | Execute PowerShell Command-0011   | PowerShell command completed!                                                         | provaltech.com/dan.hicks     |
| 3:52:23 pm 1-Feb-23    | Execute PowerShell Command-0011   | Executing PowerShell "" -Command "$scheduledTask = New-ScheduledTask -Action (New-ScheduledTaskAction -Execute 'cmd.exe' -Argument 'notepad.exe') -Trigger (New-ScheduledTaskTrigger -Daily -At 9am); Register-ScheduledTask -TaskName 'openNotepadAtNine' -InputObject $scheduledTask -User 'NT Authority//System'" >"c:/provaltech/psoutput.txt" | provaltech.com/dan.hicks     |
| 3:52:23 pm 1-Feb-23    | Execute PowerShell Command-0010   | Sending output to global variable.                                                    | provaltech.com/dan.hicks     |
| 3:52:23 pm 1-Feb-23    | Execute PowerShell Command-0008   | New command variable is: -Command "$scheduledTask = New-ScheduledTask -Action (New-ScheduledTaskAction -Execute 'cmd.exe' -Argument 'notepad.exe') -Trigger (New-ScheduledTaskTrigger -Daily -At 9am); Register-ScheduledTask -TaskName 'openNotepadAtNine' -InputObject $scheduledTask -User 'NT Authority//System'" | provaltech.com/dan.hicks     |
| 3:52:23 pm 1-Feb-23    | Execute PowerShell Command-0008   | Custom commands detected as $scheduledTask = New-ScheduledTask -Action (New-ScheduledTaskAction -Execute 'cmd.exe' -Argument 'notepad.exe') -Trigger (New-ScheduledTaskTrigger -Daily -At 9am); Register-ScheduledTask -TaskName 'openNotepadAtNine' -InputObject $scheduledTask -User 'NT Authority//System' | provaltech.com/dan.hicks     |
| 3:52:20 pm 1-Feb-23    | Execute PowerShell Command-0002   | PowerShell is present.                                                                | provaltech.com/dan.hicks     |
| 3:52:19 pm 1-Feb-23    | Execute PowerShell Command        | Success THEN                                                                          | provaltech.com/dan.hicks     |
| 3:52:18 pm 1-Feb-23    | Execute PowerShell Command-0012   | Results returned to global variable #global:psresult# and saved in Documents tab of server. | provaltech.com/dan.hicks     |
| 3:52:18 pm 1-Feb-23    | Execute PowerShell Command-0012   | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/229175768944442/GetFiles/../docs/psoutput.txt with the new contents from c:/provaltech/psoutput.txt in THEN step 2. | provaltech.com/dan.hicks     |
| 3:52:18 pm 1-Feb-23    | Execute PowerShell Command-0011   | PowerShell command completed!                                                         | provaltech.com/dan.hicks     |
| 3:52:12 pm 1-Feb-23    | Execute PowerShell Command-0011   | Executing PowerShell "" -Command "Get-ScheduledTask -TaskName openNotepadAtNine -ErrorAction SilentlyContinue" >"c:/provaltech/psoutput.txt" | provaltech.com/dan.hicks     |
| 3:52:12 pm 1-Feb-23    | Execute PowerShell Command-0010   | Sending output to global variable.                                                    | provaltech.com/dan.hicks     |
| 3:52:12 pm 1-Feb-23    | Execute PowerShell Command-0008   | New command variable is: -Command "Get-ScheduledTask -TaskName openNotepadAtNine -ErrorAction SilentlyContinue" | provaltech.com/dan.hicks     |
| 3:52:12 pm 1-Feb-23    | Execute PowerShell Command-0008   | Custom commands detected as Get-ScheduledTask -TaskName openNotepadAtNine -ErrorAction SilentlyContinue | provaltech.com/dan.hicks     |
| 3:52:09 pm 1-Feb-23    | Execute PowerShell Command-0002   | PowerShell is present.                                                                | provaltech.com/dan.hicks     |
| 3:52:00 pm 1-Feb-23    | Run Now - Scheduled Task Create    | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Scheduled Task Create to run at Feb 1 2023 3:52PM | provaltech.com/dan.hicks     |

## Process

This process parameterizes actions, arguments, and triggers to create a scheduled task. If "AtLogon" is chosen as the task trigger, it will run the task as the Users Group.

## Output

Agent Procedure Log

## FAQ

Be sure to enter your actions and arguments exactly as you would when writing a `New-ScheduledTaskAction` cmdlet. For example, to have Notepad open using `cmd.exe`, you would:

1. Set the action to **cmd.exe**
2. Set the arguments to **/c start notepad.exe**


