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

```sql
INSERT INTO `sensorchecks`
SELECT
'' AS `SensID`,
'Server Role - AD - Infrastructure Master' AS `Name`,
'SELECT \n   computers.computerid as `Computer Id`,\n   computers.name as `Computer Name`,\n   clients.name as `Client Name`,\n   computers.domain as `Computer Domain`,\n   computers.username as `Computer User`,\n   IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),\'0\') as `Computer - Extra Data Field - Default - Under MSP Contract`,\n   IFNULL(crd2.RoleDefinitionId,0) as `AD Infrastructure Master-2`,\n   IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),\'0\') as `Computer - Extra Data Field - Default - Exclude MSP Contract`,\n   IF(INSTR(computers.os, \'server\')>0, 1, 0) as `Computer.OS.IsServer`\nFROM Computers \nLEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)\nLEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)\nLEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)\nLEFT JOIN ExtraFieldData edfAssigned1 ON (edfAssigned1.id=Computers.ComputerId and edfAssigned1.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'45c2da7e-3bf5-11e1-92fd-c1ee63289e9e\'))\nLEFT JOIN ExtraFieldData edfDefault1 ON (edfDefault1.id=0 and edfDefault1.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'45c2da7e-3bf5-11e1-92fd-c1ee63289e9e\'))\nLEFT JOIN ComputerRoleDefinitions crd2 ON (crd2.ComputerId=Computers.ComputerId And crd2.RoleDefinitionId=(Select RoleDefinitionId From RoleDefinitions Where RoleDetectionGuid=\'e90000d4-2b70-11e3-9392-08002788414b\') And (crd2.Type=1 OR (crd2.CurrentlyDetected=1 and crd2.Type<>2)))\nLEFT JOIN ExtraFieldData edfAssigned3 ON (edfAssigned3.id=Computers.ComputerId and edfAssigned3.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'a72e229b-3bf5-11e1-92fd-c1ee63289e9e\'))\nLEFT JOIN ExtraFieldData edfDefault3 ON (edfDefault3.id=0 and edfDefault3.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'a72e229b-3bf5-11e1-92fd-c1ee63289e9e\'))\n WHERE \n((((IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),\'0\')<>0) AND (IFNULL(crd2.RoleDefinitionId,0) >0 ) AND (NOT ((IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),\'0\')<>0))) AND (IF(INSTR(computers.os, \'server\')>0, 1, 0)<>0))))\n' AS `SQL`,
'4' AS `QueryType`,
'' AS `ListData`,
'0' AS `FolderID`,
'430a4640-9c97-4344-bfe8-7a786b110729' AS `GUID`,
'<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Extra Data Field.Default.Under MSP Contract</lon><lok>Computer.Edf.45c2da7e-3bf5-11e1-92fd-c1ee63289e9e</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.LabTech.Roles</lon><lok>Computer.LabTech.Roles</lok><lmo>HasRole</lmo><dv>AD Infrastructure Master</dv><dk>e90000d4-2b70-11e3-9392-08002788414b</dk></asn><asn><st>NotNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Extra Data Field.Default.Exclude MSP Contract</lon><lok>Computer.Edf.a72e229b-3bf5-11e1-92fd-c1ee63289e9e</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn></cn></asn><asn><st>ComparisonNode</st><lon>Computer.OS.IsServer</lon><lok>Computer.OS.IsServer</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn></cn></asn></cn></asn></LabTechAbstractSearch>' AS `SearchXML`,
'' AS `UpdatedBy`,
'' AS `UpdateDate`
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = '430a4640-9c97-4344-bfe8-7a786b110729') = 0;
```

---

## Step 3
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Group ID(s) of the relevant groups to create and set up the remote monitor:
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
INSERT INTO groupagents
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'648' as `SearchID`,
'ProVal - Production - Reset AD Users Password Age' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Reset AD Users Password Age on %Computername% at %Clientname%~~~No users found with Password Age set to Not Expire.!!!Failed to Reset AD Users Password Age on %Computername% at %Clientname%~~~Failed to Reset AD Users Password Age on %Computername% at %Clientname%. Password is still set to Not Expire on below users:\r\n\r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\';net accounts /maxpwage:90 /domain;$FailedUsers = @();foreach ($user in (Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $True} | Select-Object -Expandproperty Name )){ try { Set-ADUser -Identity $user -PasswordNeverExpires $false -Erroraction Stop} catch {$FailedUsers += $User}}; $FailedUsers"' as `DataOut`,
'10' as `Comparor`,
'^((\\r\\n)|(OK)|()|( ))$' as `DataIn`,
'0' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'0' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Reset AD Users Password Age')
```

---

## Step 4
An example of a monitor query with a group ID:

```sql
INSERT INTO groupagents
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
'648' as `SearchID`,
'ProVal - Production - Reset AD Users Password Age' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Reset AD Users Password Age on %Computername% at %Clientname%~~~No users found with Password Age set to Not Expire.!!!Failed to Reset AD Users Password Age on %Computername% at %Clientname%~~~Failed to Reset AD Users Password Age on %Computername% at %Clientname%. Password is still set to Not Expire on below users:\r\n\r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\';net accounts /maxpwage:90 /domain;$FailedUsers = @();foreach ($user in (Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $True} | Select-Object -Expandproperty Name )){ try { Set-ADUser -Identity $user -PasswordNeverExpires $false -Erroraction Stop} catch {$FailedUsers += $User}}; $FailedUsers"' as `DataOut`,
'10' as `Comparor`,
'^((\\r\\n)|(OK)|()|( ))$' as `DataIn`,
'0' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'0' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
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
