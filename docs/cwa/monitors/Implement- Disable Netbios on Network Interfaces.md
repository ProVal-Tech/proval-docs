---
id: '8b17d0e6-9d6d-44b5-96c0-5c5c0e68bf89'
title: 'Implementation Steps for Disabling NetBIOS on Network Interfaces'
title_meta: 'Implementation Steps for Disabling NetBIOS on Network Interfaces'
keywords: ['netbios', 'monitor', 'query', 'database', 'network']
description: 'This document provides a step-by-step guide for implementing a remote monitor that disables NetBIOS on network interfaces. It includes instructions for obtaining group IDs, constructing SQL queries, and applying alert templates in ConnectWise Automate.'
tags: ['database']
draft: false
unlisted: false
---

## Implementation Steps

1. Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

2. Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups:
   (The string to replace can be found at the very bottom of the query, right after **WHERE**)

   ```sql
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Dev - Disable Netbios on Network Interfaces' as `Name`,
   '6' as `CheckAction`,
   '172' as `AlertAction`,
   'Failed to Disable NetBios on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME%~~~Netbios has been disabled on all Network Interfaces!!!Failed to Disable NetBios on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME%~~~Failed to Set Netbios on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
   '0' as `ContactID`,
   '21600' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command ";$path = /'HKLM://SYSTEM//CurrentControlSet//Services//netbt//Parameters//interfaces/'; $Paths = Get-ChildItem $path -ErrorAction SilentlyContinue; if ($paths) {$paths | ForEach-Object {try{ Set-ItemProperty -Path \"//$path//$_.pschildname//\" -name NetBiosOptions -value 2 -ErrorAction Stop} catch {Write-Output \"Failed to Set /'$path//$_.pschildname/'. Reason: $($Error[0].Exception.Message)\"}}}"' as `DataOut`,
   '9' as `Comparor`,
   'Failed to Set' as `DataIn`,
   '' as `IDField`,
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
   AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Disable Netbios on Network Interfaces')
   ```

3. An example of a query with a group ID:

   ```sql
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Dev - Disable Netbios on Network Interfaces' as `Name`,
   '6' as `CheckAction`,
   '172' as `AlertAction`,
   'Failed to Disable NetBios on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME%~~~Netbios has been disabled on all Network Interfaces!!!Failed to Disable NetBios on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME%~~~Failed to Set Netbios on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
   '0' as `ContactID`,
   '21600' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command ";$path = /'HKLM://SYSTEM//CurrentControlSet//Services//netbt//Parameters//interfaces/'; $Paths = Get-ChildItem $path -ErrorAction SilentlyContinue; if ($paths) {$paths | ForEach-Object {try{ Set-ItemProperty -Path \"//$path//$_.pschildname//\" -name NetBiosOptions -value 2 -ErrorAction Stop} catch {Write-Output \"Failed to Set /'$path//$_.pschildname/'. Reason: $($Error[0].Exception.Message)\"}}}"' as `DataOut`,
   '9' as `Comparor`,
   'Failed to Set' as `DataIn`,
   '' as `IDField`,
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
   WHERE m.groupid IN (2,188)
   AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Dev - Disable Netbios on Network Interfaces')
   ```

4. Now execute your query from a RAWSQL monitor set.

5. Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.
