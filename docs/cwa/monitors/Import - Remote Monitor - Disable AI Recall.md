---
id: 'c9ef3af9-ea83-467d-a5b7-e34248ab65c5'
title: 'Import - Remote Monitor - Disable AI Recall'
title_meta: 'Import - Remote Monitor - Disable AI Recall'
keywords: ['setup', 'monitor', 'sql', 'remote', 'windows', 'groupid', 'alert']
description: 'This document provides detailed steps to set up a remote monitor for Windows 11 machines using SQL queries. It includes obtaining group IDs, executing SQL commands, and applying alert templates for effective monitoring.'
tags: ['setup', 'sql', 'windows']
draft: false
unlisted: false
---

## Steps to Set Up Remote Monitor

### 1. Obtain Group IDs
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### 2. Execute SQL Query
Run the following SQL query from a RAWSQL monitor set to import the required search:

```sql
INSERT INTO `sensorchecks`
SELECT
'' AS `SensID`,
'Windows 11 Machines' AS `Name`,
'SELECT \r\n   computers.computerid as `Computer Id`,\r\n   computers.name as `Computer Name`,\r\n   clients.name as `Client Name`,\r\n   computers.domain as `Computer Domain`,\r\n   computers.username as `Computer User`,\r\n   inv_operatingsystem.name as `Computer.OS.Name`\r\nFROM Computers \r\nLEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)\r\nLEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)\r\nLEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)\r\n WHERE \r\n((inv_operatingsystem.name like \'%windows 11%\'))\r\n' AS `SQL`,
'4' AS `QueryType`,
'Select||=||=||=|^Select|||||||^' AS `ListData`,
'0' AS `FolderID`,
'e092aede-3e39-11ef-85af-8600008a66b7' AS `GUID`,
'<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Name</lon><lok>Computer.OS.Name</lok><lmo>TextLike</lmo><dv>%windows 11%</dv><dk>%windows 11%</dk></asn></cn></asn></LabTechAbstractSearch>' AS `SearchXML`,
'' AS `UpdatedBy`,
'' AS `UpdateDate`
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = 'e092aede-3e39-11ef-85af-8600008a66b7') = 0;
```

### 3. Create and Setup Remote Monitor
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the group ID(s) of the relevant groups to create and set up the remote monitor. (The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
SET @searchID = ( SELECT MAX(sensid) FROM sensorchecks WHERE `GUID` ='e092aede-3e39-11ef-85af-8600008a66b7' )

INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@SearchID as `SearchID`,
'ProVal - Production - Disable AI Recall' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Disable AI Recall on %COMPUTERNAME%~~~AI Recall is successfully Disabled!!!Failed to Disable AI Recall on %COMPUTERNAME%~~~Failed to Disable AI Recall on %COMPUTERNAME% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%', as `AlertMessage`,
'0' as `ContactID`,
'1800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\system32\\cmd.exe /c powershell.exe -ExecutionPolicy Bypass -Command "$paths = @(\'HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsAI\',\'HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsAI\');$name = \'DisableAIDataAnalysis\';$value = 1;foreach ($path in $paths) {try {if (-Not (Test-Path $path)) {New-Item -Path $path -Force | out-null  }Set-ItemProperty -Path $path -Name $name -Value $value -Type DWord  | out-null }catch{Write-Output \'Failed to set $name at $path\'}}"' as `DataOut`,
'16' as `Comparor`,
'10|^(()%7C %7C(OK)%7C(\\r\\n))$|11|^(()%7C %7C(OK)%7C(\\r\\n))$%7CFailed to set|10|Failed to set' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Disable AI Recall')
```

### 4. Example of Monitor Query
Here is an example of a monitor query with a group ID:

```sql
SET @searchID = ( SELECT MAX(sensid) FROM sensorchecks WHERE `GUID` ='e092aede-3e39-11ef-85af-8600008a66b7' )

INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@SearchID as `SearchID`,
'ProVal - Production - Disable AI Recall' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Failed to Disable AI Recall on %COMPUTERNAME%~~~AI Recall is successfully Disabled!!!Failed to Disable AI Recall on %COMPUTERNAME%~~~Failed to Disable AI Recall on %COMPUTERNAME% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%', as `AlertMessage`,
'0' as `ContactID`,
'1800' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\system32\\cmd.exe /c powershell.exe -ExecutionPolicy Bypass -Command "$paths = @(\'HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsAI\',\'HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsAI\');$name = \'DisableAIDataAnalysis\';$value = 1;foreach ($path in $paths) {try {if (-Not (Test-Path $path)) {New-Item -Path $path -Force | out-null  }Set-ItemProperty -Path $path -Name $name -Value $value -Type DWord  | out-null }catch{Write-Output \'Failed to set $name at $path\'}}"' as `DataOut`,
'16' as `Comparor`,
'10|^(()%7C %7C(OK)%7C(\\r\\n))$|11|^(()%7C %7C(OK)%7C(\\r\\n))$%7CFailed to set|10|Failed to set' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (234,768)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Disable AI Recall')
```

### 5. Execute Your Query
Now execute your query from a RAWSQL monitor set.

### 6. Locate Your Remote Monitor
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.
