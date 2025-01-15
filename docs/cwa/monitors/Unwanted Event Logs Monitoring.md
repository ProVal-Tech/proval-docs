---
id: '88dfd269-1df7-4c57-a898-9445dec162b5'
title: 'Urgent Ticket Monitoring for Automate Server'
title_meta: 'Urgent Ticket Monitoring for Automate Server - ProVal'
keywords: ['ticket', 'monitoring', 'automate', 'event', 'error', 'critical']
description: 'This document outlines the setup for a remote monitor that generates an urgent ticket in ProVal/'s Autotask portal when critical events from specified sources occur more than 10 times within 60 minutes on the Automate server. It is specifically designed for On-Prem partners and includes detailed configuration settings and dependencies.'
tags: ['alert', 'server', 'event', 'monitor', 'autotask', 'on-prem', 'labtech']
draft: false
unlisted: false
---
## Summary

The purpose of this remote monitor is to generate an Urgent ticket in our (ProVal's) Autotask portal in the event that an error or critical event from either of "DBAgent", "ASPWCC2", and "MySQL" event sources are generated more than 10 times within the past 60 minutes on Automate server.

Also, this should be applied to the On-Prem partners only.

## Details

**Suggested "Limit to"**: Labtech Server  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Automate Server - Event Log Monitoring [Autofix]  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference= /"SilentlyContinue/"; $Logs = (Get-winevent -LogName 'Application','RMM System' |Where-Object {$_.ProviderName -match 'DBAgent|ASPWCC2|MySQL' -and $_.Level -in (1,2,3) -and $_.TimeCreated -gt (Get-Date).Addhours(-1)}|select-object -Property ProviderName, ID, LevelDisplayName  |Group-Object -Property ID,LevelDisplayName,ProviderName |Sort-Object -Property Count -Descending | Select-Object -Property group, Count |Where-Object {$_.Count -gt 10}); IF($Logs){$OutCome = /"Following Event logs Occurred more than 10 times in the last 60 Minutes`r`n/"; Foreach ($Log in $Logs) {$OutLog= [Log.group](http://log.group) | Select-Object  -property ProviderName, ID, LevelDisplayName -Unique; $OutCome += /"`r`nEvent Source: $($OutLog.ProviderName)`r`nEVentID: $($OutLog.ID) `r`nEvent Type: $($OutLog.LevelDisplayName)`r`nNumber Of Occurences: $($Log.Count)`r`n/" }; Clear-Host; Write-Host /"$($OutCome)/"} Else {Clear-Host; Write-Host /"OK/"}" | Contains | 3600 | OK |

## Dependencies

[Automate Server - Event Log Monitoring [Autofix]](https://proval.itglue.com/DOC-5078775-10390937)

## Target

Service [Plans.Windows](http://plans.Windows) servers.Server Roles.MSP Specific Servers.Labtech Server






