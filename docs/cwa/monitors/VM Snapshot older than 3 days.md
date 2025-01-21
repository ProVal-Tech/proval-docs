---
id: 'faf8b7d6-6685-43be-a223-0c6ce7195147'
title: 'Hyper-V Snapshot Age Monitoring'
title_meta: 'Hyper-V Snapshot Age Monitoring'
keywords: ['hyper-v', 'snapshot', 'monitoring', 'database', 'alert']
description: 'This document outlines the implementation steps for monitoring Hyper-V snapshot age using a SQL query. It provides a detailed SQL command to insert monitoring agents and instructions for applying the alert template in the ConnectWise Automate environment.'
tags: ['database', 'hyper-v']
draft: false
unlisted: false
---

## Implementation

1. **Execute the following query from a `RAWSQL` monitor set.**

   ```sql
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - HyperV - Snapshot Age > 3 Days' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   'HyperV - Aging Snapshot Detected on %COMPUTERNAME%~~~Aging Snapshots are not detected anymore.!!!HyperV - Aging Snapshot Detected on %COMPUTERNAME%~~~The Hyper-V Host, %COMPUTERNAME%, has detected a VM snapshot that has an age of 3 days or older. It is important to delete unneeded snapshots since they can cause the server to use extra space over time. Please review the details below and remove the snapshot if it is no longer needed.' as `AlertMessage`,
   '0' as `ContactID`,
   '86400' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command \"$X = 3;Get-VM | Get-VMSnapshot | Where-Object { $_.creationTime -le (Get-Date).AddDays(-$X) -and $_.IsDeleted -eq $false } | Select-Object -Property VMName, Name, ParentSnapshotName, SnapshotType, CreationTime | Format-List\"' as `DataOut`,
   '16' as `Comparor`,
   '10|((^((OK){0,}(//r//n){0,}[//r//n]{0,}//s{0,})$)%7C(^$))|11|((^((OK){0,}(//r//n){0,}[//r//n]{0,}//s{0,})$)%7C(^$))%7C(^((//r//n){0,}[//r//n]{0,}//s{0,})VMName)|10|^((//r//n){0,}[//r//n]{0,}//s{0,})VMName' as `DataIn`,
   '' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '16' as `Category`,
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
   WHERE m.groupid = (SELECT MIN(groupid) FROM mastergroups WHERE `FullName` = 'Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows HyperV Host')
   AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - HyperV - Snapshot Age > 3 Days')
   ```

2. **Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.**

   **Group Path:** `Service Plans/Windows Servers/Server Roles/Windows Servers Core Services/Windows Hyper-V Host Group.`

