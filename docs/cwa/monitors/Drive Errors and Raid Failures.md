---
id: 'cef450c6-b649-4bd3-bcde-ed521d38d77f'
slug: /cef450c6-b649-4bd3-bcde-ed521d38d77f
title: 'Drive Errors and Raid Failures'
title_meta: 'Drive Errors and Raid Failures'
keywords: ['monitor', 'drive', 'raid', 'errors', 'ticket']
description: 'This document outlines the configuration and functionality of the Drive Errors Monitor, which checks for issues with drives or RAID in Windows machines. It allows customization of error thresholds and provides guidelines for ticket creation upon detection of drive errors.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor checks for any problems with the drive or RAID in the past hour. You can also choose how many `Controller errors` and `bad block detected` errors you want to allow in the past hour before the monitor creates a ticket for them. You can set these numbers when you import the monitor set. If you set them to 0, the monitor will not ignore any errors. This means that the monitor will create a ticket even if there is only one of these errors when the number is set to 0. You can find more information and examples about these variables in the implementation document.

```
SET @AllowedControllerErrors = <How many Controller Errors you want to allow>;
```

```
SET @AllowedBadBlocks = <How many Bad Blocks you want to allow>;
```

**Warning**:  
- The monitor set may not work well for machines that have an old version of PowerShell (less than 5).
- The monitor set does not work for virtual machines.

## Details

**Suggested "Limit to"**: `Windows Machines Excluding Virtual`  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: `△ Custom - Ticket Creation - Computer - Failures Only`  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|-------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File    | **REDACTED**  | State Based | 3600     | ![Result](../../../static/img/Drive-Errors-and-Raid-Failures/image_1.png) |

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035)

## Target

Managed Windows Computer (Excluding Virtual Machines)

![Target](../../../static/img/Drive-Errors-and-Raid-Failures/image_2.png)  

The monitor set should be limited to the `Windows Machines Excluding Virtual` search.

## Ticketing

**Subject:**  
`Drive Error Detected on %CLIENTNAME%/%COMPUTERNAME%`

**Body:**  
```
Drive Error Detected on %CLIENTNAME%/%COMPUTERNAME%.

Details:  

%RESULT%
```

## Implementation

### Step 1
Import the Alert Template `△ Custom - Ticket Creation Computer - Failures Only`. The alert template should not perform any action.

---

### Step 2
Validate that the [Ticket Creation - Computer [Failures Only]](/docs/e14bf501-f10d-44d7-a19a-2284fd5c5cc9) was imported along with the alert template.

---

### Step 3
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
WHERE (SELECT count(*) FROM SensorChecks where `GUID` = 'c4008496-11c3-497b-8b4d-2d53c38c9d2e') = 0;
```

---

### Step 4
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

---

### Step 5
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
'Drive Error Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~No drive errors have been detected in the last 60 minutes.!!!Drive Error Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~Drive Error Detected on %CLIENTNAME%\\%COMPUTERNAME%.\r\n\r\nDetails: \r\n\r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
CONCAT('C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\';$AllowedControllerErrors =',@AllowedControllerErrors,'; $AllowedBadBlocks = ',@AllowedBadBlocks,'; $startTime = (Get-Date).AddMinutes(-60); $excludeMessages =\'paging operation|was retried|surprise removed|same disk identifiers|the capacity of|is not ready for access yet\'; Get-WinEvent -FilterHashtable @{LogName = \'System\'; StartTime = $starttime; Level = 1,2,3; ProviderName = \'disk\'} | Where-Object { $_.message -notmatch $excludeMessages} | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message } | Where-Object { $(if ( $_.Message -match \'Controller error on\' -and $AllowedControllerErrors -gt 0) { $_.Occurrences -gt $AllowedControllerErrors } elseif ($_.Message -match \'has a bad block\' -and $AllowedBadBlocks -gt 0) { $_.Occurrences -gt $AllowedBadBlocks } else { $true })}}"') as `DataOut`,
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
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Drive Errors and Raid Failures');
```

---

### Step 6
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
'Drive Error Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~No drive errors have been detected in the last 60 minutes.!!!Drive Error Detected on %CLIENTNAME%\\%COMPUTERNAME%~~~Drive Error Detected on %CLIENTNAME%\\%COMPUTERNAME%.\r\n\r\nDetails: \r\n\r\n%RESULT%' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
CONCAT('C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= \'SilentlyContinue\';$AllowedControllerErrors =',@AllowedControllerErrors,'; $AllowedBadBlocks = ',@AllowedBadBlocks,'; $startTime = (Get-Date).AddMinutes(-60); $excludeMessages =\'paging operation|was retried|surprise removed|same disk identifiers|the capacity of|is not ready for access yet\'; Get-WinEvent -FilterHashtable @{LogName = \'System\'; StartTime = $starttime; Level = 1,2,3; ProviderName = \'disk\'} | Where-Object { $_.message -notmatch $excludeMessages} | Select-Object Id, TimeCreated, LogName, ProviderName, LevelDisplayName, Message | Group-Object -Property Id | Sort-Object -Property Count -Descending | Select-Object -Property count, group | Foreach-Object {$mostrecent = $_.Group | Sort-Object -Property TimeCreated -Descending | Select-Object -First 1; [pscustomobject]@{Occurrences=$_.Count; EventID=$mostrecent.id; Logname=$Mostrecent.Logname; Source=$MostRecent.ProviderName; MostRecentDate=$mostrecent.TimeCreated; Level=$Mostrecent.LevelDisplayName; Message = $MostRecent.Message } | Where-Object { $(if ( $_.Message -match \'Controller error on\' -and $AllowedControllerErrors -gt 0) { $_.Occurrences -gt $AllowedControllerErrors } elseif ($_.Message -match \'has a bad block\' -and $AllowedBadBlocks -gt 0) { $_.Occurrences -gt $AllowedBadBlocks } else { $true })}}"') as `DataOut`,
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
WHERE m.groupid IN (2,3,856,857)
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Drive Errors and Raid Failures');
```
---

### Step 7
Check the concerned groups and ensure the monitor set is created and configured with the correct search.

**Limit to:** `Windows Machines Excluding Virtual`

![image](../../../static/img/Implement--Drive-Errors-and-Raid-Failures/image_1.png)

---

### Step 8
Set the appropriate alert template.
