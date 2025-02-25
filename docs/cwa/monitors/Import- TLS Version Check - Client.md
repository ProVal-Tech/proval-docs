---
id: 'a2436d9b-83e4-4405-a3e1-dc4019438d3a'
title: 'Import- TLS Version Check - Client'
title_meta: 'Import- TLS Version Check - Client'
keywords: ['remote', 'monitor', 'groupid', 'alert', 'query']
description: 'This document provides a detailed guide on how to apply a remote monitor to specific groups in your system. It includes steps to obtain group IDs, modify a SQL query, and execute it to set up the remote monitor effectively.'
tags: ['database', 'setup']
draft: false
unlisted: false
---

## Steps to Apply Remote Monitor

### 1. Obtain Group ID(s)
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### 2. Modify the Query
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups. The string to replace can be found at the very bottom of the query, right after **WHERE**.

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'TLS Version Check - Client' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $protocols = @(\'1.0\',\'1.1\',\'1.2\',\'1.3\'); $Enabled = @() ;foreach ( $protocol in $protocols ) { $Enable = (Get-Itemproperty \\"HKLM:\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\TLS $($protocol)\\Client\\" -Erroraction SilentlyContinue).Enabled; if ($Enable -ne $Null) {if ($Enable -ge 1) {$Enabled += $protocol} } else {$OSVer = [version](Get-WmiObject Win32_OperatingSystem).Version; if($OSVer -lt [Version]\'6.1\') {$Enabled += @(\'1.0\') -Match $protocol} elseif ($osVer -lt [Version]\'6.2\') {$Enabled += @(\'1.0\',\'1.1\') -Match $protocol} else {$Enabled += @(\'1.0\',\'1.1\',\'1.2\') -Match $Protocol} }}; return $($Enabled -Join \',\')"' as `DataOut`,
'12' as `Comparor`,
'' as `DataIn`,
'' as `IDField`,
'0' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'TLS Version Check - Client')
```

### 3. Example Query
An example of a query with a group ID:

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'TLS Version Check - Client' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $protocols = @(\'1.0\',\'1.1\',\'1.2\',\'1.3\'); $Enabled = @() ;foreach ( $protocol in $protocols ) { $Enable = (Get-Itemproperty \\"HKLM:\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\TLS $($protocol)\\Client\\" -Erroraction SilentlyContinue).Enabled; if ($Enable -ne $Null) {if ($Enable -ge 1) {$Enabled += $protocol} } else {$OSVer = [version](Get-WmiObject Win32_OperatingSystem).Version; if($OSVer -lt [Version]\'6.1\') {$Enabled += @(\'1.0\') -Match $protocol} elseif ($osVer -lt [Version]\'6.2\') {$Enabled += @(\'1.0\',\'1.1\') -Match $protocol} else {$Enabled += @(\'1.0\',\'1.1\',\'1.2\') -Match $Protocol} }}; return $($Enabled -Join \',\')"' as `DataOut`,
'12' as `Comparor`,
'' as `DataIn`,
'' as `IDField`,
'0' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,856)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'TLS Version Check - Client')
```

### 4. Execute the Query
Now execute your query from a RAWSQL monitor set.

### 5. Locate Your Remote Monitor
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.