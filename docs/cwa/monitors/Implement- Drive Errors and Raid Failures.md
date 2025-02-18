---
id: '4b69a692-f9b1-4df7-b802-0dc265fd32da'
title: 'Implement- Drive Errors and Raid Failures'
title_meta: 'Implement- Drive Errors and Raid Failures'
keywords: ['ticket', 'creation', 'computer', 'failures', 'monitor', 'alert', 'sql']
description: 'This document provides a step-by-step guide to creating an alert template for ticket creation specifically for computer failures only. It includes SQL queries for monitoring and configuring alerts effectively in ConnectWise Automate.'
tags: ['sql', 'windows']
draft: false
unlisted: false
---

## Step 1
Import the Alert Template `△ Custom - Ticket Creation Computer - Failures Only`. The alert template should not perform any action.

---

## Step 2
Validate that the [CWM - Automate - Script - Ticket Creation - Computer [Failures Only]](<../scripts/Ticket Creation - Computer Failures Only.md>) script was imported as well.

---

## Step 3
Run this SQL query from a RAWSQL monitor set to import the required search.

```sql
INSERT INTO `sensorchecks` 
SELECT 
'' as `SensID`,
'Windows Machines Excluding Virtual' as `Name`, 
'SSELECT 
   computers.computerid as `Computer Id`,
   computers.name as `Computer Name`,
   clients.name as `Client Name`,
   computers.domain as `Computer Domain`,
   computers.username as `Computer User`,
   IF((Computers.flags & 2048) <> 0, 1, 0) as `Computer.Hardware.IsVirtual`,
   IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'windows') > 0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'darwin') > 0, 2, 3)) as `Computer.OS.Type`
FROM Computers 
LEFT JOIN inv_operatingsystem ON (Computers.ComputerId = inv_operatingsystem.ComputerId)
LEFT JOIN Clients ON (Computers.ClientId = Clients.ClientId)
LEFT JOIN Locations ON (Computers.LocationId = Locations.LocationID)
WHERE 
((((IF((Computers.flags & 2048) <> 0, 1, 0) = 0) AND (IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'windows') > 0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), 'darwin') > 0, 2, 3)) = '1'))))
' as `SQL`,
'4' as `QueryType`,
'Select||=||=||=|^Select|||||||^' as `ListData`,
'3' as `FolderID`,
'c4008496-11c3-497b-8b4d-2d53c38c9d2e' as `GUID`,
'<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Hardware.IsVirtual</lon><lok>Computer.Hardware.IsVirtual</lok><lmo>IsFalse</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.OS.Type</lon><lok>Computer.OS.Type</lok><lmo>Equals</lmo><dv>Windows</dv><dk>1</dk></asn></cn></asn></cn></asn></LabTechAbstractSearch>' as `SearchXML`,
(NULL) as `UpdatedBy`,
(NULL) as `UpdateDate`
FROM  (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT count(*) FROM SensorChecks where `GUID` = 'c4008496-11c3-497b-8b4d-2d53c38c9d2e') = 0;
```

---

## Step 4
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

---

## Step 5
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the groupid(s) of the relevant groups. (The string to replace can be found at the very bottom of the query, right after **WHERE**).

Additionally, set the value of `AllowedControllerErrors` and `AllowedBadBlocks` before executing the query if necessary. The default is 20. These values can be updated in the first two lines of the provided SQL query.

```sql
SET @AllowedControllerErrors = 20;
SET @AllowedBadBlocks = 20;
```

```sql
SET @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = 'c4008496-11c3-497b-8b4d-2d53c38c9d2e');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@searchid as `SearchID`,
'ProVal - Production - Drive Errors and Raid Failures' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Drive Error Detected on %CLIENTNAME%\%COMPUTERNAME%~~~No drive errors have been detected in the last 60 minutes.!!!Drive Error Detected on %CLIENTNAME%\%COMPUTERNAME%~~~Drive Error Detected on %CLIENTNAME%\%COMPUTERNAME%. Details: %RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
CONCAT('C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= ''SilentlyContinue'';$AllowedControllerErrors =', @AllowedControllerErrors,'; $AllowedBadBlocks = ',@AllowedBadBlocks,'; $startTime = (Get-Date).AddMinutes(-60); $excludeMessages =''paging operation|was retried|surprise removed|same disk identifiers|the capacity of|is not ready for access yet''; Get-WinEvent -FilterHashtable @{LogName = ''System''; StartTime = $starttime; Level = 1,2,3; ProviderName = ''disk''} | Where-Object { $_.message -notmatch $excludeMessages} | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message } | Where-Object { $(if ( $_.Message -match ''Controller error on'' -and $AllowedControllerErrors -gt 0) { $_.Occurrences -gt $AllowedControllerErrors } elseif ($_.Message -match ''has a bad block'' -and $AllowedBadBlocks -gt 0) { $_.Occurrences -gt $AllowedBadBlocks } else { $true })}}/\"') as `DataOut`,
'16' as `Comparor`,
'10|((^((OK){0,}(\r\n){0,}[\r\n]{0,}\s{0,})$)%7C(^$))|11|((^((OK){0,}(\r\n){0,}[\r\n]{0,}\s{0,})$)%7C(^$))%7C(^((\r\n){0,}[\r\n]{0,}\s{0,})Occurrences)|10|^((\r\n){0,}[\r\n]{0,}\s{0,})Occurrences' as `DataIn`,
'' as `IDField`,
'0' as `AlertStyle`,
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
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Drive Errors and Raid Failures');
```

---

## Step 6
An example of the query with groupids and modified thresholds.

```sql
SET @AllowedControllerErrors = 30;
SET @AllowedBadBlocks = 30;
```

```sql
SET @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = 'c4008496-11c3-497b-8b4d-2d53c38c9d2e');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@searchid as `SearchID`,
'ProVal - Production - Drive Errors and Raid Failures' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Drive Error Detected on %CLIENTNAME%\%COMPUTERNAME%~~~No drive errors have been detected in the last 60 minutes.!!!Drive Error Detected on %CLIENTNAME%\%COMPUTERNAME%~~~Drive Error Detected on %CLIENTNAME%\%COMPUTERNAME%. Details: %RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
CONCAT('C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command \"$ErroractionPreference= ''SilentlyContinue'';$AllowedControllerErrors =', @AllowedControllerErrors,'; $AllowedBadBlocks = ',@AllowedBadBlocks,'; $startTime = (Get-Date).AddMinutes(-60); $excludeMessages =''paging operation|was retried|surprise removed|same disk identifiers|the capacity of|is not ready for access yet''; Get-WinEvent -FilterHashtable @{LogName = ''System''; StartTime = $starttime; Level = 1,2,3; ProviderName = ''disk''} | Where-Object { $_.message -notmatch $excludeMessages} | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message } | Where-Object { $(if ( $_.Message -match ''Controller error on'' -and $AllowedControllerErrors -gt 0) { $_.Occurrences -gt $AllowedControllerErrors } elseif ($_.Message -match ''has a bad block'' -and $AllowedBadBlocks -gt 0) { $_.Occurrences -gt $AllowedBadBlocks } else { $true })}}/\"') as `DataOut`,
'16' as `Comparor`,
'10|((^((OK){0,}(\r\n){0,}[\r\n]{0,}\s{0,})$)%7C(^$))|11|((^((OK){0,}(\r\n){0,}[\r\n]{0,}\s{0,})$)%7C(^$))%7C(^((\r\n){0,}[\r\n]{0,}\s{0,})Occurrences)|10|^((\r\n){0,}[\r\n]{0,}\s{0,})Occurrences' as `DataIn`,
'' as `IDField`,
'0' as `AlertStyle`,
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
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2,3,856,857)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Drive Errors and Raid Failures');
```

---

## Step 7
Check the concerned groups and ensure the monitor set is created and configured with the correct search.

**Limit to:** `Windows Machines Excluding Virtual`

![image](../../../static/img/Implement--Drive-Errors-and-Raid-Failures/image_1.png)

---

## Step 8
Set the appropriate alert template.

