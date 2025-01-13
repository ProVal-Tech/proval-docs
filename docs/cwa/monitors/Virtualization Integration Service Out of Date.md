---
id: 'vsa-integration-service-monitor-setup'
title: 'Integration Service Monitor Setup for Hyper-V'
title_meta: 'Integration Service Monitor Setup for Hyper-V'
keywords: ['hyper-v', 'monitor', 'integration', 'service', 'setup']
description: 'This document provides a step-by-step guide on setting up an Integration Service Monitor for Hyper-V environments. Learn how to obtain group IDs, modify SQL queries, and apply alert templates to ensure your virtual machines are monitored effectively.'
tags: ['monitoring', 'setup', 'alert', 'database', 'windows']
draft: false
unlisted: false
---
## Implementation

1. **Obtain the groupid(s)** of the group(s) that the remote monitor should be applied to.

2. **Copy the following query** and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Groupid(s) of the relevant groups:  
   (The string to replace can be found at the very bottom of the query, right after **WHERE**)

   ```
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - Hyper-V - Integration Service Out of Date' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   'Integration Service Out of Date on %CLIENTNAME%\\%COMPUTERNAME%~~~ %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!Integration Service Out of Date on %CLIENTNAME%\\%COMPUTERNAME%~~~%STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
   '0' as `ContactID`,
   '86400' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\system32\\cmd.exe /c powershell.exe "try{ Get-VM | Where-Object {($_.IntegrationServicesState -eq \'Update required\')} | Foreach-Object {Write-Host \"$($_.Name) IntegrationServicesState: $($_.IntegrationServicesState)\"}} catch {}"' as `DataOut`,
   '9' as `Comparor`,
   'IntegrationServicesState:' as `DataIn`,
   '' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '21' as `Category`,
   '0' as `TicketCategory`,
   '0' as `ScriptTarget`,
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
   WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
   AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Hyper-V - Integration Service Out of Date')
   ```

3. **An example of a query with a groupid:**

   ```
   INSERT INTO groupagents 
   SELECT '' as `AgentID`,
   `groupid` as `GroupID`,
   '0' as `SearchID`,
   'ProVal - Production - Hyper-V - Integration Service Out of Date' as `Name`,
   '6' as `CheckAction`,
   '1' as `AlertAction`,
   'Integration Service Out of Date on %CLIENTNAME%\\%COMPUTERNAME%~~~ %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!Integration Service Out of Date on %CLIENTNAME%\\%COMPUTERNAME%~~~%STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
   '0' as `ContactID`,
   '86400' as `interval`,
   '127.0.0.1' as `Where`,
   '7' as `What`,
   'C:\\Windows\\system32\\cmd.exe /c powershell.exe "try{ Get-VM | Where-Object {($_.IntegrationServicesState -eq \'Update required\')} | Foreach-Object {Write-Host \"$($_.Name) IntegrationServicesState: $($_.IntegrationServicesState)\"}} catch {}"' as `DataOut`,
   '9' as `Comparor`,
   'IntegrationServicesState:' as `DataIn`,
   '' as `IDField`,
   '1' as `AlertStyle`,
   '0' as `ScriptID`,
   '' as `datacollector`,
   '21' as `Category`,
   '0' as `TicketCategory`,
   '0' as `ScriptTarget`,
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
   WHERE m.groupid IN (1766)
   AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Hyper-V - Integration Service Out of Date')
   ```

4. **Locate your remote monitor** by opening the group(s) remote monitors tab, then apply the appropriate alert template.


