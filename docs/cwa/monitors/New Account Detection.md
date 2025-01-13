---
id: 'cwa-remote-monitor-new-user-account'
title: 'Remote Monitor for New User Account Creation'
title_meta: 'Remote Monitor for New User Account Creation'
keywords: ['monitor', 'user', 'account', 'event', 'log', 'windows', 'server', 'workstation']
description: 'This document details a remote monitor designed to detect the creation of new user accounts on local machines by querying the event log. It includes suggested configurations for alert styles and templates, as well as example check actions and values for implementation.'
tags: ['monitoring', 'windows', 'event', 'alert', 'configuration', 'server', 'workstation']
draft: false
unlisted: false
---
## Summary

This is a remote monitor. Determines via querying the event log if a new user account has been created on the local machine.

## Details

**Suggested "Limit to"**: Windows Server, Workstations (Optional).  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Create Ticket  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File    | See Below   | Missing    | 900      |        |

| Check Value |
|-------------|
| C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "$events = Get-EventLog security -erroraction silentlycontinue -After (Get-Date).AddMinutes(-15) -InstanceId 4720;foreach($event in $events) {$messageArray = $($event.message -split \"`n\");$newAccountIndex = $null;for($i = 0; $i -lt $messageArray.length; $i++) {if($messageArray[$i] -match \"^New Account:\") {$newAccountIndex = $i}}$newAccountLine = $null;for($i = $newAccountIndex; $i -lt $messageArray.length; $i++) {if($messageArray[$i] -match \"Account Name:\") {$newAccountLine = $($messageArray[$i].Trim() -replace \"Account Name: *\",'');$result = $newAccountLine.Trim();break}}$result}" |

## Dependencies

## Target

The suggested target for the monitor: Service Plan(s) for Servers and Workstations.

Examples:  
Windows Servers - Should be run on all Windows-based servers.  
Windows Workstations - Should be run on all Windows workstations (Optional).



