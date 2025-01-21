---
id: '75f8c13f-04d5-45fd-b650-3b010353a8c0'
title: 'New Account Detection'
title_meta: 'New Account Detection'
keywords: ['monitor', 'user', 'account', 'event', 'log', 'windows', 'server', 'workstation']
description: 'This document details a remote monitor designed to detect the creation of new user accounts on local machines by querying the event log. It includes suggested configurations for alert styles and templates, as well as example check actions and values for implementation.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This remote monitor determines whether a new user account has been created on the local machine by querying the event log.

## Details

**Suggested "Limit to"**: Windows Server, Workstations (Optional).  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Create Ticket  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File    | See Below   | Missing    | 900      |        |

| Check Value |
|-------------|
| C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe "$events = Get-EventLog security -ErrorAction silentlycontinue -After (Get-Date).AddMinutes(-15) -InstanceId 4720; foreach($event in $events) \{ $messageArray = $($event.Message -split /`n/); $newAccountIndex = $null; for($i = 0; $i -lt $messageArray.Length; $i++) \{ if($messageArray[$i] -match /^New Account:/) \{ $newAccountIndex = $i }} $newAccountLine = $null; for($i = $newAccountIndex; $i -lt $messageArray.Length; $i++) \{ if($messageArray[$i] -match /Account Name:/) \{ $newAccountLine = $($messageArray[$i].Trim() -replace /Account Name: */, ''); $result = $newAccountLine.Trim(); break }} $result }" |

## Dependencies

## Target

The suggested target for the monitor is Service Plan(s) for Servers and Workstations.

**Examples:**  
- **Windows Servers**: Should be run on all Windows-based servers.  
- **Windows Workstations**: Should be run on all Windows workstations (Optional).




