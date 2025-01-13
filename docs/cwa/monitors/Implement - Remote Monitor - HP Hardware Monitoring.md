---
id: 'cwa-steps-to-setup-hp-hardware-monitoring'
title: 'Steps to Setup HP Hardware Monitoring'
title_meta: 'Steps to Setup HP Hardware Monitoring'
keywords: ['setup', 'monitoring', 'hp', 'hardware', 'alerts']
description: 'This document outlines the step-by-step process to set up HP Hardware Monitoring in ConnectWise Automate, including importing alert templates, running SQL queries, and configuring monitors for HP servers.'
tags: ['setup', 'monitoring', 'hp', 'alerts', 'sql', 'configuration']
draft: false
unlisted: false
---
## Steps

### 1.
Import the Alert Template `△ Custom - Ticket Creation Computer`. The alert template should not be performing any action for the `Warning` state.

### 2.
Validate that the [Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script was imported as well.

### 3.
Run this SQL query from a RAWSQL monitor set to import the required search.

```
INSERT INTO `sensorchecks`
SELECT
'' as `SensID`,
'HP Servers' as `Name`,
'SELECT 
   computers.computerid as `Computer Id`,
   computers.name as `Computer Name`,
   clients.name as `Client Name`,
   computers.domain as `Computer Domain`,
   computers.username as `Computer User`,
   IF(INSTR(computers.os, \'server\')>0, 1, 0) as `Computer.OS.IsServer`,
   Computers.BiosMFG as `Computer.Hardware.Manufacturer`
FROM Computers 
LEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)
LEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)
LEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)
 WHERE 
((((IF(INSTR(computers.os, \'server\')>0, 1, 0)<>0) AND (((Instr(Computers.BiosMFG,\'HPE\') > 0) OR (Instr(Computers.BiosMFG,\'Hewlett-Packard\') > 0))))))'
 as `SQL`,
'4' as `QueryType`,
'READONLY' as `ListData`,
'3' as `FolderID`,
'f96d2c44-49a1-11e0-8c4a-0050568b7d1e' as `GUID`,
'<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.IsServer</lon><lok>Computer.OS.IsServer</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>OrNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Hardware.Manufacturer</lon><lok>Computer.Hardware.Manufacturer</lok><lmo>Contains</lmo><dv>HPE</dv><dk>HPE</dk></asn><asn><st>ComparisonNode</st><lon>Computer.Hardware.Manufacturer</lon><lok>Computer.Hardware.Manufacturer</lok><lmo>Contains</lmo><dv>Hewlett-Packard</dv><dk>Hewlett-Packard</dk></asn></cn></asn></cn></asn></cn></asn></LabTechAbstractSearch>' as `SearchXML`,
(NULL) as `UpdatedBy`,
(NULL) as `UpdateDate`
FROM  (SELECT MIN(computerid) FROM computers) a
Where (SELECT count(*) From SensorChecks where `GUID` = 'f96d2c44-49a1-11e0-8c4a-0050568b7d1e') = 0 ;
```

### 4.
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

### 5.
Copy the following query and replace `YOUR COMMA SEPARATED LIST OF GROUPID(S)` with the Groupid(s) of the relevant groups: (The string to replace can be found at the very bottom of the query, right after **WHERE**).

```
Set @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = 'f96d2c44-49a1-11e0-8c4a-0050568b7d1e');
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@searchid as `SearchID`,
'ProVal - Production - HP Hardware Monitoring' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'HP Event Log Errors Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~No HP Hardware alerts have been detected in the last 60 minutes.!!!HP Event Log Errors Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~HP Hardware Monitoring has detected an issue with %Computername% at %clientname%. The message details are outlined below: \r\n\r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $startTime = (Get-Date).AddMinutes(-60) ;$excludeMessages=\'Connectivity has been lost for the NIC|SNMP trap to the Compaq Remote Insight Board trap due to processing error|A network interface has failed|HP WBEM data was captured|Network Adapter Link\'; $providers = \'Smart Array Events|Storage Agents|Server Agents|Nic Agents|hp|Cissesrv|HPE\'; Get-WinEvent -FilterHashTable @{Logname = \'Application\',\'System\'; StartTime = $StartTime; Level = 1,2 } | Where-Object { $_.ProviderName -match $Providers -and $_.message -notmatch $excludeMessages } | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message }}"' as `DataOut`,
'16' as `Comparor`,
'10|((^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7C(^$))|11|((^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7C(^$))%7C(^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})Occurrences)|10|^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})Occurrences' as `DataIn`,
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
'SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - HP Hardware Monitoring')
```

### 6.
An example of the query with groupids and modified thresholds.

```
Set @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = 'f96d2c44-49a1-11e0-8c4a-0050568b7d1e');
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@searchid as `SearchID`,
'ProVal - Production - HP Hardware Monitoring' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'HP Event Log Errors Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~No HP Hardware alerts have been detected in the last 60 minutes.!!!HP Event Log Errors Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~HP Hardware Monitoring has detected an issue with %Computername% at %clientname%. The message details are outlined below: \r\n\r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\'; $startTime = (Get-Date).AddMinutes(-60) ;$excludeMessages=\'Connectivity has been lost for the NIC|SNMP trap to the Compaq Remote Insight Board trap due to processing error|A network interface has failed|HP WBEM data was captured|Network Adapter Link\'; $providers = \'Smart Array Events|Storage Agents|Server Agents|Nic Agents|hp|Cissesrv|HPE\'; Get-WinEvent -FilterHashTable @{Logname = \'Application\',\'System\'; StartTime = $StartTime; Level = 1,2 } | Where-Object { $_.ProviderName -match $Providers -and $_.message -notmatch $excludeMessages } | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message }}"' as `DataOut`,
'16' as `Comparor`,
'10|((^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7C(^$))|11|((^((OK){0,}(\\r\\n){0,}[\\r\\n]{0,}\\s{0,})$)%7C(^$))%7C(^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})Occurrences)|10|^((\\r\\n){0,}[\\r\\n]{0,}\\s{0,})Occurrences' as `DataIn`,
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
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
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
WHERE m.groupid IN (678,536)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - HP Hardware Monitoring')
```

### 7.
Check the concerned groups, ensure the monitor set is created and configured with the correct search.

**Limit to:** `HP Servers`

![Example Image](..\..\..\static\img\Implement---Remote-Monitor---HP-Hardware-Monitoring\image_1.png)

### 8.
Set the appropriate alert template.


