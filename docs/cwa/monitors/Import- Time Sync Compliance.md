---
id: 'd0b9c0fa-fe52-412b-a4b9-dee96f9ff58b'
slug: /d0b9c0fa-fe52-412b-a4b9-dee96f9ff58b
title: 'Import- Time Sync Compliance'
title_meta: 'Import- Time Sync Compliance'
keywords: ['ticket', 'creation', 'monitor', 'query', 'alert', 'template']
description: 'This document outlines the steps required for creating a ticket in ConnectWise Automate, including necessary scripts, obtaining group IDs, and executing SQL queries for remote monitors.'
tags: ['database']
draft: false
unlisted: false
---

## Steps for Ticket Creation

### 1.
Ensure the presence of the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script and the `△ Custom - Ticket Creation - Computer` alert template.

---

### 2.
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

---

### 3.
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Production - Time Sync Compliance' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  'Time Sync Compliance Failed - %ComputerName%~~~Successfully synced time.!!!Time Sync Compliance Failed - %ComputerName%~~~Time Sync Compliance failed for %ComputerName%. \r\n\r\nReason: \r\n%RESULT%' as `AlertMessage`,
  '0' as `ContactID`,
  '86400' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$S = \'W32Time\';$peerList = \'us.pool.ntp.org\';$syncOutput = \'\';if ((Get-Service $S).Status -ne \'Running\') {Try {Start-Service $S -Confirm:$False -ErrorAction Stop | Out-Null}catch {return \\"Failed to start $S Service. Reason: $($Error.Exception.Message)\\"}};$syncOutput += w32tm /config /manualpeerlist:$peerList;Start-Sleep -Seconds 5;$syncOutput += \\"`n\\" + (W32tm /resync /force);if ($syncOutput -match \'The computer did not resync\') {return \'Failed: The computer did not resync.\'} else {return \'Success: The computer resynced successfully.\'}"' as `DataOut`,
  '11' as `Comparor`,
  '(The Computer did not resync)|(Failed to start)' as `DataIn`,
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
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Time Sync Compliance')
```

---

### 4.
An example of a query with a group ID:

```sql
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Production - Time Sync Compliance' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  'Time Sync Compliance Failed - %ComputerName%~~~Successfully synced time.!!!Time Sync Compliance Failed - %ComputerName%~~~Time Sync Compliance failed for %ComputerName%. \r\n\r\nReason: \r\n%RESULT%' as `AlertMessage`,
  '0' as `ContactID`,
  '86400' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$S = \'W32Time\';$peerList = \'us.pool.ntp.org\';$syncOutput = \'\';if ((Get-Service $S).Status -ne \'Running\') {Try {Start-Service $S -Confirm:$False -ErrorAction Stop | Out-Null}catch {return \\"Failed to start $S Service. Reason: $($Error.Exception.Message)\\"}};$syncOutput += w32tm /config /manualpeerlist:$peerList;Start-Sleep -Seconds 5;$syncOutput += \\"`n\\" + (W32tm /resync /force);if ($syncOutput -match \'The computer did not resync\') {return \'Failed: The computer did not resync.\'} else {return \'Success: The computer resynced successfully.\'}"' as `DataOut`,
  '11' as `Comparor`,
  '(The Computer did not resync)|(Failed to start)' as `DataIn`,
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
WHERE m.groupid IN (1622)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Time Sync Compliance')
```

---

### 5.
Now execute your query from a RAWSQL monitor set.

---

### 6.
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the `△ Custom - Ticket Creation - Computer` alert template.
