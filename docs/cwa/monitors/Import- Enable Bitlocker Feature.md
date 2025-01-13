---
id: 'cwa-enable-bitlocker-feature'
title: 'Enable Bitlocker Feature for Groups'
title_meta: 'Enable Bitlocker Feature for Groups'
keywords: ['bitlocker', 'groupid', 'monitor', 'sql', 'feature']
description: 'This document provides a step-by-step guide on how to enable the Bitlocker feature for specific groups using SQL queries in ConnectWise Automate. It includes instructions on obtaining group IDs, modifying the SQL query, and executing it to apply the remote monitor settings.'
tags: ['configuration', 'security', 'database', 'windows', 'monitoring']
draft: false
unlisted: false
---
## Step 1
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

## Step 2
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Groupid(s) of the relevant groups:  
*(The string to replace can be found at the very bottom of the query, right after WHERE)*

```sql
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Production - Enable Bitlocker Feature' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  '%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
  '0' as `ContactID`,
  '21600' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$RS=\'RSAT-Feature-Tools-BitLocker\',\'RSAT-Feature-Tools-BitLocker-RemoteAdminTool\',\'RSAT-Feature-Tools-BitLocker-BdeAducExt\';Foreach($r in $RS){if (((Get-WindowsFeature -Name $r).InstallState) -ne \'Installed\') {try{Install-WindowsFeature -Name $r -erroraction Stop 3>&1 1>$null}catch{return \'Failed\'}}}"' as `DataOut`,
  '16' as `Comparor`,
  '10|^(()%7C %7C(OK)%7C(\\r\\n))$|11|^(()%7C %7C(OK)%7C(\\r\\n))$%7C(Failed)|10|Failed' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Enable Bitlocker Feature')
```

## Step 3
An example of a query with a groupid:

```sql
INSERT INTO groupagents 
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Production - Enable Bitlocker Feature' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  '%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
  '0' as `ContactID`,
  '21600' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$RS=\'RSAT-Feature-Tools-BitLocker\',\'RSAT-Feature-Tools-BitLocker-RemoteAdminTool\',\'RSAT-Feature-Tools-BitLocker-BdeAducExt\';Foreach($r in $RS){if (((Get-WindowsFeature -Name $r).InstallState) -ne \'Installed\') {try{Install-WindowsFeature -Name $r -erroraction Stop 3>&1 1>$null}catch{return \'Failed\'}}}"' as `DataOut`,
  '16' as `Comparor`,
  '10|^(()%7C %7C(OK)%7C(\\r\\n))$|11|^(()%7C %7C(OK)%7C(\\r\\n))$%7C(Failed)|10|Failed' as `DataIn`,
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
WHERE m.groupid IN (219)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Enable Bitlocker Feature')
```

## Step 4
Now execute your query from a RAWSQL monitor set.

## Step 5
Locate your remote monitor by opening the group(s) remote monitors tab.  
**DO NOT** Apply any alert template to this monitor set.


