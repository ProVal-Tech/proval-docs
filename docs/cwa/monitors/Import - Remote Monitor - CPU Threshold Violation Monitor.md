---
id: '5c569ca2-1a4f-4a55-835f-26c45db11d34'
title: 'Import - Remote Monitor - CPU Threshold Violation Monitor'
title_meta: 'Import - Remote Monitor - CPU Threshold Violation Monitor'
keywords: ['cpu', 'monitor', 'threshold', 'alert', 'setup']
description: 'This document provides a step-by-step guide on how to set up a CPU threshold violation monitor in ConnectWise Automate. It includes instructions for obtaining group IDs, modifying SQL queries, and applying alert templates.'
tags: ['cpu', 'setup']
draft: false
unlisted: false
---

## Step 1
Obtain the group ID(s) of the group(s) to which the remote monitor should be applied.

## Step 2
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Production - CPU Threshold Violation Monitor' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  'CPU Usage High on %Computername% at %locationname%~~~This is an automated update to inform you that the high CPU utilization issue reported earlier has now been resolved. The system has detected that the CPU usage has returned to normal and the performance has improved.
  !!!CPU Usage High on %Computername% at %locationname%~~~The CPU usage on the machine %computername% located at %clientname%\\%locationname% is currently reporting high CPU usage. Please investigate the issue and take appropriate actions to address the root cause. As per the severity of the issue, it is recommended to prioritize this ticket accordingly.
  %RESULT%' as `AlertMessage`,
  '0' as `ContactID`,
  '600' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= \'SilentlyContinue\';$tl = 70;$th = 85;$m = /\"$env:TEMP\\cpu_over_t\\/\";$t = $( if (Test-Path $m) { $tl } else { $th } );sal gpc \'Get-Counter\';$c = gpc \'\\Processor Information(_Total)\\% Processor Time\' -SampleInterval 1 -MaxSamples 10;$cu = $c.CounterSamples.CookedValue | Measure -Average | Select -exp Average;if ($t -le $cu) {Write-Output /\"Total CPU Usage: $([Math]::Round($cu,2))%`n`nTop 5 Processes utilizing CPU:/\";$null > $m; $Obj = @((gpc \'\\Process(*)\\% Processor Time\').CounterSamples |Where { $_.InstanceName -notin ('_total','idle') } | Group InstanceName | % {[PSCustomObject]@{ InstanceName = $_.Name; CookedValue = ($_.Group | Measure -Property CookedValue -Sum).Sum } } | Sort -Property CookedValue -Descending | Select @{l = 'Process'; e = { $_.InstanceName } }, @{l = 'CPUUsage'; e = { [math]::Round(($_.CookedValue) / [System.Environment]::ProcessorCount, 2) } } -First 5); $obj; if($obj.process -match 'powershell') {Write-Output /\"`nPowerShell Process Command Line:`n/\"; (Get-Ciminstance -Class Win32_Process -Filter /\"Name = 'powershell.exe'/\").Commandline}} else { Remove-Item $m }"' as `DataOut`,
  '16' as `Comparor`,
  '10|(^(\\r\\n%7COK)$)%7C(^$)|11|(Total CPU Usage: [0-9.]{1,6}%25)%7C(^(\\r\\n%7COK)$)%7C(^$)|10|Total CPU Usage: [0-9.]{1,6}%25' as `DataIn`,
  '0' as `IDField`,
  '1' as `AlertStyle`,
  '0' as `ScriptID`,
  '' as `datacollector`,
  '21' as `Category`,
  '0' as `TicketCategory`,
  '1' as `ScriptTarget`,
  CONCAT(
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
  ) as `GUID`,
  'root' as `UpdatedBy`,
  (NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (**YOUR COMMA SEPARATED LIST OF GROUPID(S)**)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - CPU Threshold Violation Monitor')
```

## Step 3
An example of a query with a group ID:

```
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Production - CPU Threshold Violation Monitor' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  'CPU Usage High on %Computername% at %locationname%~~~This is an automated update to inform you that the high CPU utilization issue reported earlier has now been resolved. The system has detected that the CPU usage has returned to normal and the performance has improved.
  !!!CPU Usage High on %Computername% at %locationname%~~~The CPU usage on the machine %computername% located at %clientname%\\%locationname% is currently reporting high CPU usage. Please investigate the issue and take appropriate actions to address the root cause. As per the severity of the issue, it is recommended to prioritize this ticket accordingly.
  %RESULT%' as `AlertMessage`,
  '0' as `ContactID`,
  '600' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= \'SilentlyContinue\';$tl = 70;$th = 85;$m = /\"$env:TEMP\\cpu_over_t\\/\";$t = $( if (Test-Path $m) { $tl } else { $th } );sal gpc \'Get-Counter\';$c = gpc \'\\Processor Information(_Total)\\% Processor Time\' -SampleInterval 1 -MaxSamples 10;$cu = $c.CounterSamples.CookedValue | Measure -Average | Select -exp Average;if ($t -le $cu) {Write-Output /\"Total CPU Usage: $([Math]::Round($cu,2))%`n`nTop 5 Processes utilizing CPU:/\";$null > $m; $Obj = @((gpc \'\\Process(*)\\% Processor Time\').CounterSamples |Where { $_.InstanceName -notin ('_total','idle') } | Group InstanceName | % {[PSCustomObject]@{ InstanceName = $_.Name; CookedValue = ($_.Group | Measure -Property CookedValue -Sum).Sum } } | Sort -Property CookedValue -Descending | Select @{l = 'Process'; e = { $_.InstanceName } }, @{l = 'CPUUsage'; e = { [math]::Round(($_.CookedValue) / [System.Environment]::ProcessorCount, 2) } } -First 5); $obj; if($obj.process -match 'powershell') {Write-Output /\"`nPowerShell Process Command Line:`n/\"; (Get-Ciminstance -Class Win32_Process -Filter /\"Name = 'powershell.exe'/\").Commandline}} else { Remove-Item $m }"' as `DataOut`,
  '16' as `Comparor`,
  '10|(^(\\r\\n%7COK)$)%7C(^$)|11|(Total CPU Usage: [0-9.]{1,6}%25)%7C(^(\\r\\n%7COK)$)%7C(^$)|10|Total CPU Usage: [0-9.]{1,6}%25' as `DataIn`,
  '0' as `IDField`,
  '1' as `AlertStyle`,
  '0' as `ScriptID`,
  '' as `datacollector`,
  '21' as `Category`,
  '0' as `TicketCategory`,
  '1' as `ScriptTarget`,
  CONCAT(
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    '-',
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
  ) as `GUID`,
  'root' as `UpdatedBy`,
  (NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,856)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - CPU Threshold Violation Monitor')
```

## Step 4
Now execute your query from a RAWSQL monitor set.

## Step 5
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.


