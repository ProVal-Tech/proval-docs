---
id: 'cwa-implementation-disable-update-orchestrator-service'
title: 'Implementation of Remote Monitor for Disabling Update Orchestrator Service'
title_meta: 'Implementation of Remote Monitor for Disabling Update Orchestrator Service'
keywords: ['implementation', 'remote', 'monitor', 'disable', 'update', 'orchestrator', 'service']
description: 'This document outlines the steps to implement a remote monitor in ConnectWise Automate that disables the Update Orchestrator Service. It includes obtaining group IDs, crafting SQL queries, and applying alert templates.'
tags: ['configuration', 'alert', 'sql', 'service', 'monitoring']
draft: false
unlisted: false
---
## Implementation

### Step 1.
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

### Step 2.
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Groupid(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Disable Update Orchestrator Service [Change]' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Update Orchestrator Service Failed to Disable at %computername%~~~Update Orchestrator Service successfully %Result% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%.!!!Update Orchestrator Service Failed to Disable at %computername%~~~Update Orchestrator Service Failed to Disable on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% with result sevice is: %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'300' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = \'SilentlyContinue\';$ServiceName = \'UsoSvc\';$service = Get-Service -Name $ServiceName;if ($service.Status -eq \'Running\') {Stop-Service -Name $ServiceName -Force;$service = Get-Service -Name $ServiceName;if ($service.Status -eq \'Running\') {return \'Running\'}else {Set-Service -Name $ServiceName -StartupType Disabled -Confirm:$false;$service = Get-Service -Name $ServiceName;if ($service.StartType -eq \'Disabled\') { return \'Disabled and Stopped\'}else {return \'Stopped\'}}}"' as `DataOut`,
'9' as `Comparor`,
'Running' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'5' as `Category`,
'0' as `TicketCategory`,
'0' as `ScriptTarget`,
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
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Disable Update Orchestrator Service [Change]')
```

### Step 3.
An example of a query with a groupid:

```
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Production - Disable Update Orchestrator Service [Change]' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Update Orchestrator Service Failed to Disable at %computername%~~~Update Orchestrator Service successfully %Result% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%.!!!Update Orchestrator Service Failed to Disable at %computername%~~~Update Orchestrator Service Failed to Disable on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% with result sevice is: %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'300' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = \'SilentlyContinue\';$ServiceName = \'UsoSvc\';$service = Get-Service -Name $ServiceName;if ($service.Status -eq \'Running\') {Stop-Service -Name $ServiceName -Force;$service = Get-Service -Name $ServiceName;if ($service.Status -eq \'Running\') {return \'Running\'}else {Set-Service -Name $ServiceName -StartupType Disabled -Confirm:$false;$service = Get-Service -Name $ServiceName;if ($service.StartType -eq \'Disabled\') { return \'Disabled and Stopped\'}else {return \'Stopped\'}}}"' as `DataOut`,
'9' as `Comparor`,
'Running' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'5' as `Category`,
'0' as `TicketCategory`,
'0' as `ScriptTarget`,
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
WHERE m.groupid IN (1766)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Disable Update Orchestrator Service [Change]')
```

### Step 4.
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.


