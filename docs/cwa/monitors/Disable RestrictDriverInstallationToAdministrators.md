---
id: 'e79a2422-0089-451b-9522-a6110976c2f5'
title: 'Disable Restrict Driver Installation to Administrators'
title_meta: 'Disable Restrict Driver Installation to Administrators'
keywords: ['restrict', 'driver', 'installation', 'administrators', 'ticket', 'creation', 'monitor']
description: 'This document provides a detailed guide on how to disable the Restrict Driver Installation to Administrators setting in a ConnectWise Automate environment. It includes steps for ensuring the script and alert template are in place, obtaining group IDs, and executing the necessary SQL query to apply the changes effectively.'
tags: ['sql']
draft: false
unlisted: false
---

## Steps

### 1.
Ensure the presence of the [CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>) script and `△ Custom - Ticket Creation Computer - Failures Only` alert template.

### 2.
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### 3.
Copy the following query and replace '**YOUR COMMA SEPARATED LIST OF GROUPID(S)**' with the Group ID(s) of the relevant groups:  
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```
INSERT INTO groupagents  
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Client Specific - Disable RestrictDriverInstallationToAdministrators' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  'Failed to Disable RestrictDriverInstallationToAdministrators~~~Value Successfully Set.!!!Failed to Disable RestrictDriverInstallationToAdministrators~~~%RESULT%' as `AlertMessage`,
  '0' as `ContactID`,
  '86400' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command /"$P = /'HKLM://Software//Policies//Microsoft//Windows NT//Printers//PointAndPrint/'; $N = /'RestrictDriverInstallationToAdministrators/'; $V = 0; if ( !( (get-ItemProperty $P -Erroraction SilentlyContinue).$N -eq $V) ) {if(!(Test-Path -Path $P)) {try {New-Item -Path $P -Force -Erroraction stop | Out-Null} catch {return /"Failed to create registry path $P. Reason: $($Error[0].Exception.Message)/"}}; try {Set-Itemproperty -Path $P -Name $N -Value $V -Type /'DWord/' -Erroraction stop; return /'Registry changes applied./'} catch {return /"Failed to set registry key. Reason: $($Error[0].Exception.Message)/"}} else {return /'Registry Key is already set./'}/"' as `DataOut`,
  '16' as `Comparor`,
  '10|(^$%7C^(//s%7COK%7C//r//n)$)%7C(Registry changes applied)%7C(Registry Key is already set)|11|(^$%7C^(//s%7COK%7C//r//n)$)%7C(Failed to Set Registry Value RestrictDriverInstallationToAdministrators. Reason:)%7C(Registry changes applied)%7C(Registry Key is already set)|5|Failed to Set Registry Value RestrictDriverInstallationToAdministrators. Reason:' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Client Specific - Disable RestrictDriverInstallationToAdministrators')
```

### 4.
An example of a query with a group ID:

```
INSERT INTO groupagents  
  SELECT '' as `AgentID`,
  `groupid` as `GroupID`,
  '0' as `SearchID`,
  'ProVal - Client Specific - Disable RestrictDriverInstallationToAdministrators' as `Name`,
  '6' as `CheckAction`,
  '1' as `AlertAction`,
  'Failed to Disable RestrictDriverInstallationToAdministrators~~~Value Successfully Set.!!!Failed to Disable RestrictDriverInstallationToAdministrators~~~%RESULT%' as `AlertMessage`,
  '0' as `ContactID`,
  '86400' as `interval`,
  '127.0.0.1' as `Where`,
  '7' as `What`,
  'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command /"$P = /'HKLM://Software//Policies//Microsoft//Windows NT//Printers//PointAndPrint/'; $N = /'RestrictDriverInstallationToAdministrators/'; $V = 0; if ( !( (get-ItemProperty $P -Erroraction SilentlyContinue).$N -eq $V) ) {if(!(Test-Path -Path $P)) {try {New-Item -Path $P -Force -Erroraction stop | Out-Null} catch {return /"Failed to create registry path $P. Reason: $($Error[0].Exception.Message)/"}}; try {Set-Itemproperty -Path $P -Name $N -Value $V -Type /'DWord/' -Erroraction stop; return /'Registry changes applied./'} catch {return /"Failed to set registry key. Reason: $($Error[0].Exception.Message)/"}} else {return /'Registry Key is already set./'}/"' as `DataOut`,
  '16' as `Comparor`,
  '10|(^$%7C^(//s%7COK%7C//r//n)$)%7C(Registry changes applied)%7C(Registry Key is already set)|11|(^$%7C^(//s%7COK%7C//r//n)$)%7C(Failed to Set Registry Value RestrictDriverInstallationToAdministrators. Reason:)%7C(Registry changes applied)%7C(Registry Key is already set)|5|Failed to Set Registry Value RestrictDriverInstallationToAdministrators. Reason:' as `DataIn`,
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
WHERE m.groupid IN (2,856)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Client Specific - Disable RestrictDriverInstallationToAdministrators')
```

### 5.
Now execute your query from a RAWSQL monitor set.

### 6.
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the `△ Custom - Ticket Creation - Computer - Failures Only` alert template.
