---
id: '94acea25-1d14-4ccd-8991-045331d05fde'
slug: /94acea25-1d14-4ccd-8991-045331d05fde
title: 'Implement - Remote Monitor - Mega RAID Errors'
title_meta: 'Implement - Remote Monitor - Mega RAID Errors'
keywords: ['configure', 'alerts', 'monitors', 'sql', 'setup']
description: 'This document outlines the steps to configure alert templates and monitors in ConnectWise Automate, including SQL queries for monitoring Windows machines excluding virtual ones and setting up appropriate alert actions and templates.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Steps

### 1.
Import the Alert Template `△ Custom - Ticket Creation Computer - Failures Only`. The alert template should not perform any action.

---

### 2.
Validate that the [CWM - Automate - Script - Ticket Creation - Computer [Failures Only]](/docs/e14bf501-f10d-44d7-a19a-2284fd5c5cc9) script was imported as well.

---

### 3.
Run this SQL query from a RAWSQL monitor set to import the required search.

```sql
INSERT INTO `sensorchecks`
SELECT
'' as `SensID`,
'Windows Machines Excluding Virtual' as `Name`,
 'SELECT \r\n   computers.computerid as `Computer Id`,\r\n   computers.name as `Computer Name`,\r\n   clients.name as `Client Name`,\r\n   computers.domain as `Computer Domain`,\r\n   computers.username as `Computer User`,\r\n   IF((Computers.flags & 2048) <> 0, 1, 0) as `Computer.Hardware.IsVirtual`,\r\n   IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'windows\')>0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'darwin\') >0, 2, 3)) as `Computer.OS.Type`\r\nFROM Computers \r\nLEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)\r\nLEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)\r\nLEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)\r\n WHERE \r\n((((IF((Computers.flags & 2048) <> 0, 1, 0)=0) AND (IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'windows\')>0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'darwin\') >0, 2, 3)) = \'1\'))))\r\n' as `SQL`,
'4' as `QueryType`,
'Select||=||=||=|^Select|||||||^' as `ListData`,
'3' as `FolderID`,
'c4008496-11c3-497b-8b4d-2d53c38c9d2e' as `GUID`,
'<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Hardware.IsVirtual</lon><lok>Computer.Hardware.IsVirtual</lok><lmo>IsFalse</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.OS.Type</lon><lok>Computer.OS.Type</lok><lmo>Equals</lmo><dv>Windows</dv><dk>1</dk></asn></cn></asn></cn></asn></LabTechAbstractSearch>' as `SearchXML`,
(NULL) as `UpdatedBy`,
(NULL) as `UpdateDate`
FROM  (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT count(*) From SensorChecks where `GUID` = 'c4008496-11c3-497b-8b4d-2d53c38c9d2e') = 0;
```

---

### 4.
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

---

### 5.
Copy the following query and replace `YOUR COMMA SEPARATED LIST OF GROUPID(S)` with the group ID(s) of the relevant groups. (The string to replace can be found at the very bottom of the query, right after **WHERE**).

```sql
SET @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = 'c4008496-11c3-497b-8b4d-2d53c38c9d2e');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@searchid as `SearchID`,
'ProVal - Production - Mega Raid Errors' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Mega Raid Error Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~No mega raid errors have been detected in the last 60 minutes.!!!Mega Raid Error Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~Mega Raid Error Detected on %CLIENTNAME%\\%COMPUTERNAME%.' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $startTime = (Get-Date).AddMinutes(-60); Get-WinEvent -FilterHashtable @{LogName = \'Application\'; StartTime = $starttime; Level = 1,2; ProviderName = \'MR_MONITOR\'} | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message }}"' as `DataOut`,
'16' as `Comparor`,
'10|((^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7C(^$))|11|((^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7C(^$))%7C(^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})Occurrences)|10|^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})Occurrences' as `DataIn`,
'' as `IDField`,
'0' as `AlertStyle`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Mega Raid Errors');
```

---

### 6.
An example of the query with group IDs and modified thresholds.

```sql
SET @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = 'c4008496-11c3-497b-8b4d-2d53c38c9d2e');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@searchid as `SearchID`,
'ProVal - Production - Mega Raid Errors' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Mega Raid Error Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~No mega raid errors have been detected in the last 60 minutes.!!!Mega Raid Error Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~Mega Raid Error Detected on %CLIENTNAME%\\%COMPUTERNAME%.' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $startTime = (Get-Date).AddMinutes(-60); Get-WinEvent -FilterHashtable @{LogName = \'Application\'; StartTime = $starttime; Level = 1,2; ProviderName = \'MR_MONITOR\'} | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message }}"' as `DataOut`,
'16' as `Comparor`,
'10|((^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7C(^$))|11|((^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7C(^$))%7C(^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})Occurrences)|10|^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})Occurrences' as `DataIn`,
'' as `IDField`,
'0' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'21' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
UUID() as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (855,856)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Mega Raid Errors');
```

---

### 7.
Check the concerned groups and ensure the monitor set is created and configured with the correct search.

**Limit to:** `Windows Machines Excluding Virtual`

![Image](../../../static/img/docs/94acea25-1d14-4ccd-8991-045331d05fde/image_1.webp)

---

### 8.
Set the appropriate alert template.