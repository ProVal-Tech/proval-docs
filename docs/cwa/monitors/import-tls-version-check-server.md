---
id: 'b08343d9-9d4b-4edd-92e2-5941c23d8e43'
slug: /b08343d9-9d4b-4edd-92e2-5941c23d8e43
title: 'Import- TLS Version Check - Server'
title_meta: 'Import- TLS Version Check - Server'
keywords: ['tls', 'monitor', 'setup', 'database', 'query']
description: 'This document provides a step-by-step guide on how to set up a remote monitor for checking TLS versions within specified groups in your database. It includes obtaining group IDs, modifying SQL queries, and executing them to establish the monitor.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-04-10
---

## Steps to Apply Remote Monitor

### 1. Obtain Group ID(s)

Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### 2. Modify the Query

Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUP ID(S)** with the Group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'TLS Version Check - Server' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference=''SilentlyContinue''; $protocols=@(''1.0'',''1.1'',''1.2'',''1.3''); $enabled=@(); $osInfo=Get-CimInstance -ClassName ''Win32_OperatingSystem''; $osVersion=[version]$osInfo.Version; $osBuild=[int]$osInfo.BuildNumber; if($osVersion -lt [version]''6.2''){ $osDefaults=@(''1.0'') } elseif($osVersion -lt [version]''10.0''){ $osDefaults=@(''1.0'',''1.1'',''1.2'') } elseif($osBuild -ge 20348){ $osDefaults=@(''1.0'',''1.1'',''1.2'',''1.3'') } else { $osDefaults=@(''1.0'',''1.1'',''1.2'') }; foreach($protocol in $protocols){ $regPath=(''HKLM:\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\TLS {0}\\Server'' -f $protocol); $regValues=Get-ItemProperty -Path $regPath -ErrorAction SilentlyContinue; $enabledValue=$null; $disabledByDefault=$null; if($null -ne $regValues){ $enabledValue=$regValues.Enabled; $disabledByDefault=$regValues.DisabledByDefault }; $isEnabled=$false; if($null -ne $enabledValue){ if($enabledValue -ge 1){ $isEnabled=$true } } elseif($null -ne $disabledByDefault){ if($disabledByDefault -eq 0){ $isEnabled=$true } } else { if($osDefaults -contains $protocol){ $isEnabled=$true } }; if($isEnabled){ $enabled+=$protocol } }; $enabled -join '',''"' as `DataOut`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'TLS Version Check - Server');
```

### 3. Example Query

An example of a query with a group ID:

```sql
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'TLS Version Check - Server' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference=''SilentlyContinue''; $protocols=@(''1.0'',''1.1'',''1.2'',''1.3''); $enabled=@(); $osInfo=Get-CimInstance -ClassName ''Win32_OperatingSystem''; $osVersion=[version]$osInfo.Version; $osBuild=[int]$osInfo.BuildNumber; if($osVersion -lt [version]''6.2''){ $osDefaults=@(''1.0'') } elseif($osVersion -lt [version]''10.0''){ $osDefaults=@(''1.0'',''1.1'',''1.2'') } elseif($osBuild -ge 20348){ $osDefaults=@(''1.0'',''1.1'',''1.2'',''1.3'') } else { $osDefaults=@(''1.0'',''1.1'',''1.2'') }; foreach($protocol in $protocols){ $regPath=(''HKLM:\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\TLS {0}\\Server'' -f $protocol); $regValues=Get-ItemProperty -Path $regPath -ErrorAction SilentlyContinue; $enabledValue=$null; $disabledByDefault=$null; if($null -ne $regValues){ $enabledValue=$regValues.Enabled; $disabledByDefault=$regValues.DisabledByDefault }; $isEnabled=$false; if($null -ne $enabledValue){ if($enabledValue -ge 1){ $isEnabled=$true } } elseif($null -ne $disabledByDefault){ if($disabledByDefault -eq 0){ $isEnabled=$true } } else { if($osDefaults -contains $protocol){ $isEnabled=$true } }; if($isEnabled){ $enabled+=$protocol } }; $enabled -join '',''"' as `DataOut`,
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
WHERE m.groupid IN (950,955,853)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'TLS Version Check - Server');
```

### 4. Execute the Query

Now execute your query from a RAWSQL monitor set.

### 5. Locate Your Remote Monitor

Locate your remote monitor by opening the group(s) remote monitors tab.

## Changelog

### 2026-04-10

- Added TLS 1.3

### 2025-04-10

- Initial version of the document
