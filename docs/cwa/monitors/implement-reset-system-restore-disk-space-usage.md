---
id: 'dcfe094a-b15b-4f06-8c8f-c6e211c7f9b0'
slug: /dcfe094a-b15b-4f06-8c8f-c6e211c7f9b0
title: 'Implement- Reset System Restore Disk Space Usage'
title_meta: 'Implement- Reset System Restore Disk Space Usage'
keywords: ['implementation', 'remote', 'monitor', 'query', 'groupid']
description: 'This document provides detailed implementation steps for applying a remote monitor in a system. It includes obtaining group IDs, modifying SQL queries, and executing them to set up monitoring effectively.'
tags: ['database', 'setup']
draft: false
unlisted: false
---

## Implementation Steps

1. Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

2. Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Group ID(s) of the relevant groups:
   (The string to replace can be found at the very bottom of the query, right after **WHERE**)

   ```sql
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - Reset System Restore Disk Space Usage' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   'Failed to Reset System Restore Disk Space Usage on %CLIENTNAME%\\%COMPUTERNAME%~~~System Restore Disk Space Usage has been successfully updated.!!!Failed to Reset System Restore Disk Space Usage on %CLIENTNAME%\\%COMPUTERNAME%~~~Failed to Reset System Restore Disk Space Usage on %CLIENTNAME%\\%COMPUTERNAME%' as `AlertMessage`,
   '0' as `ContactID`,
   '21600' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\';$SysDrv=$env:SystemDrive;$allocatedSpace = (vssadmin list shadowstorage /on=$SysDrv | Select-String \'Maximum Shadow Copy\');if($allocatedSpace -match \'(\\d+(\\.\\d+)?)%\'){$allocatedSpacePercentage = [float]$matches[1]};if ($allocatedSpacePercentage -gt 25) {try{ & cmd /c \\"vssadmin resize shadowstorage /for=$SysDrv /on=$SysDrv /maxsize=5%\\"} catch {return \'Failed to reset\'} }"' as `DataOut`,
   '16' as `Comparor`,
   '10|^(()%7C %7C(OK)%7C(\\r\\n))$|11|(Failed to Reset)%7C(^(()%7C %7C(OK)%7C(\\r\\n))$)|10|(Failed to Reset)' as `DataIn`,
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
   AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Reset System Restore Disk Space Usage')
   ```

3. An example of a query with a group ID:
   ```sql
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - Reset System Restore Disk Space Usage' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   'Failed to Reset System Restore Disk Space Usage on %CLIENTNAME%\\%COMPUTERNAME%~~~System Restore Disk Space Usage has been successfully updated.!!!Failed to Reset System Restore Disk Space Usage on %CLIENTNAME%\\%COMPUTERNAME%~~~Failed to Reset System Restore Disk Space Usage on %CLIENTNAME%\\%COMPUTERNAME%' as `AlertMessage`,
   '0' as `ContactID`,
   '21600' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\';$SysDrv=$env:SystemDrive;$allocatedSpace = (vssadmin list shadowstorage /on=$SysDrv | Select-String \'Maximum Shadow Copy\');if($allocatedSpace -match \'(\\d+(\\.\\d+)?)%\'){$allocatedSpacePercentage = [float]$matches[1]};if ($allocatedSpacePercentage -gt 25) {try{ & cmd /c \\"vssadmin resize shadowstorage /for=$SysDrv /on=$SysDrv /maxsize=5%\\"} catch {return \'Failed to reset\'} }"' as `DataOut`,
   '16' as `Comparor`,
   '10|^(()%7C %7C(OK)%7C(\\r\\n))$|11|(Failed to Reset)%7C(^(()%7C %7C(OK)%7C(\\r\\n))$)|10|(Failed to Reset)' as `DataIn`,
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
   WHERE m.groupid IN (2,144)
   AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Reset System Restore Disk Space Usage')
   ```

4. Now execute your query from a RAWSQL monitor set.

5. Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.