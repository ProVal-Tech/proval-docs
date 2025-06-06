---
id: 'f201b6f8-2844-484b-b3f8-79e1fd76e819'
slug: /f201b6f8-2844-484b-b3f8-79e1fd76e819
title: 'Import - Remote Monitor - Hyper-V Replication Status'
title_meta: 'Import - Remote Monitor - Hyper-V Replication Status'
keywords: ['hyper-v', 'replication', 'monitoring', 'alerts', 'troubleshooting']
description: 'This document provides a detailed guide on implementing monitoring for Hyper-V replication status within your environment. It includes SQL queries for setting up alerts, troubleshooting steps for replication issues, and examples to ensure proper configuration.'
tags: ['sql', 'virtualization']
draft: false
unlisted: false
---

## Implementation

1. Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the GroupID(s) of the relevant groups:  
   (The string to replace can be found at the very bottom of the query, right after **WHERE**)

   ```sql
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - Hyper-V Replication Status' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   'Hyper-V Replication Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~The issue with the Hyper-V Replication is resolved.!!!Hyper-V Replication Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Replication state of each problematic VM is outlined below:\n\n\r\n\r\n%RESULT%\r\n\r\n\n\nIt indicates that there is an issue with the replication process or with the replication target. Here are some basic troubleshooting steps that can help to address these issues:\r\n\n1. Check the replication settings: Ensure that the replication settings are configured correctly and that they are enabled for the virtual machine. Also, check that the replication target is configured correctly and is accessible.\n\r\n2. Check the replication network: Ensure that the replication network is functioning properly and that there are no issues with connectivity or bandwidth. Verify that firewalls and other security measures are not blocking replication traffic.\n\r\n3. Check the health of the virtual machine: Check the health of the virtual machine to ensure that it is not experiencing any issues that could affect replication. This includes checking for storage or network issues, as well as any errors or warnings in the virtual machine logs.\n\r\n4. Check the replication logs: Review the replication logs to identify any errors or warnings that could be causing the replication state to show as "Critical" or "Warning". This can help to pinpoint the source of the issue and guide further troubleshooting steps.\r\n\n5. Restart the replication process: Try restarting the replication process to see if this resolves the issue. This can be done by stopping and starting the replication services or by disabling and re-enabling replication for the virtual machine.' as `AlertMessage`,
   '0' as `ContactID`,
   '3600' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; Get-VMReplication | Where-Object {($_.health -like \'Critical\') -or ($_.health -like \'Warning\')} | Foreach-Object {Write-Output \\"$($_.name) replication state: $($_.health)\\"}"' as `DataOut`,
   '9' as `Comparor`,
   'replication state:' as `DataIn`,
   '' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '16' as `Category`,
   '0' as `TicketCategory`,
   '0' as `ScriptTarget`,
   UUID() as `GUID`,
   'root' as `UpdatedBy`,
   (NOW()) as `UpdateDate`
   FROM mastergroups m
   WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
   AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Hyper-V Replication Status')
   ```

2. An example of a query with a groupid:

   ```sql
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - Hyper-V Replication Status' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   'Hyper-V Replication Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~The issue with the Hyper-V Replication is resolved.!!!Hyper-V Replication Failed on %CLIENTNAME%\\%COMPUTERNAME%~~~Replication state of each problematic VM is outlined below:\n\n\r\n\r\n%RESULT%\r\n\r\n\n\nIt indicates that there is an issue with the replication process or with the replication target. Here are some basic troubleshooting steps that can help to address these issues:\r\n\n1. Check the replication settings: Ensure that the replication settings are configured correctly and that they are enabled for the virtual machine. Also, check that the replication target is configured correctly and is accessible.\n\r\n2. Check the replication network: Ensure that the replication network is functioning properly and that there are no issues with connectivity or bandwidth. Verify that firewalls and other security measures are not blocking replication traffic.\n\r\n3. Check the health of the virtual machine: Check the health of the virtual machine to ensure that it is not experiencing any issues that could affect replication. This includes checking for storage or network issues, as well as any errors or warnings in the virtual machine logs.\n\r\n4. Check the replication logs: Review the replication logs to identify any errors or warnings that could be causing the replication state to show as "Critical" or "Warning". This can help to pinpoint the source of the issue and guide further troubleshooting steps.\r\n\n5. Restart the replication process: Try restarting the replication process to see if this resolves the issue. This can be done by stopping and starting the replication services or by disabling and re-enabling replication for the virtual machine.' as `AlertMessage`,
   '0' as `ContactID`,
   '3600' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; Get-VMReplication | Where-Object {($_.health -like \'Critical\') -or ($_.health -like \'Warning\')} | Foreach-Object {Write-Output \\"$($_.name) replication state: $($_.health)\\"}"' as `DataOut`,
   '9' as `Comparor`,
   'replication state:' as `DataIn`,
   '' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '16' as `Category`,
   '0' as `TicketCategory`,
   '0' as `ScriptTarget`,
   UUID() as `GUID`,
   'root' as `UpdatedBy`,
   (NOW()) as `UpdateDate`
   FROM mastergroups m
   WHERE m.groupid IN (1766)
   AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Hyper-V Replication Status')
   ```

3. Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.