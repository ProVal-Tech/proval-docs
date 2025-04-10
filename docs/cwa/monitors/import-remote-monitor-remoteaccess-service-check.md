---
id: 'dd99f8a5-83f7-48a5-b8a9-ac68224e543a'
slug: /dd99f8a5-83f7-48a5-b8a9-ac68224e543a
title: 'Import - Remote Monitor - RemoteAccess Service Check'
title_meta: 'Import - Remote Monitor - RemoteAccess Service Check'
keywords: ['remote', 'access', 'service', 'check', 'setup', 'monitor']
description: 'This document outlines the steps necessary to set up a remote access service check within ConnectWise Automate, including obtaining group IDs, executing SQL queries, and applying alert templates for effective monitoring.'
tags: ['database', 'setup']
draft: false
unlisted: false
---

## Implementation Steps

1. Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

2. Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the managed Windows groups for workstations and servers.  
   (The string to replace can be found at the very bottom of the query, right after **WHERE**)

   ```sql
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Development - RemoteAccess Service Check' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   '%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
   '0' as `ContactID`,
   '300' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = \'SilentlyContinue\';$result = Get-Service -Name \'RemoteAccess\' | Select-Object -ExpandProperty Status; if($result -eq \'Running\'){return \'Service Running\' } else {Set-Service -Name \'RemoteAccess\' -StartupType Automatic; $result = Get-Service -Name \'RemoteAccess\' | Select-Object -ExpandProperty Starttype; if($result -eq \'Automatic\'){Start-Service -Name \'RemoteAccess\'; $result = Get-Service -Name \'RemoteAccess\' | Select-Object -ExpandProperty Status;if($result -eq \'Running\'){return \'Service Running\'} else{return \'Service not Starting\'}} else {return \'Service Not Starting\'} }"' as `DataOut`,
   '1' as `Comparor`,
   'Service Running' as `DataIn`,
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
   AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Development - RemoteAccess Service Check')
   ```

3. An example of a query with a group ID:

   ```sql
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Development - RemoteAccess Service Check' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   '%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
   '0' as `ContactID`,
   '300' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = \'SilentlyContinue\';$result = Get-Service -Name \'RemoteAccess\' | Select-Object -ExpandProperty Status; if($result -eq \'Running\'){return \'Service Running\' } else {Set-Service -Name \'RemoteAccess\' -StartupType Automatic; $result = Get-Service -Name \'RemoteAccess\' | Select-Object -ExpandProperty Starttype; if($result -eq \'Automatic\'){Start-Service -Name \'RemoteAccess\'; $result = Get-Service -Name \'RemoteAccess\' | Select-Object -ExpandProperty Status;if($result -eq \'Running\'){return \'Service Running\'} else{return \'Service not Starting\'}} else {return \'Service Not Starting\'} }"' as `DataOut`,
   '1' as `Comparor`,
   'Service Running' as `DataIn`,
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
   WHERE m.groupid IN (1231,1624)
   AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Development - RemoteAccess Service Check')
   ```

4. Now execute your query from a RAWSQL monitor set.

5. Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.