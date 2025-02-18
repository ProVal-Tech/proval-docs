---
id: 'da1f5a89-eab2-4fae-8e49-e98c269cf103'
title: 'Import - Remote Monitor - Reset AD Users Password Age'
title_meta: 'Import - Remote Monitor - Reset AD Users Password Age'
keywords: ['ad', 'users', 'password', 'reset', 'monitor']
description: 'This document provides a step-by-step guide on how to set up a remote monitor in ConnectWise Automate to reset the password age for Active Directory users. It includes SQL queries for creating and managing the monitor, as well as examples for implementation.'
tags: ['active-directory', 'sql']
draft: false
unlisted: false
---

## Step 1
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

---

## Step 2
Run this SQL query from a RAWSQL monitor set to import the required search:

```
INSERT INTO `sensorchecks`
SELECT
'' AS `SensID`,
'Server Role - AD - Infrastructure Master' AS `Name`,
'SSELECT computers.computerid as `Computer Id`, computers.name as `Computer Name`, clients.name as `Client Name`, computers.domain as `Computer Domain`, computers.username as `Computer User`, IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),\'0\') as `Computer - Extra Data Field - Default - Under MSP Contract`, IFNULL(crd2.RoleDefinitionId,0) as `AD Infrastructure Master-2`, IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),\'0\') as `Computer - Extra Data Field - Default - Exclude MSP Contract`, IF(INSTR(computers.os, \'server\')>0, 1, 0) as `Computer.OS.IsServer` FROM Computers LEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId) LEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId) LEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID) LEFT JOIN ExtraFieldData edfAssigned1 ON (edfAssigned1.id=Computers.ComputerId AND edfAssigned1.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE `name`=\'Under MSP Contract\')) LEFT JOIN ExtraFieldData edfDefault1 ON (edfDefault1.id=0 AND edfDefault1.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE `name`=\'Under MSP Contract\')) LEFT JOIN ComputerRoleDefinitions crd2 ON (crd2.ComputerId=Computers.ComputerId AND crd2.RoleDefinitionId=(SELECT RoleDefinitionId FROM RoleDefinitions WHERE `RoleName`=\'AD Infrastructure Master\') AND (crd2.Type=1 OR (crd2.CurrentlyDetected=1 AND crd2.Type<>2))) LEFT JOIN ExtraFieldData edfAssigned3 ON (edfAssigned3.id=Computers.ComputerId AND edfAssigned3.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE `name`=\'Exclude MSP Contract\')) LEFT JOIN ExtraFieldData edfDefault3 ON (edfDefault3.id=0 AND edfDefault3.ExtraFieldId =(SELECT ExtraField.id FROM ExtraField WHERE `name`=\'Exclude MSP Contract\')) WHERE ((((IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),\'0\')<>0) AND (IFNULL(crd2.RoleDefinitionId,0) >0 ) AND (NOT ((IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),\'0\')<>0))) AND (IF(INSTR(computers.os, \'server\')>0, 1, 0)<>0))))
' AS `SQL`,
'4' AS `QueryType`,
'' AS `ListData`,
'0' AS `FolderID`,
'430a4640-9c97-4344-bfe8-7a786b110729' AS `GUID`,
'' AS `SearchXML`,
'' AS `UpdatedBy`,
'' AS `UpdateDate`
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = '430a4640-9c97-4344-bfe8-7a786b110729') = 0;
```

---

## Step 3
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Group ID(s) of the relevant groups to create and set up the remote monitor:
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```
INSERT INTO groupagents
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'648' as `SearchID`,
'ProVal - Production - Reset AD Users Password Age' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Reset AD Users Password Age on %Computername% at %Clientname%~~~No users found with Password Age set to Not Expire.!!!Failed to Reset AD Users Password Age on %Computername% at %Clientname%~~~Failed to Reset AD Users Password Age on %Computername% at %Clientname%. Password is still set to Not Expire on below users:%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= \'SilentlyContinue\';net accounts /maxpwage:90 /domain;$FailedUsers = @();foreach ($user in (Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $True} | Select-Object -Expandproperty Name )){ try { Set-ADUser -Identity $user -PasswordNeverExpires $false -Erroraction Stop} catch {$FailedUsers += $User}}; $FailedUsers\"' as `DataOut`,
'10' as `Comparor`,
'^((\\r\\n)|(OK)|()|( ))$' as `DataIn`,
'0' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'0' as `Category`,
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
'SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Reset AD Users Password Age')
```

---

## Step 4
An example of a monitor query with a group ID:

```
INSERT INTO groupagents
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'648' as `SearchID`,
'ProVal - Production - Reset AD Users Password Age' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Reset AD Users Password Age on %Computername% at %Clientname%~~~No users found with Password Age set to Not Expire.!!!Failed to Reset AD Users Password Age on %Computername% at %Clientname%~~~Failed to Reset AD Users Password Age on %Computername% at %Clientname%. Password is still set to Not Expire on below users:%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= \'SilentlyContinue\';net accounts /maxpwage:90 /domain;$FailedUsers = @();foreach ($user in (Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $True} | Select-Object -Expandproperty Name )){ try { Set-ADUser -Identity $user -PasswordNeverExpires $false -Erroraction Stop} catch {$FailedUsers += $User}}; $FailedUsers\"' as `DataOut`,
'10' as `Comparor`,
'^((\\r\\n)|(OK)|()|( ))$' as `DataIn`,
'0' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'0' as `Category`,
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
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,188)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Reset AD Users Password Age')
```

---

## Step 5
Now execute your query from a RAWSQL monitor set.

---

## Step 6
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.



