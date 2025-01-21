---
id: '88dfd269-1df7-4c57-a898-9445dec162b5'
title: 'Urgent Ticket Monitoring for Automate Server'
title_meta: 'Urgent Ticket Monitoring for Automate Server - ProVal'
keywords: ['ticket', 'monitoring', 'automate', 'event', 'error', 'critical']
description: "This document outlines the setup for a remote monitor that generates an urgent ticket in ProVal's Autotask portal when critical events from specified sources occur more than 10 times within 60 minutes on the Automate server. It is specifically designed for On-Prem partners and includes detailed configuration settings and dependencies."
tags: ['autotask']
draft: false
unlisted: false
---

## Summary

The purpose of this remote monitor is to generate an urgent ticket in our (ProVal's) Autotask portal in the event that an error or critical event from either "DBAgent", "ASPWCC2", or "MySQL" event sources is generated more than 10 times within the past 60 minutes on the Automate server.

This should be applied to On-Prem partners only.

## Details

**Suggested "Limit to"**: Labtech Server  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Automate Server - Event Log Monitoring [Autofix]  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference= /"SilentlyContinue/"; $Logs = (Get-WinEvent -LogName 'Application','RMM System' | Where-Object \{ $_.ProviderName -match 'DBAgent|ASPWCC2|MySQL' -and $_.Level -in (1,2,3) -and $_.TimeCreated -gt (Get-Date).AddHours(-1) } | Select-Object -Property ProviderName, ID, LevelDisplayName | Group-Object -Property ID,LevelDisplayName,ProviderName | Sort-Object -Property Count -Descending | Select-Object -Property Group, Count | Where-Object \{ $_.Count -gt 10 }); IF($Logs) \{ $OutCome = "Following Event logs Occurred more than 10 times in the last 60 Minutes`r`n"; ForEach ($Log in $Logs) \{ $OutLog = $Log.Group | Select-Object -Property ProviderName, ID, LevelDisplayName -Unique; $OutCome += "`r`nEvent Source: $($OutLog.ProviderName)`r`nEvent ID: $($OutLog.ID)`r`nEvent Type: $($OutLog.LevelDisplayName)`r`nNumber Of Occurrences: $($Log.Count)`r`n"; }; Clear-Host; Write-Host "$($OutCome)"; } Else \{ Clear-Host; Write-Host "OK"; }" | Contains | 3600 | OK |

## Dependencies

[Automate Server - Event Log Monitoring [Autofix]](<../scripts/Automate Server - Event Log Monitoring Autofix.md>)

## Target

Service [Plans.Windows](http://plans.Windows) servers. Server Roles. MSP Specific Servers. Labtech Server


