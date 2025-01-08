---
id: 'cwa-windows-cluster-shared-volume-detection'
title: 'Windows Cluster Shared Volume Detection'
title_meta: 'Windows Cluster Shared Volume Detection'
keywords: ['windows', 'cluster', 'shared', 'volume', 'detection', 'monitoring']
description: 'This document provides a step-by-step guide for implementing a Windows Cluster Shared Volume Detection monitor in ConnectWise Automate. It includes instructions for obtaining group IDs, executing SQL queries, and validating monitor settings to ensure proper functionality.'
tags: ['monitoring', 'setup', 'sql', 'windows', 'alert']
draft: false
unlisted: false
---
## Implementation

1. Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

2. Copy the following query and execute it as a RAWSQL directly:

   ```
   SET @TicketCategorySet = 0;
   SET @DefaultCreateTicket = (SELECT alertactionid FROM alerttemplate WHERE NAME = 'Default - Do Nothing');
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '' as `SearchID`,
   'Windows Cluster Shared Volume Detection' as `Name`,
   '6' as `CheckAction`,
   @DefaultCreateTicket as `AlertAction`,
   'Windows Cluster Shared Volume - Free Space Under 10 Percent at %computername%~~~Windows Cluster Shared Volume - Free Space Above 10 Percent at %computername%/%clientname%!!!Windows Cluster Shared Volume - Free Space Under 10 Percent at %computername%~~~Windows Cluster Shared Volume - Free Space Under 10 Percent at %computername%/%clientname%' as `AlertMessage`,
   '0' as `ContactID`,
   '3600' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference = ''SilentlyContinue'';$diskStatuses = @();Get-ClusterSharedVolume | ForEach-Object {$freeSpacePercent = [math]::Round((($_.SharedVolumeInfo.Partition.FreeSpace) / ($_.SharedVolumeInfo.Partition.Size) * 100), 2);if ($freeSpacePercent -lt 10) {$diskStatuses += ''Failed''} elseif ($freeSpacePercent -ge 10 -and $freeSpacePercent -le 20) {$diskStatuses += ''Warning''} else {$diskStatuses += ''Success''}};if ($diskStatuses -contains ''Failed'') {''Failed''} elseif ($diskStatuses -contains ''Warning'') {''Warning''} else {''Success''}"' as `DataOut`,
   '16' as `Comparor`,
   '10|(^(\\r\\n%7COK%7CSuccess))|5|Warning|5|Failed' as `DataIn`,
   '' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '19' as `Category`,
   '0' as `TicketCategory`,
   @TicketCategorySet as `ScriptTarget`,
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
   WHERE m.groupid IN (SELECT groupid FROM mastergroups WHERE NAME = 'Cluster Detected')
   AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'Windows Cluster Shared Volume Detection')
   ```

3. Now execute your query from an RAWSQL monitor set.
   - Once the query is executed, reload the system cache
     - ![Image](5078775/docs/15952816/images/23244840)

4. Re-open the group where the monitor is created (It should be the `Cluster Detected` group)
   - Validate that the monitor is limited to the search 'Windows 10/11 Machines'
   - Apply the alert template: `△ CUSTOM - Execute Script - Windows Cluster Shared Volume`

