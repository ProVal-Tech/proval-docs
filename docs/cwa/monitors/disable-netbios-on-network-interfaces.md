---
id: '7cd56a9d-67d5-4d67-a8bf-f61497a93059'
slug: /7cd56a9d-67d5-4d67-a8bf-f61497a93059
title: 'Disable Netbios on Network Interfaces'
title_meta: 'Disable Netbios on Network Interfaces'
keywords: ['netbios', 'remote', 'monitor', 'windows', 'network']
description: 'This document provides a guide on how to implement a remote monitor that disables NetBIOS on all network interfaces for Windows operating systems. It includes details on alert styles, ticketing, and the import process.'
tags: ['networking', 'windows']
draft: false
unlisted: false
---

## Summary

This remote monitor disables NetBIOS on all network interfaces.

## Details

**Suggested "Limit to"**: Windows OS  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

| Check Action | Server Address | Check Type | Execute Info | Comparator         | Interval | Result         |
|--------------|----------------|------------|---------------|---------------------|----------|----------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Does not Contain    | 21600    | Failed to Set  |

## Target

Windows OS

## Ticketing

**Subject:** `Failed to Disable NetBIOS on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME%`

**Success Body:** `NetBIOS has been disabled on all Network Interfaces`  

**Failure Body:** `Failed to Set NetBIOS on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.`

## How To Import


### Step 1
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

---

### Step 2
Copy the following query and replace 'YOUR COMMA SEPARATED LIST OF GROUPID(S)' with the Groupid(s) of the relevant groups:
(The string to replace can be found at the very bottom of the query, right after `WHERE`)

```sql
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Dev - Disable Netbios on Network Interfaces' as `Name`,
'6' as `CheckAction`,
'172' as `AlertAction`,
'Failed to Disable NetBios on on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%~~~Netbios has been disabled on all Network Interfaces!!!Failed to Disable NetBios on on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%~~~Failed to Set Netbios on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'21600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command ";$path = \'HKLM:\\SYSTEM\\CurrentControlSet\\Services\\netbt\\Parameters\\interfaces\'; $Paths = Get-ChildItem $path -ErrorAction SilentlyContinue; if ( $paths ) {$paths | ForEach-Object {try{ Set-ItemProperty -Path \\"$path\\$_.pschildname\\" -name NetBiosOptions -value 2 -ErrorAction Stop} catch {Write-Output \\"Failed to Set \'$path\\$_.pschildname\'. Reason: $($Error[0].Exception.Message)\\"}}} "' as `DataOut`,
'9' as `Comparor`,
'Failed to Set' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Disable Netbios on Network Interfaces')
```
---

### Step 3
An example of a query with a groupid:

```sql
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'0' as `SearchID`,
'ProVal - Dev - Disable Netbios on Network Interfaces' as `Name`,
'6' as `CheckAction`,
'172' as `AlertAction`,
'Failed to Disable NetBios on on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%~~~Netbios has been disabled on all Network Interfaces!!!Failed to Disable NetBios on on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%~~~Failed to Set Netbios on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'21600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command ";$path = \'HKLM:\\SYSTEM\\CurrentControlSet\\Services\\netbt\\Parameters\\interfaces\'; $Paths = Get-ChildItem $path -ErrorAction SilentlyContinue; if ( $paths ) {$paths | ForEach-Object {try{ Set-ItemProperty -Path \\"$path\\$_.pschildname\\" -name NetBiosOptions -value 2 -ErrorAction Stop} catch {Write-Output \\"Failed to Set \'$path\\$_.pschildname\'. Reason: $($Error[0].Exception.Message)\\"}}} "' as `DataOut`,
'9' as `Comparor`,
'Failed to Set' as `DataIn`,
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
WHERE m.groupid IN (2,188)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Disable Netbios on Network)
```
---

### Step 4
Now execute your query from a RAWSQL monitor set.

---

### Step 5
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.

---