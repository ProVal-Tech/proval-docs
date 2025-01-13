---
id: 'cwa-implementation-steps-uninstall-anydesk'
title: 'Implementation Steps for Uninstalling Anydesk'
title_meta: 'Implementation Steps for Uninstalling Anydesk'
keywords: ['uninstall', 'anydesk', 'monitor', 'groupid', 'query']
description: 'This document outlines the steps to implement a remote monitor for uninstalling Anydesk from specified groups using SQL queries. It provides detailed instructions on obtaining group IDs, constructing the SQL query, and executing it within a RAWSQL monitor set.'
tags: ['configuration', 'software', 'uninstallation', 'alert', 'monitoring']
draft: false
unlisted: false
---
## Implementation Steps

1. Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

2. Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Groupid(s) of the relevant groups:
   (The string to replace can be found at the very bottom of the query, right after **WHERE**)

   ```
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - Uninstall Anydesk' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   'Anydesk Removal Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Anydesk has been successfully removed.!!!Anydesk Removal Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Failed to remove Anydesk on %CLIENTNAME%\\%COMPUTERNAME%' as `AlertMessage`,
   '0' as `ContactID`,
   '3600' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$US = (Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -Match \'Anydesk\' }).Displayicon;if($US) { foreach ($U in $US) {try{cmd.exe /c $U --silent --remove} catch {return \'Failed to remove\'} }}"' as `DataOut`,
   '16' as `Comparor`,
   '10|^(()%7C %7C(OK)%7C(\\r\\n))$|11|(Failed to remove)%7C(^(()%7C %7C(OK)%7C(\\r\\n))$)|10|(Failed to remove)' as `DataIn`,
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
   AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Uninstall Anydesk')
   ```

3. An example of a query with a groupid:
   ```
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - Uninstall Anydesk' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   'Anydesk Removal Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Anydesk has been successfully removed.!!!Anydesk Removal Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Failed to remove Anydesk on %CLIENTNAME%\\%COMPUTERNAME%' as `AlertMessage`,
   '0' as `ContactID`,
   '3600' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$US = (Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -Match \'Anydesk\' }).Displayicon;if($US) { foreach ($U in $US) {try{cmd.exe /c $U --silent --remove} catch {return \'Failed to remove\'} }}"' as `DataOut`,
   '16' as `Comparor`,
   '10|^(()%7C %7C(OK)%7C(\\r\\n))$|11|(Failed to remove)%7C(^(()%7C %7C(OK)%7C(\\r\\n))$)|10|(Failed to remove)' as `DataIn`,
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
   WHERE m.groupid IN (3,155)
   AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Uninstall Anydesk')
   ```

4. Now execute your query from a RAWSQL monitor set.

5. Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.


