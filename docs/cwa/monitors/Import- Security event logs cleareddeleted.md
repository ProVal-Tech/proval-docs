---
id: '5e1d98fb-913a-4384-9674-653c57bf610b'
title: 'Import- Security event logs cleareddeleted'
title_meta: 'Import- Security event logs cleareddeleted'
keywords: ['remote', 'monitor', 'security', 'event', 'logs', 'setup']
description: 'This document provides a step-by-step guide to setting up a remote monitor for security event logs in ConnectWise Automate. It includes obtaining group IDs, constructing SQL queries, and applying alert templates for effective monitoring.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
---

## Step 1
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

## Step 2
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
 `groupid` as `GroupID`,
 '0' as `SearchID`,
 'Proval - Production - Security event logs cleared/deleted' as `Name`,
 '6' as `CheckAction`,
 '1' as `AlertAction`,
 'Security Event Log Cleared on %CLIENTNAME%\%COMPUTERNAME%~~~Security Event logs cleared/deleted for %CLIENTNAME%\%COMPUTERNAME%: %Result%!!!Security Event Log Cleared on %CLIENTNAME%\%COMPUTERNAME%~~~Security Event logs cleared/deleted for %CLIENTNAME%\%COMPUTERNAME%: %Result%' as `AlertMessage`,
 '0' as `ContactID`,
 '900' as `interval`,
 '127.0.0.1' as `Where`,
 '7' as `What`,
 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command \"$op = @(); $op = ((Get-Eventlog security -erroraction silentlycontinue -After (Get-Date).AddMinutes(-15) -InstanceId 1102 | select-object timewritten,message)|foreach-object{$_.timewritten;($_.message -split /'Additional Information:/'|select -first 1)-split /'Account Name:/'|select-object -last 1}); if ($op) { write-output /\"`nEventid 1102 detected in the last 15 Minutes:`n/\"; $op}\"' as `DataOut`,
 '16' as `Comparor`,
 '10|((^((OK){0,}(\r\n){0,}[\r\n]{0,}\s{0,})$)%7C(^$))|11|((^((OK){0,}(\r\n){0,}[\r\n]{0,}\s{0,})$)%7C(^$))%7C(^((\r\n){0,}[\r\n]{0,}\s{0,})Eventid 1102 detected in the last 15 Minutes:)|10|^((\r\n){0,}[\r\n]{0,}\s{0,})Eventid 1102 detected in the last 15 Minutes:' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'Proval - Production - Security event logs cleared/deleted')
```

## Step 3
An example of a query with group IDs:

```
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
 `groupid` as `GroupID`,
 '0' as `SearchID`,
 'Proval - Production - Security event logs cleared/deleted' as `Name`,
 '6' as `CheckAction`,
 '1' as `AlertAction`,
 'Security Event Log Cleared on %CLIENTNAME%\%COMPUTERNAME%~~~Security Event logs cleared/deleted for %CLIENTNAME%\%COMPUTERNAME%: %Result%!!!Security Event Log Cleared on %CLIENTNAME%\%COMPUTERNAME%~~~Security Event logs cleared/deleted for %CLIENTNAME%\%COMPUTERNAME%: %Result%' as `AlertMessage`,
 '0' as `ContactID`,
 '900' as `interval`,
 '127.0.0.1' as `Where`,
 '7' as `What`,
 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command \"$op = @(); $op = ((Get-Eventlog security -erroraction silentlycontinue -After (Get-Date).AddMinutes(-15) -InstanceId 1102 | select-object timewritten,message)|foreach-object{$_.timewritten;($_.message -split /'Additional Information:/'|select -first 1)-split /'Account Name:/'|select-object -last 1}); if ($op) { write-output /\"`nEventid 1102 detected in the last 15 Minutes:`n/\"; $op}\"' as `DataOut`,
 '16' as `Comparor`,
 '10|((^((OK){0,}(\r\n){0,}[\r\n]{0,}\s{0,})$)%7C(^$))|11|((^((OK){0,}(\r\n){0,}[\r\n]{0,}\s{0,})$)%7C(^$))%7C(^((\r\n){0,}[\r\n]{0,}\s{0,})Eventid 1102 detected in the last 15 Minutes:)|10|^((\r\n){0,}[\r\n]{0,}\s{0,})Eventid 1102 detected in the last 15 Minutes:' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'Proval - Production - Security event logs cleared/deleted')
```

## Step 4
Now execute your query from a RAWSQL monitor set.

## Step 5
Locate your remote monitor by opening the group(s) remote monitors tab.

## Step 6
Limit the remote monitor to a search, if necessary.

## Step 7
Apply the appropriate alert template to the remote monitors.


