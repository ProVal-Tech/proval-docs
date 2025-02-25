---
id: '2be5ccc9-2700-4f5d-9b77-30567de4cfdf'
title: 'Implement- Dell Hardware Monitoring'
title_meta: 'Implement- Dell Hardware Monitoring'
keywords: ['dell', 'monitoring', 'alert', 'sql', 'setup', 'configuration']
description: 'This document outlines the steps to set up Dell Hardware Monitoring in ConnectWise Automate, including importing alert templates, running SQL queries, and configuring monitors for Dell servers.'
tags: ['setup', 'sql', 'windows']
draft: false
unlisted: false
---

## Steps

### 1. Import the Alert Template
Import the Alert Template `△ Custom - Ticket Creation Computer [Failures Only]`. The alert template should not be performing any action for the `Warning` state.

### 2. Validate Script Import
Validate that the [Script - Ticket Creation - Computer [Failures Only]](<../scripts/Ticket Creation - Computer Failures Only.md>) was imported as well.

### 3. Run SQL Query
Run this SQL query from a RAWSQL monitor set to import the required search.

```sql
INSERT INTO `sensorchecks`
SELECT
'' as `SensID`,
'Computers - Dell Servers' as `Name`,
'SELECT \n   computers.computerid as `Computer Id`,\n   computers.name as `Computer Name`,\n   clients.name as `Client Name`,\n   computers.domain as `Computer Domain`,\n   computers.username as `Computer User`,\n   Computers.BiosMFG as `Computer.Hardware.Manufacturer`,\n   IF(INSTR(computers.os, \'server\')>0, 1, 0) as `Computer.OS.IsServer`\nFROM Computers \nLEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)\nLEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)\nLEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)\n WHERE \n((((Instr(Computers.BiosMFG,\'Dell\') > 0) AND (IF(INSTR(computers.os, \'server\')>0, 1, 0)<>0))))\n' as `SQL`,
'4' as `QueryType`,
'READONLY' as `ListData`,
'1' as `FolderID`,
'<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Hardware.Manufacturer</lon><lok>Computer.Hardware.Manufacturer</lok><lmo>Contains</lmo><dv>Dell</dv><dk>Dell</dk></asn><asn><st>ComparisonNode</st><lon>Computer.OS.IsServer</lon><lok>Computer.OS.IsServer</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn></cn></asn></cn></asn></LabTechAbstractSearch>' as `SearchXML`,
(NULL) as `UpdatedBy`,
(NULL) as `UpdateDate`
FROM  (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT count(*) From SensorChecks where `GUID` = '9185ef1d-4eee-4430-8b72-f086f8849eb8') = 0;
```

### 4. Obtain Group IDs
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

### 5. Insert Group Agents
Copy the following query and replace `YOUR COMMA SEPARATED LIST OF GROUPID(S)` with the Group ID(s) of the relevant groups. (The string to replace can be found at the very bottom of the query, right after **WHERE**).

```sql
Set @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = '9185ef1d-4eee-4430-8b72-f086f8849eb8');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@Searchid as `SearchID`,
'ProVal - Production - Dell Hardware Monitoring' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Dell OMSA Alert for: %CLIENTNAME%\\%COMPUTERNAME%~~~No Dell Hardware alerts were detected in the last 60 minutes.!!!Dell OMSA Alert for: %CLIENTNAME%\\%COMPUTERNAME%~~~Dell Open Manage has detected an issue with %Computername% at %clientname%. The message details are outlined below: %RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= \'SilentlyContinue\'; $startTime = (Get-Date).AddMinutes(-60); $excludeMessages=\'The controller write policy has been changed to Write Through|certified drive|SAS management and monitoring is not possible|older than the required .* version\'; $provider = \'Server Administrator\'; Get-WinEvent -FilterHashTable @{Logname = \'Application\',\'System\'; StartTime = $StartTime; Level = 1,2,3 } | Where-Object { $_.ProviderName -eq $Provider -and $_.message -notmatch $excludeMessages } | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message }}"' as `DataOut`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Dell Hardware Monitoring');
```

### 6. Example Query
An example of the query with group IDs and modified thresholds.

```sql
Set @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = '9185ef1d-4eee-4430-8b72-f086f8849eb8');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@Searchid as `SearchID`,
'ProVal - Production - Dell Hardware Monitoring' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Dell OMSA Alert for: %CLIENTNAME%\\%COMPUTERNAME%~~~No Dell Hardware alerts were detected in the last 60 minutes.!!!Dell OMSA Alert for: %CLIENTNAME%\\%COMPUTERNAME%~~~Dell Open Manage has detected an issue with %Computername% at %clientname%. The message details are outlined below: %RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= \'SilentlyContinue\'; $startTime = (Get-Date).AddMinutes(-60); $excludeMessages=\'The controller write policy has been changed to Write Through|certified drive|SAS management and monitoring is not possible|older than the required .* version\'; $provider = \'Server Administrator\'; Get-WinEvent -FilterHashTable @{Logname = \'Application\',\'System\'; StartTime = $StartTime; Level = 1,2,3 } | Where-Object { $_.ProviderName -eq $Provider -and $_.message -notmatch $excludeMessages } | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message }}"' as `DataOut`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Dell Hardware Monitoring');
```

### 7. Check Groups
Check the concerned groups to ensure the monitor set is created and configured with the correct search.

Limit to: `Computers - Dell Servers`

![Image](../../../static/img/Implement--Dell-Hardware-Monitoring/image_1.png)

### 8. Set Alert Template
Set the appropriate alert template.
