---
id: 'cwa-steps-to-apply-remote-monitor'
title: 'Steps to Apply Remote Monitor'
title_meta: 'Steps to Apply Remote Monitor'
keywords: ['remote', 'monitor', 'groupid', 'query', 'alert', 'template']
description: 'This document provides a step-by-step guide on how to apply a remote monitor in ConnectWise Automate, including obtaining group IDs, executing SQL queries, and applying alert templates.'
tags: ['database', 'configuration', 'alert', 'setup', 'windows']
draft: false
unlisted: false
---
## Steps to Apply Remote Monitor

### 1.
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

### 2.
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Groupid(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Unexpected Shutdown' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'EV - Unexpected Shutdown Detected on %COMPUTERNAME%~~~%RESULT%!!!EV - Unexpected Shutdown Detected on %COMPUTERNAME%~~~%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = \'SilentlyContinue\'; $st = (Get-Date).AddMinutes(-60); $r = Get-WinEvent -FilterHashtable @{ LogName=\'System\'; Id=41; starttime=$st; Level = 1; ProviderName = \'Microsoft-Windows-Kernel-Power\' } -MaxEvents 1 | ForEach-Object { $ex = ([xml]$_.ToXml()).Event; $e = [ordered]@{ EventDate = [DateTime]$ex.System.TimeCreated.SystemTime; Computer = $ex.System.Computer }; $ex.EventData.ChildNodes | ForEach-Object { $e[$_.Name] = if($_.Name -eq \'PowerButtonTimestamp\'){ if ( $_.\'#text\' -ne 0 ) {[DateTime]::FromFileTimeUtc($_.\'#text\') } else {$_.\'#text\'} } elseif ( $_.name -eq \'BugCheckCode\' -and $_.\'#text\' -ne 0 ) { [int]$dec = $_.\'#text\'; $hex = $dec.Tostring(\'x\'); $count = $hex.ToString()| Measure-Object -Character; $zero = 8-$count.Characters; $zero = $(\'0\' * $zero); \"0x$zero$hex\" } else { $_.\'#text\'}}; [PsCustomObject]$e }; if( $r ){ $sd = Get-WinEvent -FilterHashtable @{ LogName=\'System\'; Id=6008 } -MaxEvents 1; $ex = ([xml]$sd.ToXml()).Event;\"The previous system shutdown at $($ex.eventdata.data[0] -replace $([char]0x200E),\'\') at $($ex.eventdata.data[1] -replace $([char]0x200E),\'\') was unexpected.\"; \' \'; \'EventID: 41\'; \'--------------------------------------\'; $r; if( $r.BugcheckCode -ne 0 ) { \'----------------------------------------\'; \'Please review this article for more information on the detected BugCheckCode: [Event ID 41](https://learn.microsoft.com/en-us/troubleshoot/windows-client/performance/event-id-41-restart)\' } elseif( $r.PowerButtonTimestamp -ne 0 ) { \'----------------------------------------\'; \'The user pressed the power button.\' } else { \'----------------------------------------\'; \'The computer was not shutdown due to a it crashing or a user pressing the powerbutton most likely cause was a power outage\' } } else { return \'No detections.\' }"' as `DataOut`,
'16' as `Comparor`,
'10|^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})(No detections.)((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$|11|(The previous system shutdown at ([0-9]{1,2}:){1,2}[0-9]{1,2} [AP]M at .* was unexpected.)%7C(^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})(No detections.)((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)|10|(The previous system shutdown at ([0-9]{1,2}:){1,2}[0-9]{1,2} [AP]M at .* was unexpected.)' as `DataIn`,
'' as `IDField`,
'0' as `AlertStyle`,
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
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Unexpected Shutdown')
```

### 3.
An example of a query with a groupid:

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Unexpected Shutdown' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'EV - Unexpected Shutdown Detected on %COMPUTERNAME%~~~%RESULT%!!!EV - Unexpected Shutdown Detected on %COMPUTERNAME%~~~%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = \'SilentlyContinue\'; $st = (Get-Date).AddMinutes(-60); $r = Get-WinEvent -FilterHashtable @{ LogName=\'System\'; Id=41; starttime=$st; Level = 1; ProviderName = \'Microsoft-Windows-Kernel-Power\' } -MaxEvents 1 | ForEach-Object { $ex = ([xml]$_.ToXml()).Event; $e = [ordered]@{ EventDate = [DateTime]$ex.System.TimeCreated.SystemTime; Computer = $ex.System.Computer }; $ex.EventData.ChildNodes | ForEach-Object { $e[$_.Name] = if($_.Name -eq \'PowerButtonTimestamp\'){ if ( $_.\'#text\' -ne 0 ) {[DateTime]::FromFileTimeUtc($_.\'#text\') } else {$_.\'#text\'} } elseif ( $_.name -eq \'BugCheckCode\' -and $_.\'#text\' -ne 0 ) { [int]$dec = $_.\'#text\'; $hex = $dec.Tostring(\'x\'); $count = $hex.ToString()| Measure-Object -Character; $zero = 8-$count.Characters; $zero = $(\'0\' * $zero); \"0x$zero$hex\" } else { $_.\'#text\'}}; [PsCustomObject]$e }; if( $r ){ $sd = Get-WinEvent -FilterHashtable @{ LogName=\'System\'; Id=6008 } -MaxEvents 1; $ex = ([xml]$sd.ToXml()).Event;\"The previous system shutdown at $($ex.eventdata.data[0] -replace $([char]0x200E),\'\') at $($ex.eventdata.data[1] -replace $([char]0x200E),\'\') was unexpected.\"; \' \'; \'EventID: 41\'; \'--------------------------------------\'; $r; if( $r.BugcheckCode -ne 0 ) { \'----------------------------------------\'; \'Please review this article for more information on the detected BugCheckCode: [Event ID 41](https://learn.microsoft.com/en-us/troubleshoot/windows-client/performance/event-id-41-restart)\' } elseif( $r.PowerButtonTimestamp -ne 0 ) { \'----------------------------------------\'; \'The user pressed the power button.\' } else { \'----------------------------------------\'; \'The computer was not shutdown due to a it crashing or a user pressing the powerbutton most likely cause was a power outage\' } } else { return \'No detections.\' }"' as `DataOut`,
'16' as `Comparor`,
'10|^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})(No detections.)((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$|11|(The previous system shutdown at ([0-9]{1,2}:){1,2}[0-9]{1,2} [AP]M at .* was unexpected.)%7C(^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})(No detections.)((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)|10|(The previous system shutdown at ([0-9]{1,2}:){1,2}[0-9]{1,2} [AP]M at .* was unexpected.)' as `DataIn`,
'' as `IDField`,
'0' as `AlertStyle`,
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
WHERE m.groupid IN (2,3,855,856)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Unexpected Shutdown')
```

### 4.
Now execute your query from a RAWSQL monitor set.

### 5.
Locate your remote monitor by opening the group(s) remote monitors tab.

### 6.
Limit the remote monitor to a search, if necessary.

### 7.
Apply the appropriate alert template to the remote monitors.


