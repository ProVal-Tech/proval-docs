---
id: '1b34e236-7235-4dc1-b4d2-fdd120e75f47'
slug: /1b34e236-7235-4dc1-b4d2-fdd120e75f47
title: 'Import- Backup Exec - No successful backups in 3 days'
title_meta: 'Import- Backup Exec - No successful backups in 3 days'
keywords: ['remote', 'monitor', 'backup', 'query', 'groupid']
description: 'This document outlines the steps needed to apply a remote monitor for backup alerts in ConnectWise Automate. It includes obtaining group IDs, constructing SQL queries, and executing them to set up monitoring effectively.'
tags: ['backup', 'database']
draft: false
unlisted: false
---

## Steps to Apply Remote Monitor

### 1. Obtain Group ID(s)
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### 2. Construct SQL Query
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'Backup Exec - No successful backups in 3 days' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Backup Exec - No successful backups in 3 days - %ComputerName%~~~Successful backup job detected.!!!Backup Exec - No successful backups in 3 days - %ComputerName%~~~A successful backup job is not detected on %computername% in 3 days. Please investigate.' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference = \'SilentlyContinue\'; $StartTime= (Get-Date).AddDays(-3); $EndTime= (Get-Date); if(Get-winevent -erroraction silentlycontinue -FilterHashtable @{logname=\'Application\'; id=34112; ProviderName = \'Backup Exec\'; StartTime = $StartTime; EndTime = $EndTime} ) { return \'Good\' } Else {return \'Problematic\'}"' as `DataOut`,
'9' as `Comparor`,
'Problematic' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
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
```

```
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'Backup Exec - No successful backups in 3 days');
```

### 3. Example Query
An example of a query with a group ID:

```sql
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'Backup Exec - No successful backups in 3 days' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Backup Exec - No successful backups in 3 days - %ComputerName%~~~Successful backup job detected.!!!Backup Exec - No successful backups in 3 days - %ComputerName%~~~A successful backup job is not detected on %computername% in 3 days. Please investigate.' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference = \'SilentlyContinue\'; $StartTime= (Get-Date).AddDays(-3); $EndTime= (Get-Date); if(Get-winevent -erroraction silentlycontinue -FilterHashtable @{logname=\'Application\'; id=34112; ProviderName = \'Backup Exec\'; StartTime = $StartTime; EndTime = $EndTime} ) { return \'Good\' } Else {return \'Problematic\'}"' as `DataOut`,
'9' as `Comparor`,
'Problematic' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (12)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'Backup Exec - No successful backups in 3 days');
```

### 4. Execute Your Query
Now execute your query from a RAWSQL monitor set.

### 5. Locate Your Remote Monitor
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.