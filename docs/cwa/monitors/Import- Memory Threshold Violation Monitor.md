---
id: 'b630e3e4-3268-42ae-a8e6-c9228968f5cc'
title: 'Remote Monitor Setup for Memory Threshold Violation'
title_meta: 'Remote Monitor Setup for Memory Threshold Violation'
keywords: ['monitor', 'memory', 'threshold', 'violation', 'setup', 'query']
description: 'This document provides a step-by-step guide to setting up a remote monitor for memory threshold violations in ConnectWise Automate. It includes instructions for obtaining group IDs, executing SQL queries, and applying alert templates.'
tags: ['database', 'memory', 'setup']
draft: false
unlisted: false
---

### Step 1
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

---

### Step 2
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Production - Memory Threshold Violation Monitor' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  'Memory Usage High on %Computername% at %locationname%~~~This is an automated update to inform you that the high Memory utilization issue reported earlier has now been resolved. The system has detected that the Memory usage has returned to normal and the performance has improved.!!!Memory Usage High on %Computername% at %locationname%~~~The machine %computername% at %clientname%%locationname% has exceeded the memory threshold. Please investigate the root cause and take corrective actions as soon as possible. This is a high-priority issue that may affect the performance and availability of the system. Note that the total memory usage may not match the memory used by the top 5 processes, because the total memory usage includes the cached pool and the memory used by the system as well.' as `AlertMessage`,
  '0' as `ContactID`,
  '600' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= /'SilentlyContinue/';$tl = 75;$th = 90;$m = /\"$env:TEMP//memory_over_t///\";$t = $( if (Test-Path $m) { $tl } else { $th } );sal gpc /'Get-Counter/';$c = gpc /'//Memory//% Committed Bytes In Use/' -SampleInterval 1 -MaxSamples 10;$cu = $c.CounterSamples.CookedValue | Measure -Average | Select -exp Average;if ($t -le $cu) {Write-Output /\"Total Memory Usage: $([Math]::Round($cu,2))%`n`nTop 5 Processes utilizing Memory:/\";$null > $m; $tm = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory; Get-process | Select Name, WorkingSet64 | Group Name | % {[PSCustomObject]@{ Process = $_.Name; MemoryUsage = $([Math]::Round(100 * (($_.Group | Measure -Property WorkingSet64 -Sum).Sum / $tm),2)) }} | Sort -property MemoryUsage -Descending | Select -First 5 } else { Remove-Item $m -Force -Confirm:$false}\"' as `DataOut`,
  '16' as `Comparor`,
  '10|(^(//r//n%7COK)$)%7C(^$)|11|(Total Memory Usage: [0-9.]{1,6}%25)%7C(^(//r//n%7COK)$)%7C(^$)|10|Total Memory Usage: [0-9.]{1,6}%25' as `DataIn`,
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
WHERE m.groupid IN (**YOUR COMMA SEPARATED LIST OF GROUPID(S)**)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Memory Threshold Violation Monitor')
```

---

### Step 3
An example of a query with a group ID:

```
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Production - Memory Threshold Violation Monitor' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  'Memory Usage High on %Computername% at %locationname%~~~This is an automated update to inform you that the high Memory utilization issue reported earlier has now been resolved. The system has detected that the Memory usage has returned to normal and the performance has improved.!!!Memory Usage High on %Computername% at %locationname%~~~The machine %computername% at %clientname%%locationname% has exceeded the memory threshold. Please investigate the root cause and take corrective actions as soon as possible. This is a high-priority issue that may affect the performance and availability of the system. Note that the total memory usage may not match the memory used by the top 5 processes, because the total memory usage includes the cached pool and the memory used by the system as well.' as `AlertMessage`,
  '0' as `ContactID`,
  '600' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= /'SilentlyContinue/';$tl = 75;$th = 90;$m = /\"$env:TEMP//memory_over_t///\";$t = $( if (Test-Path $m) { $tl } else { $th } );sal gpc /'Get-Counter/';$c = gpc /'//Memory//% Committed Bytes In Use/' -SampleInterval 1 -MaxSamples 10;$cu = $c.CounterSamples.CookedValue | Measure -Average | Select -exp Average;if ($t -le $cu) {Write-Output /\"Total Memory Usage: $([Math]::Round($cu,2))%`n`nTop 5 Processes utilizing Memory:/\";$null > $m; $tm = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory; Get-process | Select Name, WorkingSet64 | Group Name | % {[PSCustomObject]@{ Process = $_.Name; MemoryUsage = $([Math]::Round(100 * (($_.Group | Measure -Property WorkingSet64 -Sum).Sum / $tm),2)) }} | Sort -property MemoryUsage -Descending | Select -First 5 } else { Remove-Item $m -Force -Confirm:$false}\"' as `DataOut`,
  '16' as `Comparor`,
  '10|(^(//r//n%7COK)$)%7C(^$)|11|(Total Memory Usage: [0-9.]{1,6}%25)%7C(^(//r//n%7COK)$)%7C(^$)|10|Total Memory Usage: [0-9.]{1,6}%25' as `DataIn`,
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
    SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
  ) as `GUID`,
  'root' as `UpdatedBy`,
  (NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,856)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Memory Threshold Violation Monitor')
```

---

### Step 4
Now execute your query from a RAWSQL monitor set.

---

### Step 5
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.

