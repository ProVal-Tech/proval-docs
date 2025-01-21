---
id: '1b3d6a20-7e4d-4402-95f3-c2d54fa90b0e'
title: 'PowerShell Within A Scheduled Task'
title_meta: 'PowerShell Within A Scheduled Task'
keywords: ['scheduled', 'task', 'logon', 'powershell', 'automation']
description: 'This document outlines an agent procedure used to create a scheduled task that runs PowerShell commands at user logon. It provides a detailed example of the procedure log, dependencies, and the process involved in executing the task.'
tags: ['performance', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This agent procedure is used to create a scheduled task at logon and have it run PowerShell parameters as defined with the variables.

## Example Agent Procedure Log

| Time                      | Procedure                    | Description                                                                                                                 | Admin                          |
|---------------------------|------------------------------|-----------------------------------------------------------------------------------------------------------------------------|--------------------------------|
| 9:56:10 am 27-Jan-23      | Download Folder Empty         | Success THEN                                                                                                              | provaltech.com/derek.joniak    |
| 9:56:10 am 27-Jan-23      | Download Folder Empty         | Comment at THEN step 4                                                                                                   | provaltech.com/derek.joniak    |
| 9:56:10 am 27-Jan-23      | Execute PowerShell Command    | Success THEN                                                                                                              | provaltech.com/derek.joniak    |
| 9:56:08 am 27-Jan-23      | Execute PowerShell Command-0011| PowerShell command completed!                                                                                             | provaltech.com/derek.joniak    |
| 9:55:49 am 27-Jan-23      | Execute PowerShell Command-0011| Executing PowerShell `\"\" -Command \"\"$taskName = 'EmptyDownloadFolder';if((Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) -eq $null)\\\{$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-Command \"Get-ChildItem $env:USERPROFILE/Downloads | Remove-Item -Recurse\"';$trigger = New-ScheduledTaskTrigger -AtLogon;$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -Hidden -RestartInterval (New-TimeSpan -Minutes 1) -RestartCount 3 -ExecutionTimeLimit (New-TimeSpan -Hours 1);Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings;Write-Output \"Scheduled task '$taskName' created successfully\"}else\\\{Write-Output \"Task Already Exists or Failed To Create Task\"}\"\"` | provaltech.com/derek.joniak    |
| 9:55:49 am 27-Jan-23      | Execute PowerShell Command-0010| Not sending output to variable.                                                                                           | provaltech.com/derek.joniak    |
| 9:55:49 am 27-Jan-23      | Execute PowerShell Command-0008| New command variable is: `-Command \"\"$taskName = 'EmptyDownloadFolder';if((Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) -eq $null)\\\{$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-Command \"Get-ChildItem $env:USERPROFILE/Downloads | Remove-Item -Recurse\"';$trigger = New-ScheduledTaskTrigger -AtLogon;$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -Hidden -RestartInterval (New-TimeSpan -Minutes 1) -RestartCount 3 -ExecutionTimeLimit (New-TimeSpan -Hours 1);Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings;Write-Output \"Scheduled task '$taskName' created successfully\"}else\\\{Write-Output \"Task Already Exists or Failed To Create Task\"}\"\"` | provaltech.com/derek.joniak    |
| 9:55:49 am 27-Jan-23      | Execute PowerShell Command-0008| Custom commands detected as `\"$taskName = 'EmptyDownloadFolder';if((Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) -eq $null)\\\{$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-Command \"Get-ChildItem $env:USERPROFILE/Downloads | Remove-Item -Recurse\"';$trigger = New-ScheduledTaskTrigger -AtLogon;$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -Hidden -RestartInterval (New-TimeSpan -Minutes 1) -RestartCount 3 -ExecutionTimeLimit (New-TimeSpan -Hours 1);Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings;Write-Output \"Scheduled task '$taskName' created successfully\"}else\\\{Write-Output \"Task Already Exists or Failed To Create Task\"}\"` | provaltech.com/derek.joniak    |
| 9:55:40 am 27-Jan-23      | Execute PowerShell Command-0002| PowerShell is present.                                                                                                   | provaltech.com/derek.joniak    |
| 9:55:25 am 27-Jan-23      | Run Now - Download Folder Empty| Admin provaltech.com/derek.joniak scheduled procedure Run Now - Download Folder Empty to run at Jan 27 2023 10:55 AM | provaltech.com/derek.joniak    |

## Dependencies

Does this procedure depend on other VSA content? Link the ITGlue article for the content documentation.

## Process

Describe how the agent procedure completes its objective.

## Output

Procedure log files and other outputs.




