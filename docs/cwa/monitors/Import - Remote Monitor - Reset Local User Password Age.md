---
id: 'adc49b4c-24dc-4bb5-bd88-abddae4a4739'
title: 'Steps to Set Up Remote Monitor'
title_meta: 'Steps to Set Up Remote Monitor'
keywords: ['setup', 'remote', 'monitor', 'sql', 'query', 'groupid']
description: 'This document provides a detailed guide on how to set up a remote monitor using SQL queries. It includes steps to obtain group IDs, run SQL queries to create and configure the remote monitor, and apply alert templates for monitoring local user password age settings.'
tags: ['configuration', 'database', 'monitoring', 'setup', 'alert']
draft: false
unlisted: false
---
## Steps to Set Up Remote Monitor

### 1.
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

---

### 2.
Run this SQL query from a RAWSQL monitor set to import the required search:

```
INSERT INTO `sensorchecks`
SELECT
'' AS `SensID`,
'Windows Computers excluding Infrastructure Master' AS `Name`,
'SELECT computers.computerid as `Computer Id`,computers.name as `Computer Name`,clients.name as `Client Name`,computers.domain as `Computer Domain`,computers.username as `Computer User`, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), /'windows/')>0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), /'darwin/') >0, 2, 3)) as `Computer.OS.Type`,IFNULL(crd1.RoleDefinitionId,0) as `AD Infrastructure Master-1` FROM Computers LEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId) LEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId) LEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID) LEFT JOIN ComputerRoleDefinitions crd1 ON(crd1.ComputerId=Computers.ComputerId And crd1.RoleDefinitionId=(Select RoleDefinitionId From RoleDefinitions Where Rolename = /'AD Infrastructure Master/') And (crd1.Type=1 OR (crd1.CurrentlyDetected=1 and crd1.Type<>2))) WHERE ((((IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), /'windows/')>0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), /'darwin/') >0, 2, 3)) = '1') AND (IFNULL(crd1.RoleDefinitionId,0) =0 ))))' AS `SQL`,
'4' AS `QueryType`,
'' AS `ListData`,
'0' AS `FolderID`,
'20e4fd06-535d-45a2-874e-b77315b50dd9' AS `GUID`,
'' AS `SearchXML`,
'' AS `UpdatedBy`,
'' AS `UpdateDate`
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = '20e4fd06-535d-45a2-874e-b77315b50dd9') = 0 ;
```

---

### 3.
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Groupid(s) of the relevant groups to create and set up the remote monitor:

(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```
SET @Searchid= (SELECT sensid FROM sensorchecks WHERE `GUID` = '20e4fd06-535d-45a2-874e-b77315b50dd9');
```

```
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@Searchid as `SearchID`,
'ProVal - Production - Reset Local User Password Age' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Reset Local Users Password Age on %Computername% at %Clientname%~~~No users found with Password Age set to Not Expire.!!!Failed to Reset Local Users Password Age on %Computername% at %Clientname%~~~Failed to Reset Local Users Password Age on %Computername% at %Clientname%. Password is still set to Not Expire on below users:%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'900' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= /'SilentlyContinue/';net accounts /maxpwage:90 1>$Null ; $FailedUsers = @(); foreach ($user in (Get-LocalUser | Where-Object {$_.Enabled -eq $True -and ($_.PasswordExpires -ge (Get-Date).AddDays(90) -or $_.PasswordExpires -eq $Null)} | Select-Object -Expandproperty Name)) { try {set-localuser -Name $user -PasswordNeverExpires:$False -Erroraction Stop} catch {$FailedUsers += $User}}; $FailedUsers"' as `DataOut`,
'10' as `Comparor`,
'^(//r//n)|(OK)|()|( )$' as `DataIn`,
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
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Reset Local User Password Age')
```

---

### 4.
An example of monitor query with a groupid:

```
SET @Searchid= (SELECT sensid FROM sensorchecks WHERE `GUID` = '20e4fd06-535d-45a2-874e-b77315b50dd9');
```

```
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@Searchid as `SearchID`,
'ProVal - Production - Reset Local User Password Age' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Reset Local Users Password Age on %Computername% at %Clientname%~~~No users found with Password Age set to Not Expire.!!!Failed to Reset Local Users Password Age on %Computername% at %Clientname%~~~Failed to Reset Local Users Password Age on %Computername% at %Clientname%. Password is still set to Not Expire on below users:%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'900' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C://Windows//System32//WindowsPowerShell//v1.0//powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= /'SilentlyContinue/';net accounts /maxpwage:90 1>$Null ; $FailedUsers = @(); foreach ($user in (Get-LocalUser | Where-Object {$_.Enabled -eq $True -and ($_.PasswordExpires -ge (Get-Date).AddDays(90) -or $_.PasswordExpires -eq $Null)} | Select-Object -Expandproperty Name)) { try {set-localuser -Name $user -PasswordNeverExpires:$False -Erroraction Stop} catch {$FailedUsers += $User}}; $FailedUsers"' as `DataOut`,
'10' as `Comparor`,
'^(//r//n)|(OK)|()|( )$' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Reset Local User Password Age')
```

---

### 5.
Now execute your query from a RAWSQL monitor set.

---

### 6.
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.






