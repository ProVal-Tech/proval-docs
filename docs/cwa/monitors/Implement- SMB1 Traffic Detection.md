---
id: 'e6d09f37-fd0f-42a6-98a5-449f65673296'
title: 'Implement- SMB1 Traffic Detection'
title_meta: 'Implement- SMB1 Traffic Detection'
keywords: ['smb1', 'monitor', 'remote', 'detection', 'traffic']
description: 'This document provides a step-by-step guide to set up the SMB1 Traffic Detection Remote Monitor using SQL queries. It includes instructions for inserting necessary searches and groups, refreshing searches, and validating the setup.'
tags: ['database', 'networking']
draft: false
unlisted: false
---

## Step 1

Run the provided SQL query using a RAWSQL monitor to establish the `SMB1 Traffic Detection` Remote Monitor, `SMB1 Server Enabled [Remote Monitor]` search, and `SMB1 Server Enabled [Remote Monitor]` group.

```sql
# Insert `SMB1 Server Enabled [Remote Monitor]` search
INSERT INTO `sensorchecks` (`Name`, `SQL`, `QueryType`, `ListDATA`, `FolderID`, `GUID`) 
SELECT 
'SMB1 Server Enabled [Remote Monitor]', 
'SELECT DISTINCT Computers.ComputerID, Clients.Name AS `Client Name`, Computers.Name AS `Computer Name`, Computers.Domain, Computers.UserName AS `Username`, Computers.ComputerID FROM Computers, Clients WHERE Computers.ClientID = Clients.ClientID AND ((Computers.ComputerID IN (SELECT DISTINCT c.computerid FROM computers c JOIN agents a ON a.computerid=c.computerid AND a.`Name` = \'ProVal - Production - SMB1 Detection\' JOIN h_agents h ON c.computerid=h.Lastcomputerid AND a.agentid=h.AgentID AND REPLACE(h.LastFailData,\'\\r\\n\', \'\') = \'True\')))',
'4', 
'Computer ID||>=|*(SELECT DISTINCT c.computerid FROM computers c JOIN agents a ON a.computerid=c.computerid AND a.`Name` = \'ProVal - Production - SMB1 Detection\' JOIN h_agents h ON c.computerid=h.Lastcomputerid AND a.agentid=h.AgentID AND REPLACE(h.LastFailData,\'\\r\\n\', \'\') = \'True\')|=||=|^Select|||||||^',
'0', 
'a3890b94-d878-4916-80b3-67b31a8695f4'
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = 'a3890b94-d878-4916-80b3-67b31a8695f4') = 0;
```

```sql
SET @searchid = (SELECT MAX(sensid) FROM sensorchecks WHERE GUID = 'a3890b94-d878-4916-80b3-67b31a8695f4');
```

```sql
# Insert `SMB1 Server Enabled [Remote Monitor]` Group
INSERT INTO `mastergroups` (`ParentID`, `Parents`, `Children`, `depth`, `Name`, `FullName`, `Permissions`, `Template`, `AutoJoinScript`, `Master`, `LimitToParent`, `Control`, `ControlID`, `Notes`, `MaintenanceID`, `MaintWindowApplied`, `GroupType`, `Priority`, `GUID`, `NetworkJoin`, `NetworkJoinOptions`, `ContactJoin`, `ContactJoinOptions`) 
SELECT 
'0',
',',
',',
'0',
'SMB1 Server Enabled [Remote Monitor]',
'SMB1 Server Enabled [Remote Monitor]',
'0',
'0',
@searchid,
'2',
'1',
'0',
'0',
'',
'0',
(NOW()),
'0',
'5',
'e24d9e5e-8d4a-11ee-b15d-960002890dfa',
'0',
'0',
'0',
'0'
FROM (SELECT MIN(computerid) FROM computers) a
WHERE (SELECT COUNT(*) FROM Mastergroups WHERE `GUID` = 'e24d9e5e-8d4a-11ee-b15d-960002890dfa') = 0;
```

```sql
SET @Groupid = (SELECT groupid FROM mastergroups WHERE `GUID` = 'e24d9e5e-8d4a-11ee-b15d-960002890dfa');
```

```sql
# Insert `SMB1 Traffic Detection` Remote Monitor
INSERT INTO groupagents 
SELECT '' AS `AgentID`,
`groupid` AS `GroupID`,
@searchid AS `SearchID`,
'SMB1 Traffic Detection' AS `Name`,
'6' AS `CheckAction`,
'1' AS `AlertAction`,
'SMB1 Traffic Detected on %COMPUTERNAME%~~~SMB1 Traffic not detected.!!!SMB1 Traffic Detected on %COMPUTERNAME%~~~SMB1 Traffic detected on %CLIENTNAME%\\%COMPUTERNAME% in the past 1 hour. 
Details: 
%RESULT%' AS `AlertMessage`,
'0' AS `ContactID`,
'3600' AS `interval`,
'127.0.0.1' AS `Where`,
'7' AS `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "if ( !( (Get-SmbServerConfiguration).AuditSmb1Access ) ) { try { Set-SmbServerConfiguration –AuditSmb1Access $true -Force -confirm:$false -ErrorAction Stop } catch { return \\"Failure Reason: $($Error[0].Exception.Message)\\" } } else {function Get-SMB1AccessLogs { param([int[]]$Level,[int[]]$EventID,[int]$Hours); $filter = @{LogName = \'Microsoft-Windows-SMBServer*\'; Level = $Level};if ($EventID) {$filter.ID = $EventID};if ($Hours) {$filter.StartTime = (Get-Date).AddHours(-$Hours)};try {Get-WinEvent -FilterHashtable $filter -ErrorAction Stop } catch { if ( $Error[0].Exception.Message -match \'No events were found\' ) { return \'No events were found that match the specified selection criteria\'} else { return /"Complete Failure: $($Error[0].Exception.Message)/" } } }; Get-SMB1AccessLogs -Level 4 -EventID 1001,3000 -Hours 1 | Format-List}"' AS `DataOut`,
'16' AS `Comparor`,
'10|(^$)%7C^(\\r\\n%7C\\s%7COK)$%7C(No events were found)|11|(^$)%7C^(\\r\\n%7C\\s%7COK)$%7C(No events were found)%7C(Microsoft-Windows-SMBServer)|10|Microsoft-Windows-SMBServer' AS `DataIn`,
'' AS `IDField`,
'0' AS `AlertStyle`,
'0' AS `ScriptID`,
'' AS `datacollector`,
'21' AS `Category`,
'0' AS `TicketCategory`,
'1' AS `ScriptTarget`,
UUID() AS `GUID`,
'root' AS `UpdatedBy`,
(NOW()) AS `UpdateDate`
FROM mastergroups m
WHERE m.groupid = @groupid
AND m.groupid NOT IN (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'SMB1 Traffic Detection');
```

## Step 2

Perform `Refresh Searches` and `Do Group Refresh` from the `MySQL Server Status` tool.

![Image 1](../../../static/img/Implement--SMB1-Traffic-Detection/image_1.png)
![Image 2](../../../static/img/Implement--SMB1-Traffic-Detection/image_2.png)

## Step 3

Reload the System Cache after a couple of minutes.

## Step 4

Refresh Groups and look for the `SMB1 Server Enabled [Remote Monitor]` group.

## Step 5

Validate the presence of the `SMB1 Traffic Detection` remote monitor in the group.

![Image](../../../static/img/Implement--SMB1-Traffic-Detection/image_3.png)

## Step 6

Apply the `△ Custom - Ticket Creation Computer - Failures Only` alert template to the remote monitor to enable alerting. The alert template should execute the [Ticket Creation - Computer [Failures Only]](<../scripts/Ticket Creation - Computer Failures Only.md>) script for errors/failures.
