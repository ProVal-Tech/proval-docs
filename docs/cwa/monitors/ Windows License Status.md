---
id: 'cwa-windows-license-status-monitor-setup'
title: 'Setting Up a Windows License Status Monitor'
title_meta: 'Setting Up a Windows License Status Monitor'
keywords: ['windows', 'monitor', 'license', 'status', 'setup']
description: 'This document provides a step-by-step guide on how to set up a Windows License Status monitor in ConnectWise Automate. It includes instructions for importing alert templates, running SQL queries, obtaining group IDs, and configuring the monitor with the appropriate settings for Windows machines.'
tags: ['monitoring', 'sql', 'configuration', 'alert', 'windows']
draft: false
unlisted: false
---
## Step 1
Import the Alert Template `△ Custom - Ticket Creation Computer - Warning and Failed`.

---

## Step 2
Run this SQL query from a RAWSQL monitor set to import the required search:

```sql
INSERT INTO `sensorchecks` (`Name`, `SQL`, `QueryType`, `ListDATA`, `FolderID`, `GUID`, `SearchXML`)
SELECT
    'Windows Machines - Excluding End-of-Life Windows Machines',
    'SELECT
        computers.computerid as `Computer Id`,
        computers.name as `Computer Name`,
        clients.name as `Client Name`,
        computers.domain as `Computer Domain`,
        computers.username as `Computer User`,
        IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'windows\')>0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'darwin\') >0, 2, 3)) as `Computer.OS.Type`,
        inv_operatingsystem.name as `Computer.OS.Name`
    FROM Computers
    LEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)
    LEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)
    LEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)
    WHERE
        (
            (
                (
                    IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'windows\')>0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'darwin\') >0, 2, 3)) = \'1\'
                )
                AND
                (
                    NOT ((inv_operatingsystem.name like \'%Windows XP%\'))
                    AND
                    NOT ((inv_operatingsystem.name like \'%2003%\'))
                    AND
                    NOT ((inv_operatingsystem.name like \'%2011%\'))
                    AND
                    NOT ((inv_operatingsystem.name like \'%Windows 7%\'))
                    AND
                    NOT ((inv_operatingsystem.name like \'%2008%\'))
                    AND
                    NOT ((inv_operatingsystem.name like \'%Windows 8%\'))
                    AND
                    NOT ((inv_operatingsystem.name like \'%2012%\'))
                )
            )
        )',
    4,
    'Select||=||=||=|^Select|||||||^',
    3,
    'b7768144-8137-48e9-aea7-48ef11f341b1',
    '<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Type</lon><lok>Computer.OS.Type</lok><lmo>Equals</lmo><dv>Windows</dv><dk>1</dk></asn><asn><st>NotNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Name</lon><lok>Computer.OS.Name</lok><lmo>TextLike</lmo><dv>%Windows XP%</dv><dk>%Windows XP%</dk></asn></cn></asn><asn><st>NotNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Name</lon><lok>Computer.OS.Name</lok><lmo>TextLike</lmo><dv>%2003%</dv><dk>%2003%</dk></asn></cn></asn><asn><st>NotNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Name</lon><lok>Computer.OS.Name</lok><lmo>TextLike</lmo><dv>%2011%</dv><dk>%2011%</dk></asn></cn></asn><asn><st>NotNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Name</lon><lok>Computer.OS.Name</lok><lmo>TextLike</lmo><dv>%Windows 7%</dv><dk>%Windows 7%</dk></asn></cn></asn><asn><st>NotNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Name</lon><lok>Computer.OS.Name</lok><lmo>TextLike</lmo><dv>%2008%</dv><dk>%2008%</dk></asn></cn></asn><asn><st>NotNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Name</lon><lok>Computer.OS.Name</lok><lmo>TextLike</lmo><dv>%Windows 8%</dv><dk>%Windows 8%</dk></asn></cn></asn><asn><st>NotNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.OS.Name</lon><lok>Computer.OS.Name</lok><lmo>TextLike</lmo><dv>%2012%</dv><dk>%2012%</dk></asn></cn></asn></cn></asn></cn></asn></LabTechAbstractSearch>'
FROM
    (SELECT MIN(computerid) FROM computers) a
WHERE
    (SELECT COUNT(*) FROM SensorChecks WHERE `GUID` = 'b7768144-8137-48e9-aea7-48ef11f341b1') = 0;
```

---

## Step 3
Obtain the groupid(s) of the group(s) that the remote monitor should be applied to.

---

## Step 4
Copy the following query and replace **YOUR COMMA SEPARATED LIST OF GROUPID(S)** with the Groupid(s) of the relevant groups: (The string to replace can be found at the very bottom of the query, right after **WHERE**).

```sql
SET @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = 'b7768144-8137-48e9-aea7-48ef11f341b1');

INSERT INTO groupagents
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@searchid as `SearchID`,
'ProVal - Production - Windows License Status' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Windows License Status FAILED on %CLIENTNAME%\\%COMPUTERNAME%~~~Windows License Status for %CLIENTNAME%\\%COMPUTERNAME%: %Result%` as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference = \'SilentlyContinue\'; ( Get-Ciminstance -Class SoftwareLicensingProduct -Filter \"Name LIKE \'Windows%\'\" | Where-Object {$_.PartialProductKey} | Select-Object @{ label=\'LStatus\' ; expression= { switch ( $_.LicenseStatus ) { 0 { \'Unlicensed\' };  1 { \'Licensed\' }; 2 { \'OOBGrace\' }; 3 { \'OOTGrace\' }; 4 { \'NonGenuineGrace\' }; 5 { \'Notification\' }; 6 { \'ExtendedGrace\' } } } } ).Lstatus"' as `DataOut`,
'16' as `Comparor`,
'10|^Licensed|10|^((OO[BT]%7CExtended)Grace%7CNotification)|10|^(Unlicensed%7CNonGenuineGrace)' as `DataIn`,
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
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
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
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Windows License Status');
```

---

## Step 5
An example of the query with groupids and modified thresholds:

```sql
SET @searchid = (SELECT sensid FROM sensorchecks WHERE `GUID` = 'b7768144-8137-48e9-aea7-48ef11f341b1');

INSERT INTO groupagents
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@searchid as `SearchID`,
'ProVal - Production - Windows License Status' as `Name`,
'6' as `CheckAction`,
'1' as `AlertAction`,
'Windows License Status FAILED on %CLIENTNAME%\\%COMPUTERNAME%~~~Windows License Status for %CLIENTNAME%\\%COMPUTERNAME%: %Result%` as `AlertMessage`,
'0' as `ContactID`,
'86400' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference = \'SilentlyContinue\'; ( Get-Ciminstance -Class SoftwareLicensingProduct -Filter \"Name LIKE \'Windows%\'\" | Where-Object {$_.PartialProductKey} | Select-Object @{ label=\'LStatus\' ; expression= { switch ( $_.LicenseStatus ) { 0 { \'Unlicensed\' };  1 { \'Licensed\' }; 2 { \'OOBGrace\' }; 3 { \'OOTGrace\' }; 4 { \'NonGenuineGrace\' }; 5 { \'Notification\' }; 6 { \'ExtendedGrace\' } } } } ).Lstatus"' as `DataOut`,
'16' as `Comparor`,
'10|^Licensed|10|^((OO[BT]%7CExtended)Grace%7CNotification)|10|^(Unlicensed%7CNonGenuineGrace)' as `DataIn`,
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
WHERE m.groupid IN (121,123)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal - Production - Windows License Status');
```

---

## Step 6
Check the concerned groups, ensure the monitor set is created and configured with the correct search.  
**Limit to:** `Windows Machines - Excluding End-of-Life Windows Machines`

![Image](..\..\..\static\img\-Windows-License-Status\image_1.png)

---

## Step 7
Set the alert template to `△ Custom - Ticket Creation Computer - Warning and Failed` on the monitor.

![Image](..\..\..\static\img\-Windows-License-Status\image_2.png)


