---
id: '1b3d6a20-7e4d-4402-95f3-c2d54fa90b0e'
title: 'Create Scheduled Task at Logon'
title_meta: 'Create Scheduled Task at Logon'
keywords: ['scheduled', 'task', 'logon', 'powershell', 'automation']
description: 'This document outlines an agent procedure used to create a scheduled task that runs PowerShell commands at user logon. It provides a detailed example of the procedure log, dependencies, and the process involved in executing the task.'
tags: ['configuration', 'windows', 'performance', 'software', 'setup']
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
| 9:56:10 am 27-Jan-23      | Execute Powershell Command    | Success THEN                                                                                                              | provaltech.com/derek.joniak    |
| 9:56:08 am 27-Jan-23      | Execute Powershell Command-0011| Powershell command completed!                                                                                             | provaltech.com/derek.joniak    |
| 9:55:49 am 27-Jan-23      | Execute Powershell Command-0011| Executing powershell `"" -Command ""$taskName = 'EmptyDownloadFolder';if((Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) -eq $null){$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-Command "Get-ChildItem $env:USERPROFILE/Downloads | Remove-Item -Recurse"';$trigger = New-ScheduledTaskTrigger -AtLogon;$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -Hidden -RestartInterval (New-TimeSpan -Minutes 1) -RestartCount 3 -ExecutionTimeLimit (New-TimeSpan -Hours 1);Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings;Write-Output "Scheduled task '$taskName' created successfully"}else{Write-Output "Task Already Exists or Failed To Create Task"}""` | provaltech.com/derek.joniak    |
| 9:55:49 am 27-Jan-23      | Execute Powershell Command-0010| Not sending output to variable.                                                                                           | provaltech.com/derek.joniak    |
| 9:55:49 am 27-Jan-23      | Execute Powershell Command-0008| New command variable is: `-Command ""$taskName = 'EmptyDownloadFolder';if((Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) -eq $null){$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-Command "Get-ChildItem $env:USERPROFILE/Downloads | Remove-Item -Recurse"';$trigger = New-ScheduledTaskTrigger -AtLogon;$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -Hidden -RestartInterval (New-TimeSpan -Minutes 1) -RestartCount 3 -ExecutionTimeLimit (New-TimeSpan -Hours 1);Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings;Write-Output "Scheduled task '$taskName' created successfully"}else{Write-Output "Task Already Exists or Failed To Create Task"}""` | provaltech.com/derek.joniak    |
| 9:55:49 am 27-Jan-23      | Execute Powershell Command-0008| Custom commands detected as `"$taskName = 'EmptyDownloadFolder';if((Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) -eq $null){$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-Command "Get-ChildItem $env:USERPROFILE/Downloads | Remove-Item -Recurse"';$trigger = New-ScheduledTaskTrigger -AtLogon;$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -Hidden -RestartInterval (New-TimeSpan -Minutes 1) -RestartCount 3 -ExecutionTimeLimit (New-TimeSpan -Hours 1);Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings;Write-Output "Scheduled task '$taskName' created successfully"}else{Write-Output "Task Already Exists or Failed To Create Task"}"` | provaltech.com/derek.joniak    |
| 9:55:40 am 27-Jan-23      | Execute Powershell Command-0002| Powershell is present.                                                                                                   | provaltech.com/derek.joniak    |
| 9:55:25 am 27-Jan-23      | Run Now - Download Folder Empty| Admin provaltech.com/derek.joniak scheduled procedure Run Now - Download Folder Empty to run at Jan 27 2023 10:55AM | provaltech.com/derek.joniak    |

## Dependencies

Does this Procedure depend on other VSA content? Link the ITGlue Article for the content documentation.

## Process

Describe how the Agent Procedure completes its objective.

## Output

Procedure Logfiles and other outputs.






