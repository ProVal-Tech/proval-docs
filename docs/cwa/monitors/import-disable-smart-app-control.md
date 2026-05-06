---  
id: 'c73ce05c-fd6a-47fa-a6e5-79cdb11418cf'
slug: /c73ce05c-fd6a-47fa-a6e5-79cdb11418cf
title: 'Import - Disable Smart App Control'
title_meta: 'Import - Disable Smart App Control'
keywords: ['windows','Disable','Smart','Control']
description: 'This document provides detailed steps to set up a remote monitor to disable the `Smart App Control` on Windows 11 22H2 and later machines.'
tags: ['setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-06
---

## Steps to Set Up Remote Monitor

### 1. Execute SQL Query to create Search
Run the following SQL query from a RAWSQL monitor set to import the required search:

```sql
INSERT INTO `sensorchecks`
SELECT
'' AS `SensID`,
'Machines eligible to disable Smart App Control' AS `Name`,
'Select DISTINCT Computers.ComputerID, Clients.Name as `Client Name`, Computers.Name as `Computer Name`, Computers.Domain, Computers.UserName as `Username`, Computers.Version, Computers.OS\r\nFrom Computers, Clients\r\nWhere Computers.ClientID = Clients.ClientID\r\n and ((LT_CompareVersions(Computers.Version , \'10.0.22621\') >= 0) AND (Computers.OS like \'%windows 11%\'))' AS `SQL`,
'4' AS `QueryType`,
'OS Version||>=|10.0.22621|=||=|^OS||Like|%windows 11%|=||=|^Select|||||||^' AS `ListData`,
'0' AS `FolderID`,
'734f83ad-cebc-4781-867b-22f01ab40fef' AS `GUID`,
'' AS `SearchXML`,
NULL AS `UpdatedBy`,
NULL AS `UpdateDate`
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = '734f83ad-cebc-4781-867b-22f01ab40fef') = 0;
```

### 2. Execute SQL Query to create Remote Monitor

Run the following SQL query from a RAWSQL monitor set to import the remote monitor. This will create the monitor on `Service Plans.Windows Workstations.Managed 8x5` group and will limit the monitor to `Machines eligible to disable Smart App Control` search.

```sql
SET @Groupid = (SELECT GroupID FROM mastergroups WHERE guid = '3ac1c025-f1fb-11e1-b4ec-1231391d2d19');
SET @Searchid = (SELECT sensid from sensorchecks where GUID = '734f83ad-cebc-4781-867b-22f01ab40fef');
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@Searchid as `SearchID`,
'ProVal - Production - Disable Smart App Control' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference=\'Stop\'; $path = \'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\CI\\Policy\'; $name = \'VerifiedAndReputablePolicyState\';Set-ItemProperty -Path $path -Name  $name -Value 0 -Type DWord;if ((Get-ItemProperty -Path $path  -Name  $name).VerifiedAndReputablePolicyState -ne 0){ throw \'Failed to disable Smart App Control\' }"' as `DataOut`,
'16' as `Comparor`,
'10|(^(()%7C %7C(OK)%7C(\\r\\n))$)|11|(^(()%7C %7C(OK)%7C(\\r\\n))$)%7CFailed to disable|10|Failed to disable' as `DataIn`,
'' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
(UUID()) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (@Groupid)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Disable Smart App Control')
```

### 3. Locate Your Remote Monitor
Locate your remote monitor by opening the `Service Plans.Windows Workstations.Managed 8x5` group remote monitors tab.

## Changelog

### 2026-05-06

- Initial version of the document
