---
id: '95f64d6e-cb10-4c2c-9d40-c55941a7d7bc'
slug: /95f64d6e-cb10-4c2c-9d40-c55941a7d7bc
title: 'Import - Remote Monitor - Update Orchestrator - Reboot Prevention [Change]'
title_meta: 'Import - Remote Monitor - Update Orchestrator - Reboot Prevention [Change]'
keywords: ['remote', 'monitor', 'sql', 'query', 'update', 'orchestrator']
description: 'This document outlines the steps to apply a remote monitor in ConnectWise Automate, including obtaining group IDs, running SQL queries, and setting up alerts for monitoring Windows Update Orchestrator services.'
tags: ['database', 'windows']
draft: false
unlisted: false
---

## Steps to Apply Remote Monitor

### 1.
Obtain the group ID(s) of the group(s) that the remote monitor should be applied to.

---

### 2.
Run this SQL query from a RAWSQL monitor set to import the required search:

```sql
INSERT INTO `SensorChecks` (
    `Name`, `SQL`, `QueryType`, `ListDATA`,
    `FolderID`, `GUID`, `SearchXML`
)
SELECT
    'Update Orchestrator - UsoSvc' AS `Name`,
    'SELECT \r\n   computers.computerid as `Computer Id`,\r\n   computers.name as `Computer Name`,\r\n   clients.name as `Client Name`,\r\n   computers.domain as `Computer Domain`,\r\n   computers.username as `Computer User`,\r\n   Services.Name as `Computer.Services.Name`\r\nFROM Computers \r\nLEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)\r\nLEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)\r\nLEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)\r\nLEFT JOIN Services ON (services.ComputerId = Computers.ComputerId)\r\n WHERE \r\n((Services.Name = \'UsoSvc\'))\r\n' AS `SQL`,
    '4' AS `QueryType`,
    'Select||=||=||=|^Select|||||||^' AS `ListData`,
    '0' AS `FolderID`,
    '04a11d92-3269-4ab1-a634-43d405e37b8b' AS `GUID`,
    '<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Services.Name</lon><lok>Computer.Services.Name</lok><lmo>Equals</lmo><dv>UsoSvc</dv><dk>UsoSvc</dk></asn></cn></asn></LabTechAbstractSearch>' AS `SearchXML`
FROM
    (
        SELECT
            MIN(computerid)
        FROM
            computers
    ) a
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            SensorChecks
        WHERE
            `GUID` = '04a11d92-3269-4ab1-a634-43d405e37b8b'
    ) = 0;
```

---

### 3.
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Group ID(s) of the relevant groups:
(The string to replace can be found at the very bottom of the query, right after **WHERE**)

```sql
SET @searchid = IFNULL(( SELECT MIN(SensID) From sensorchecks where `GUID` = '04a11d92-3269-4ab1-a634-43d405e37b8b' ), 0);
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@Searchid as `SearchID`,
'ProVal - Production - Update Orchestrator - Reboot Prevention [Change]' as `Name`,
'6' as `CheckAction`,
'0' as `AlertAction`,
'Windows update Orchestrator Monitor - Failed - %ComputerName%~~~Successfully renamed the reboot file.!!!Windows update Orchestrator Monitor - Failed - %ComputerName%~~~The reboot file at "C:\\Windows\\System32\\Tasks\\Microsoft\\Windows\\UpdateOrchestrator\\reboot" failed to be renamed. The update orchestrator uses this file; it should either be deleted or renamed to prevent the update orchestrator from restarting the computer at any moment.' as `AlertMessage`,
'0' as `ContactID`,
'600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ConfirmPreference = \'None\'; if (( Get-Service -Name \'UsoSvc\' ).StartType -ne \'Automatic\' ) { Set-Service -Name \'UsoSvc\' -StartupType \'Automatic\'}; $RebootPath = \\"$env:windir\\System32\\Tasks\\Microsoft\\Windows\\UpdateOrchestrator\\reboot\\"; $BakPath = \\"$env:windir\\System32\\Tasks\\Microsoft\\Windows\\UpdateOrchestrator\\reboot.bak\\"; if (Test-Path $RebootPath) {Remove-Item -Path $BakPath -Force -ErrorAction SilentlyContinue; try {Move-Item -Path $RebootPath -Destination $BakPath -Force -Confirm:$False -ErrorAction Stop; }catch{return \'Failed to rename the reboot file\'}}"' as `DataOut`,
'9' as `Comparor`,
'Failed to rename the reboot file' as `DataIn`,
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Update Orchestrator - Reboot Prevention [Change]')
```

---

### 4.
An example of a query with a group ID:

```sql
SET @searchid = IFNULL(( SELECT MIN(SensID) From sensorchecks where `GUID` = '04a11d92-3269-4ab1-a634-43d405e37b8b' ), 0);
INSERT INTO groupagents 
 SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@Searchid as `SearchID`,
'ProVal - Production - Update Orchestrator - Reboot Prevention [Change]' as `Name`,
'6' as `CheckAction`,
'0' as `AlertAction`,
'Windows update Orchestrator Monitor - Failed - %ComputerName%~~~Successfully renamed the reboot file.!!!Windows update Orchestrator Monitor - Failed - %ComputerName%~~~The reboot file at "C:\\Windows\\System32\\Tasks\\Microsoft\\Windows\\UpdateOrchestrator\\reboot" failed to be renamed. The update orchestrator uses this file; it should either be deleted or renamed to prevent the update orchestrator from restarting the computer at any moment.' as `AlertMessage`,
'0' as `ContactID`,
'600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ConfirmPreference = \'None\'; if (( Get-Service -Name \'UsoSvc\' ).StartType -ne \'Automatic\' ) { Set-Service -Name \'UsoSvc\' -StartupType \'Automatic\'}; $RebootPath = \\"$env:windir\\System32\\Tasks\\Microsoft\\Windows\\UpdateOrchestrator\\reboot\\"; $BakPath = \\"$env:windir\\System32\\Tasks\\Microsoft\\Windows\\UpdateOrchestrator\\reboot.bak\\"; if (Test-Path $RebootPath) {Remove-Item -Path $BakPath -Force -ErrorAction SilentlyContinue; try {Move-Item -Path $RebootPath -Destination $BakPath -Force -Confirm:$False -ErrorAction Stop; }catch{return \'Failed to rename the reboot file\'}}"' as `DataOut`,
'9' as `Comparor`,
'Failed to rename the reboot file' as `DataIn`,
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
WHERE m.groupid IN (2,3,855,856)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Update Orchestrator - Reboot Prevention [Change]')
```

---

### 5.
Now execute your query from a RAWSQL monitor set.  
Once the query is executed, reload the control center.

![Control Center](../../../static/img/docs/95f64d6e-cb10-4c2c-9d40-c55941a7d7bc/image_1.webp)

Then re-open the group where the monitor is created.  
The monitor will come up with the search `Update Orchestrator - UsoSvc` added to the LIMIT.

---

### 6.
Locate your remote monitor by opening the group(s) remote monitors tab, then apply the appropriate alert template.